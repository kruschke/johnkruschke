function [  ] = SigmoidLocalBayes( ...
   RunName, localUpdate, CueLabel, OutLabel, TrainItem, TestItem, ...
   wOutMeanString )
%
% Matlab code by John K. Kruschke for simulations in the article:
% Kruschke, J. K. (2006). Locally Bayesian learning with applications to
% retrospective revaluation and highlighting. Psychological Review.
%
% This program implements a two-layer network architecture that can do
% either local or global Bayesian updating. See the article cited above for
% details.
%
% List of arguments for this function:
%
% RunName is a string that is used for naming figures that are saved during
% the running of the program.
%
% localUpdate is ~0 if Bayesian updating is to be done locally within
% layers. If localUpdate is 0, then Bayesian updating is done on the joint
% (i.e., global) hypothesis space.
%
% CueLabel is a cell array with nCues components, with each cell holding a
% string that specifies a label for the corresponding input cue.
%
% OutLabel is a cell array with 1 component, a cell holding a
% string that specifies a label for the output node at its +1 value.
%
% TrainItem holds stimulus-outcome training items, one row per training
% trial. N.B.: This version of the program assumes that there is only one
% output node. Therefore the TrainItem array must be nTrials x
% (nCues+nOutputs) = nTrials x (nCues+1).
%
% TestItem holds stimulus items for testing (after every training trial).
% Because there are no target outcomes, TestItem is nTestItems x nCues.
%
% wOutMeanString is a string that specifies the mean for the distribution
% of output weights. This allows some flexibility, e.g., one could use
% '-1.0 * wOutSD' . But typically it will just be '0.0' .
%
% Example of how to invoke this function:
% >>   RunName = 'CrashTestDummy' ;
% >>   localUpdate = 1 ;
% >>   CueLabel = { 'A' 'B' 'C' } ;
% >>   OutLabel = { 'X' } ;
% >>   TrainItem = [ ...
% >>      1 0 0  1 ; ...
% >>      1 0 0  1 ; ...
% >>      1 1 1  0 ; ...
% >>      1 1 1  0  ...
% >>      ];
% >>   TestItem = [ ...
% >>      1 0 0 ; ...
% >>      0 1 0 ...
% >>      ];
% >>   wOutMeanString = '(-1.0 * wOutSD)' ;
% >>   LocalBayesExitRev2( RunName, localUpdate, CueLabel, OutLabel, ...
% >>      TrainItem, TestItem, wOutMeanString )
%
% Output consists entirely of graphs, on screen and saved to disk using
% RunName as the base of the filename.
%
% ------------------------------------------------------------------------

% Notify user that program has been invoked.
fprintf(1,['\n\n\n' ...
   '----- SigmoidLocalBayes called --------------------------------\n']);

% Extract the number of cues from the training patterns, and check for
% consistency across various arguments.
% nCol and nRow are functions defined at the end of the program.
global nOutcomes ;
nOutcomes = nCol(TrainItem) - nCol(TestItem) ;
if nOutcomes ~= 1
   error(' ** Number of output nodes must be 1. ** ');
   return;
end
nCues = nCol(TrainItem) - nOutcomes ;
if length(CueLabel) ~= nCues
   error(' ** Cue Label length does not match Training Items. ** ');
   return;
end
nTrials = nRow(TrainItem);
% Check that teacher values are only 1's and 0's.
teachers = TrainItem(:,end) ;
if any( ( teachers ~= 1 ) & ( teachers ~= 0 ) )
   error(' ** Teacher values must be 1 or 0. ** ');
   return;
end

% Construct label strings for test items.
TestLabel = {} ;
nTests = nRow(TestItem) ;
for testIdx = 1 : nTests
   thisItem = TestItem( testIdx, : );
   thisItemString = '';
   for cueIdx = 1 : nCues
      if thisItem(cueIdx) == 1
         thisItemString = [ thisItemString '.' CueLabel{cueIdx} ] ;
      end
   end
   thisItemString = thisItemString(2:end) ; % deletes initial '.'
   TestLabel = [ TestLabel ; {thisItemString} ];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin construction of hypothesis spaces.

% Just because it's easier to understand "if globalUpdate" than "if
% localUpdate == 0"...
if localUpdate == 0 , globalUpdate = 1 ;
else , globalUpdate = 0 ; end

% Specify number of hidden nodes. Here its the same as the number of cues,
% because the hidden nodes are supposed to be attentionally gated copies of
% the cues.
global nHid ; nHid = nCues ;

% In the present situation, the hypotheses are different combinations of
% associative weights. There is one hypothesis space for weights from
% exemplars to attention nodes, and a second hypothesis space for weights
% from cues to the outcome node. If localUpdate is 0, those two hypothesis
% spaces get Cartesian-crossed to form a large joint hypothesis space.

% Build output weight hypotheses...
% Specify comb (1D grid) over output weights:
wOutSD = 5.0 ;
wOutMean = eval(wOutMeanString) ;
dwOut = wOutSD * 1.0/1.0 ;
wOutMin = -1.0 * wOutSD ;
wOutMax = 1.0 * wOutSD ;
global wOutComb ;
wOutComb = wOutMin : dwOut : wOutMax ; % row vector
% Each row of wOutHyp (defined below) contains a vector that holds the
% nHid*nOutcomes values of the weights. (In general, there could also be
% outcome node thresholds specified, but here I assume that the single
% outcome node always has threshold of zero.)
global wOutHyp wOutHypProb ;
wOutHyp = zeros( length(wOutComb)^(nHid*nOutcomes) , nHid*nOutcomes );
fprintf(1,' Outcome weights involve %d hypotheses\n', nRow(wOutHyp) );
% Fill in the hypotheses in two parts. First part is to set up index
% values that step through all combinations, odometer style. Function
% odomInc is defined at end of file.
currOdomVal = ones(1, nHid*nOutcomes ); % initialize
maxOdomVal = length(wOutComb)*ones(1, nHid*nOutcomes);
for hypIdx = 1 : size(wOutHyp,1) ,
   wOutHyp( hypIdx , : ) =  currOdomVal ;
   currOdomVal = odomInc( currOdomVal, maxOdomVal ) ;
end
% Now replace the index values with corresponding weight values:
wOutHyp =  wOutComb( wOutHyp ) ;
% Having established all the hypotheses for the output weights, now compute
% the prior probability of each. Here I assume a normal density, but this
% is not crucial.
wOutHypProb = ones( nRow(wOutHyp) ,1);
for hypIdx = 1 : length( wOutHypProb ) ,
   wOutHypProb( hypIdx ) = prod( ...
      normalpdf( wOutHyp(hypIdx,:), wOutMean, wOutSD ) ) ;
end
% Normalize the prior probabilities so they sum to 1.0
wOutHypProb = wOutHypProb / sum( wOutHypProb );

% % For debugging and/or watching the pretty lights:
% % Show the hypotheses and probabilities.
% fprintf(1,'Outcome weight hypotheses. Probability followed by weights:')
% [ wHidOutProb , wOutHyp ]

% Specify prior probability of hidden weights.
global wHidComb wHidHyp wHidHypProb ;
% wHidHyp has one row per hypothesis. The first nCues columns are the
% fan-in weights of the first hidden node from the cues. The second nCues
% columns are the fan-in weights of the second hidden node. There are as
% many hidden nodes as input cues. The idea here is that each hidden node
% corresponds to an attentionally filtered version of the corresponding
% input node. This is accomplished by making the j-th fan-in weight of the
% j-th hidden node large compared to the others weights fanning into the
% node, so that the hidden node tends to be selectively activated by the
% corresponding cue. /
% The j-th hidden node can have weights of 4 or 6 from the j-th cue, and
% weights of -4, (-2,) 0, (2) from other cues. Why those values? Simply
% because I found that one hypothesis that shows highlighting very nicely
% is    4,  2,  0,    2,  4, -4,    0,  0,  6 ;
% Unfortunately, with positive cross connections, backward blocking is
% killed because the network hallucinates the presence of cue B in the
% second phase, so the +2 value needs to get lost. This reduces the
% highlighting effect, but it's still there. /
% Set up weights for the first hidden node. This puts the "key" 1-to-1 cue
% weights in the first column, and the lateral weights in the remaining
% columns.
keyCueWts = [ 4 6 ] ;
otherCueWts = [ -4 0 ] ;
wHidComb = unique( [ keyCueWts otherCueWts ] ) ;
% Put weight indices in the hidNodeHyp array, using odometer incrementing.
currOdom = ones(1,nCues);
maxOdom = [ length(keyCueWts) length(otherCueWts)*ones(1,nCues-1) ];
hidNodeHyp = zeros( ...
   length(keyCueWts)*length(otherCueWts)^(nCues-1), nCues );
rowIdx = 1 ;
while ( currOdom ) % relies on odomInc returning zeros after max.
   hidNodeHyp( rowIdx, : ) = currOdom ;
   rowIdx = rowIdx + 1;
   currOdom = odomInc( currOdom, maxOdom ) ;
end
% Convert the weight indices to the actual weights.
hidNodeHyp(:,1) = keyCueWts( hidNodeHyp(:,1) ) ;
hidNodeHyp(:,2:end) = otherCueWts( hidNodeHyp(:,2:end) ) ;
% Now create an overall hidden node hypothesis set by cycling through the
% single-node hidNodeHyp array and concatenating appropriately.
nHid = nCues ;
currOdom = ones(1,nHid);
maxOdom = nRow(hidNodeHyp)*ones(1,nHid);
wHidHyp = zeros( nRow(hidNodeHyp)^nHid , nCues*nHid );
fprintf(1,' Hidden weights involve %d hypotheses\n', nRow(wHidHyp) );
rowIdx = 1 ;
while ( currOdom )
   for hidIdx = 1 : nHid ;
      permuteColIdx = [ 2:hidIdx 1 hidIdx+1:nHid ] ;
      wHidHyp( rowIdx, 1+(hidIdx-1)*nCues : nCues*hidIdx ) = ...
         hidNodeHyp( currOdom(hidIdx) , permuteColIdx ) ;
   end
   rowIdx = rowIdx + 1;
   currOdom = odomInc( currOdom, maxOdom ) ;
end
% Set prior probabilities of hidden weight hypotheses. Here it's just
% uniform. Not crucial.
wHidHypProb = ones( nRow(wHidHyp), 1 ) ;
% Normalize the prior probabilities so they sum to 1.0
wHidHypProb = wHidHypProb / sum( wHidHypProb );

% % For debugging and/or watching the pretty lights:
% % Show the hypotheses and probabilities.
% fprintf(1,'Hidden weight hypotheses. Probability followed by weights:')
% [ wHidHypProb , wHidHyp ]

% If doing global updating instead of local, construct the global
% hypothesis space. This just combines every output hypothesis with every
% hidden hypothesis, and stuffs it all into one big array.
if globalUpdate
   global wGlobalHyp wGlobalHypProb ;
   wGlobalHyp = zeros( nRow(wOutHyp) * nRow(wHidHyp) , ...
      nCol(wOutHyp) + nCol(wHidHyp) ) ;
   wGlobalHypProb = zeros( nRow(wGlobalHyp) , 1 ) ;
   fprintf(1,'  Global space involves %d hypotheses\n',nRow(wGlobalHyp));
   rowIdx = 1 ;
   for outIdx = 1 : nRow(wOutHyp)
      for hidIdx = 1 : nRow(wHidHyp)
         wGlobalHyp(rowIdx,: ) = [ wOutHyp(outIdx,:) wHidHyp(hidIdx,:) ] ;
         wGlobalHypProb(rowIdx,: ) = ...
            wOutHypProb(outIdx) * wHidHypProb(hidIdx)  ;
         rowIdx = rowIdx + 1 ;
      end
   end
   % Notice that wGlobalHypProb should already be normalized if wOutHypProb
   % and wHidHypProb were themselves properly normalized.
end % if globalUpdate

% End construction of hypothesis spaces.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize item storage (for plotting, not for Bayesian algorithm). One
% row per item.
itemSoFar = zeros( 0, nCol(TrainItem) ) ;

figure(1)
clf
set(gcf,'Units','normalized')
set(gcf,'Position',[ 0.05 0.40 0.90 0.50 ]);
set(gcf,'PaperPositionMode','auto')

% Trial loop, below, goes to nTrials + 1 because initial state counts as a
% cycle through the loop.
for trialIdx = 1 : nRow(TrainItem) + 1

   % Clear figure at beginning of trial.
   clf

   % Display, in the figure, a list of items trained so far.
   subplot(1,4,1)
   plot(0,0,'-')
   set(gca,'FontName','Times','FontSize',12);
   xlim([0 1])
   ylim([0 1])
   axis off
   CueList = '' ;
   for cueIdx = 1 : nCues
      CueList = [ CueList '  ' CueLabel{cueIdx} ] ;
   end
   title({ 'Data entered:' ; ['[' CueList '  ' OutLabel{1} ' ]'] } ...
      ,'VerticalAlignment','middle')
   if nRow(itemSoFar)>0
      text(0.5,0.96,num2str(itemSoFar) ...
         ,'FontWeight','bold' ...
         ,'HorizontalAlignment','center' ...
         ,'VerticalAlignment','top')
   else
      text(0.5,0.96,'(none)' ...
         ,'FontWeight','bold' ...
         ,'HorizontalAlignment','center' ...
         ,'VerticalAlignment','top')
   end
   if localUpdate
      text(0.0,0.5,'LOCAL' ...
         ,'FontName','Times','FontSize',14 ...
         ,'Rotation',90 ...
         ,'HorizontalAlignment','center' ...
         ,'VerticalAlignment','middle')
   else
      text(0.0,0.5,'GLOBAL' ...
         ,'FontName','Times','FontSize',14 ...
         ,'Rotation',90 ...
         ,'HorizontalAlignment','center' ...
         ,'VerticalAlignment','middle')
   end

   drawnow

   % Compute the marginal probabilities of output weights. The array
   % PwOutMarg has one column for each weight fanning into the single
   % output node, and PwOutMarg and one row for each possible value of the
   % weight. Hence it has nHid columns and length(wOutComb) rows. The c-th
   % column contains the marginal probabilities of each possible value of
   % the c-th fan-in weight.
   PwOutMarg = zeros( length(wOutComb) , nHid );
   if localUpdate
      for hidIdx = 1 : nHid
         for valIdx = 1 : length(wOutComb)
            % Find all the hypotheses with that weight value...
            rowIdx = ( wOutHyp(:,hidIdx) == wOutComb(valIdx) ) ;
            % ... and add up their probabilities.
            PwOutMarg(valIdx,hidIdx) = sum( wOutHypProb( rowIdx ) ) ;
         end
      end
   end % if localUpdate
   if globalUpdate
      % The first nHid columns of wGlobalHyp are the output weights.
      for hidIdx = 1 : nHid
         for valIdx = 1 : length(wOutComb)
            % Find all the hypotheses with that weight value...
            rowIdx = ( wGlobalHyp(:,hidIdx) == wOutComb(valIdx) ) ;
            % ... and add up their probabilities.
            PwOutMarg(valIdx,hidIdx) = sum( wGlobalHypProb( rowIdx ) ) ;
         end
      end
   end % if globalUpdate

   % Plot marginal probabilities of output weights.
   subplot(1,4,2)
   % Construct marker types (marker type increments to indicate hid node):
   lineStr = { '-' '--' ':' '-.' };
   markerStr = { 'd' 's' 'o' 'v' '^' };
   colorStr = { 'g' 'b' 'r' 'k' };
   markerType = [];
   for hidIdx = 1 : nHid
      markerType = [ markerType ; { [ ...
         lineStr{ 1 }...
         markerStr{ mod(hidIdx-1,length(markerStr))+1 }...
         colorStr{ 4 }...
         ] } ] ;
   end
   hold on
   for hidIdx = 1 : nHid
      plot( wOutComb ,PwOutMarg(:,hidIdx) ,markerType{hidIdx} ...
         ,'LineWidth',2 ,'MarkerSize',9 )
   end
   hold off
   set(gca,'FontName','Times','FontSize',12);
   legendString = {};
   for hidIdx = 1 : nHid
      legendString{hidIdx} = [ OutLabel{1} '\leftarrow' ...
         'hid' CueLabel{hidIdx} ];
   end
   legend(...
      legendString ...
      ,'Location','SouthOutside')
   ylims = ylim;
   %ylim([0 ylims(2)])
   ylim([-0.02 1])
   xlim([min(wOutComb)-dwOut/2 max(wOutComb)+dwOut/2])
   xlabel('Weight Value')
   ylabel('Marginal P(w)')
   title('Outcome Weights')
   drawnow

   % Compute the marginal probabilities of hidden weights. / Recall that
   % each row of wHidHyp is a hypothesis; the row contains a vector that
   % holds the nHid*nCues values of the weights for a hypothesis. The first
   % nCues columns refer to the fan-in to the first hidden node, the next
   % nCues columns refer to the fan-in from the second hidden node, etc. /
   % The new array wHidMarg has the same number of columns as wHidHyp, with
   % column i + (j-1)*nCues referring to the i-th weight of the j-th hidden
   % node, just like wHidHyp. The number of rows of wHidMarg is
   % length(wHidComb), i.e., the number of possible values that an
   % attention weight can have. Each row contains the marginal probability
   % of that weight value.
   wHidMarg = zeros( length(wHidComb) , nHid*nCues ) ;
   if localUpdate
      for hidIdx = 1 : nHid
         for cueIdx = 1 : nCues
            % Determine the column index of the hidden weight being worked
            % on.
            wtIdx = cueIdx + (hidIdx-1)*nCues ;
            for wtValIdx = 1 : length( wHidComb )
               % Find all the hypotheses with value wHidComb(wtValIdx) in
               % column wtIdx.
               rowIdx = ( wHidHyp(:,wtIdx) == wHidComb(wtValIdx) );
               % Add up the probabilities of those hypothesis.
               wHidMarg(wtValIdx,wtIdx) = sum( wHidHypProb( rowIdx ) );
            end
         end
      end
   end % if localUpdate
   if globalUpdate
      for hidIdx = 1 : nHid
         for cueIdx = 1 : nCues
            % Determine the column index of the hidden weight being worked
            % on.
            wtIdx = cueIdx + (hidIdx-1)*nCues ;
            for wtValIdx = 1 : length( wHidComb )
               % Find all the hypotheses with value wHidComb(wtValIdx) in
               % column of wGlobalHyp that corresponds to wtIdx. The
               % columns of wGlobalHyp for the hidden weights start after
               % the columns for the output weights. There are nHid*nOut
               % columns for the output weights, so wtIdx has to add that
               % as an initial offset.
               rowIdx = ( ...
                  wGlobalHyp(:,(nHid*nOutcomes)+wtIdx) ...
                  == wHidComb(wtValIdx) );
               % Add up the probabilities of those hypothesis.
               wHidMarg(wtValIdx,wtIdx) = sum( wGlobalHypProb( rowIdx ) );
            end
         end
      end
   end % if globalUpdate

   % Plot the marginal probabilities of hidden weights.
   subplot(1,4,3)
   % Construct marker types. Line type and color increment together,
   % indicate cue (source) node.  Marker type
   % indicates hidden (destination) node.
   lineStr   = { '-' '--' ':' '-.'     };
   colorStr  = { 'k' 'b' 'r'  'g'      };
   markerStr = { 'o' '+' 's'   'd' 'h' 'p'  '<' 'x' '>' };
   markerType = [];
   for toIdx = 1 : nHid
      for fromIdx = 1 : nCues
         markerType = [ markerType ; { [ ...
            lineStr{ mod(fromIdx-1,length(lineStr))+1 }...
            markerStr{ ...
            mod(fromIdx+(toIdx-1)*nCues-1,length(markerStr))+1}...
            colorStr{ mod(fromIdx-1,length(colorStr))+1 }...
            ] } ] ;
      end
   end
   % Plot curves.
   hold on
   colIdx = 0 ;
   for toIdx = 1 : nHid
      for fromIdx = 1 : nCues
         colIdx = colIdx + 1 ;
         plot( wHidComb ,wHidMarg(:,colIdx) ,markerType{colIdx} ...
            ,'LineWidth',2 ,'MarkerSize',9 )
      end
   end
   hold off
   set(gca,'FontName','Times','FontSize',12);
   % Make legend for plot.
   legendString = {};
   legIdx = 0;
   for toIdx = 1 : nHid
      for fromIdx = 1 : nCues
         legIdx = legIdx + 1;
         legendString{legIdx} = ...
            [ 'hid' CueLabel{toIdx} '\leftarrow' CueLabel{fromIdx} ];
      end
   end
   legend(...
      legendString ...
      ,'Location','SouthOutside')
   % Tweek axes.
   ylims = ylim;
   %ylim([0 ylims(2)])
   ylim([-0.02 1])
   xlim([min(wHidComb)-1 max(wHidComb)+1])
   xlabel('Weight Value')
   ylabel('Marginal P(w)')
   title('Hidden Weights')
   drawnow;

   % Compute the predictions for the test items.
   fprintf(1,'  Computing test probe predictions...\n');
   nTests = nRow(TestItem) ;
   outTest = zeros(1, nTests );
   for testIdx = 1 : nTests ;
      fprintf(1,'    Test item %d...\n', testIdx );
      invec = TestItem( testIdx , : ) ;
      if localUpdate
         hidvec = margHid( invec );
         outTest( testIdx ) = margOut( hidvec );
         fprintf(1,'    in:' );
         fprintf(1,' %d', invec );
         fprintf(1,'   hid:');
         fprintf(1,' %4.2f', hidvec );
         fprintf(1,'  out: %4.2f \n', outTest(testIdx) );
      end % if localUpdate
      if globalUpdate
         outTest( testIdx ) = globalMargOut( invec );
      end % if globalUpdate
   end

   % Plot the predictions for the test items.
   subplot(1,4,4)
   bar( outTest ,.5 ,'y')
   set(gca,'FontName','Times','FontSize',12);
   xlim([ 0.5 nTests+0.5 ])
   ylim([ 0 1.0 ])
   ylabel(['Marginal P(' OutLabel{1} ')'])
   set(gca,'XTick',1:nTests)
   set(gca,'XTickLabel', TestLabel )
   xlabel('Test Item')
   title('Overt Behavior')
   drawnow

   % Save the current graph.
   filenamebase = RunName;
   if localUpdate
      filenamebase = [ filenamebase '' ] ;
   else
      filenamebase = [ filenamebase 'Global' ] ;
   end
   print('-depsc2',[ filenamebase num2str(nRow(itemSoFar),'%2.0f') ...
      '.eps' ]) ;

   % If finished with all training items then stop (i.e., return). The rest
   % of the cycle would grab another training item, which doesn't exist.
   % But the previous steps had be done so that the probe items could be
   % tested after the last training item.
   if trialIdx == nRow(TrainItem)+1 ;
      return ;
   end

   % Get next datum from TrainItem array.
   datum = TrainItem(trialIdx,:) ;
   fprintf(1,'==== Trial %2d\n', trialIdx);
   itemSoFar = [ itemSoFar ; datum ] ;

   if globalUpdate
      inAct = TrainItem( trialIdx, 1:end-1 ) ;
      teach = TrainItem( trialIdx, end ) ;
      GlobalLikelihood = zeros( size(wGlobalHypProb) );
      % Build array of possible hidden states: all 0/1 possibilities.
      possHidAct = zeros( 2^nHid , nHid );
      currOdomVal =   ones( 1, nHid ) ;
      maxOdomVal  = 2*ones( 1, nHid ) ;
      for hypIdx = 1 : nRow(possHidAct) ,
         possHidAct( hypIdx , : ) =  currOdomVal ;
         currOdomVal = odomInc( currOdomVal, maxOdomVal ) ;
      end
      possHidAct = possHidAct - 1 ; % convert from 2/1 to 1/0.

      % Now cycle through all possible global hypotheses...
      for hypIdx = 1 : nRow(wGlobalHyp)

         % Build a column vector of prob(teach) for the possible hidden
         % states, using the output weights of the current hypothesis.
         thisHypOutWt = wGlobalHyp(hypIdx,1:nHid) ;
         probTeachGivenHidAct = zeros( nRow(possHidAct) , 1 );
         for stateIdx = 1 : nRow(possHidAct)
            probTeachEq1 = sigmoid( ...
               thisHypOutWt * possHidAct(stateIdx,:)' );
            probTeachGivenHidAct( stateIdx ) = ...
               probTeachEq1 .^ teach * (1-probTeachEq1) .^ (1-teach) ;
         end

         % Build a column vector of prob(hidden state), using the hidden
         % weights of the current hypothesis.
         thisHypHidWt = wGlobalHyp(hypIdx,nHid+1:end) ;
         thisHypHidAct = hidAct( thisHypHidWt, inAct ) ;
         probHidActGivenInAct = zeros( nRow(possHidAct) , 1 );
         for stateIdx = 1 : nRow( possHidAct )
            probHidActGivenInAct( stateIdx ) = prod( ...
               thisHypHidAct .^ possHidAct(stateIdx,:) ...
               .* (1-thisHypHidAct) .^ (1-possHidAct(stateIdx,:)) ...
               );
         end

         % Marginalize across possible hidden states to get prob(teach) for
         % the current global hypothesis.
         thisHypProbTeach = sum( ...
            probTeachGivenHidAct .* probHidActGivenInAct ) ;

         GlobalLikelihood( hypIdx ) = thisHypProbTeach ;

      end
      wGlobalHypProb = GlobalLikelihood .* wGlobalHypProb ;
      wGlobalHypProb = wGlobalHypProb / sum(wGlobalHypProb) ;
   end % if globalUpdate

   if localUpdate
      % PROPAGATE THE INPUTS.
      invec = TrainItem( trialIdx, 1:end-1 ) ;
      % Compute marginal hidden activ. distribution for current hyp's.
      meanHid =  margHid( invec ) ;
      % UPDATE OUTPUT WEIGHT HYPOTHESES
      % Compute the likelihood, i.e., the probability of the datum, for
      % each combinations of OUTPUT weights.
      fprintf(1,'  Computing OUTPUT weight likelihood of datum...\n');
      Pteq1Gw = sigmoid( wOutHyp * meanHid' ) ;
      % Next line depends on teacher being 0 or 1.
      teach = TrainItem( trialIdx, end ) ;
      PdatumGwOut = (Pteq1Gw.^teach) .* (1-Pteq1Gw).^(1-teach) ;
      % Compute the posterior probabilities over the weights.
      fprintf(1,'  Computing OUTPUT weight posterior...\n');
      PwOutGdatum = PdatumGwOut .* wOutHypProb ;
      PwOutGdatum = PwOutGdatum / sum(PwOutGdatum) ;
      % Replace the prior with the new posterior for the output weights.
      wOutHypProb = PwOutGdatum ;
      % COMPUTE HIDDEN TARGET
      % Determine target hidden value. Find hidden activation
      % values that maximize marginal p(out=t); i.e. maximize marginal
      % p(out=1) if t=1 and minimize marginal p(out=1) if t=0.
      fprintf(1,'  Determining default hidden target = marginal hid...\n');
      invec = TrainItem( trialIdx, 1:end-1 ) ;
      teach = TrainItem( trialIdx, end ) ;
      hidInit = margHid( invec ) ;
      hidAtMaxP  = FindHidAtMaxP( hidInit, teach ) ;
      fprintf(1,['      hid init = [' num2str(hidInit,' %5.3f') ...
         '], hid max p = [' num2str(hidAtMaxP,' %5.3f') ']\n' ]);
      % UPDATE HIDDEN WEIGHT HYPOTHESES:
      % Now that the hidden activation target is determined, do Bayesian
      % updating of associative weights to hidden nodes.
      fprintf(1,'  Computing hidden weight likelihood of datum...\n');
      PhidmaxGwHid = ones(size(wHidHypProb));
      % Compute PhidmaxGwHid for every hypothesized wHid.
      for hypIdx = 1 : nRow(wHidHyp)
         % Determine hidden activation for this combination of weights.
         hidActVal = hidAct( wHidHyp(hypIdx,:), invec ) ;
         PhidmaxGwHid( hypIdx ) = prod( ...
            (hidActVal.^hidAtMaxP) .* (1-hidActVal).^(1-hidAtMaxP) ) ;
      end
      % Posterior of hidden weights:
      fprintf(1,'  Computing hidden weight posterior...\n');
      PwHidGhidmax = PhidmaxGwHid .* wHidHypProb ;
      PwHidGhidmax = PwHidGhidmax / sum(PwHidGhidmax) ;
      % Set the prior attention weights to the new posterior.
      wHidHypProb = PwHidGhidmax ;
   end % localUpdate


end % while
return; % end of main function

%-------------------------------------------------------------------------
function hidAtMaxP = FindHidAtMaxP( hidInit, teach )
fprintf(1,'   Finding Hidden Act that Maximizes p(teach)...\n');
global nHid ;
% Possible hidden targets: all 0/1 possibilities
possHidTarg = zeros( 2^nHid , nHid );
currOdomVal =   ones( 1, nHid ) ;
maxOdomVal  = 2*ones( 1, nHid ) ;
for hypIdx = 1 : nRow(possHidTarg) ,
   possHidTarg( hypIdx , : ) =  currOdomVal ;
   currOdomVal = odomInc( currOdomVal, maxOdomVal ) ;
end
possHidTarg = possHidTarg - 1 ; % convert from 2/1 to 1/0.
pOutTargAtHidTarg = zeros( nRow(possHidTarg) , 1 );
for hypIdx = 1 : nRow(possHidTarg) ,
   pOutEqOne = margOut( possHidTarg(hypIdx,:) )  ;
   pOutTargAtHidTarg(hypIdx) = ...
      pOutEqOne^teach * (1-pOutEqOne)^(1-teach) ;
end
% for watching what happens:
[ pOutTargAtHidTarg possHidTarg ]
[ maxOut rowIndex ] = max( pOutTargAtHidTarg ) ;
hidAtMaxP = possHidTarg( rowIndex, : ) ;
return ;

%-------------------------------------------------------------------------
function margOutVal = margOut( hidvec )
% Compute marginal output value across local output weights.
global wOutHyp wOutHypProb ;
% Initialize the marginal output at zero.
margOutVal = 0.0;
% Do the accumulation.
for hypIdx = 1 : nRow(wOutHyp)
   % Determine output for this combination of weights. Formula below
   % assumes row vectors.
   outActVal = sigmoid( wOutHyp(hypIdx,:) * hidvec' ) ;
%    % for watching what happens:
%    [ wOutHypProb(hypIdx) outActVal wOutHyp(hypIdx,:) hidvec ]
   % Accumulate marginal output (output weighted by PwOut).
   margOutVal = margOutVal + ( wOutHypProb(hypIdx) * outActVal ) ;
end
return;

%-------------------------------------------------------------------------
function margHidVal = margHid( invec )
% Compute marginal hidden values across local hidden weights.
global nHid wHidHyp wHidHypProb ;
fprintf(1,'    Computing marginal hidden values...\n');
% Initialize the marginal hidden at all zeros.
margHidVal = zeros( 1, nHid );
% Do the accumulation.
for hypIdx = 1 : nRow( wHidHyp )
   % Determine hidden activation for this combination of weights.
   hidActVal = hidAct( wHidHyp(hypIdx,:), invec );
   % Accumulate activation weighted by wHidHypProb.
   margHidVal = margHidVal + ( wHidHypProb( hypIdx ) * hidActVal ) ;
end
return;

%-------------------------------------------------------------------------
function globalMargOutVal = globalMargOut( invec )
% Compute marginal output value for current invec, using global hypothesis
% space.
global wGlobalHyp wGlobalHypProb nHid nOutcomes ;

% Set up array of possible hidden values: all 0/1 possibilities on nHid
% nodes.
possHidVal = zeros( 2^nHid , nHid );
currOdomVal =   ones( 1, nHid ) ;
maxOdomVal  = 2*ones( 1, nHid ) ;
for hypIdx = 1 : nRow(possHidVal) ,
   possHidVal( hypIdx , : ) =  currOdomVal ;
   currOdomVal = odomInc( currOdomVal, maxOdomVal ) ;
end
possHidVal = possHidVal - 1 ; % convert from 2/1 to 1/0.

% Initialize the marginal output at zero.
globalMargOutVal = 0.0 ;
% Do the accumulation across hypotheses.
for hypIdx = 1 : nRow( wGlobalHyp )

   thisHidHyp = wGlobalHyp(hypIdx,nHid+1:end) ;
   thisOutHyp = wGlobalHyp(hypIdx,1:nHid) ;

   % Accumulate evidence across possible hidden value vectors.
   thisHypProb = 0.0 ;
   for hidValIdx = 1 : nRow( possHidVal )
      thisHidVec = possHidVal(hidValIdx,:) ;
      thisHidAct = hidAct(thisHidHyp,invec) ;
      pHidVal = prod( ...
         thisHidAct .^ thisHidVec .* ...
         (1-thisHidAct) .^ (1-thisHidVec) ...
         ) ;
      pOutEq1 = sigmoid( thisOutHyp * thisHidVec' ) ;
      thisHypProb = thisHypProb + pOutEq1 * pHidVal ;
   end

   % Accumulate marginal output (output weighted by PwOut).
   globalMargOutVal = globalMargOutVal ...
      + ( wGlobalHypProb(hypIdx) * thisHypProb ) ;
end
return;

%-------------------------------------------------------------------------
function hidActVal = hidAct( wHid, invec )
global nHid ;
% invec must be a row vector, 1 x nCues. /
% wHid must be a row vector, 1 x (nCues*nHid). First nCues components are
% the weights to the first hidden node, second nCues components are the
% weights to the second hidden node, and so forth. /
% Returned hidActVal is a row vector, 1 x nHid.
nCues = length(invec) ;
wHid = reshape( wHid, [ nCues , nHid ] ) ;
netInput = ( invec * wHid )  ;
% Sigmoid raised to sixth power yields: x=>y 0=>.016 2=>.467 6=>.985
hidActVal = sigmoid( netInput ) .^ 6 ;
return;

%-------------------------------------------------------------------------
function nextval = odomInc( currval, maxval )
% Does odometer-style incrementing of currval, with the maximum value of
% each element specified in maxval. When all elements of maxval are
% exceeded, the function returns zeros in all cells. N.B.: Because this is
% intended to be an index into an array, the low values are 1, not 0.

% Check that currval has same length as maxval.
if size(currval) ~= size(maxval)
   error(' ** size(currval) ~= size(maxval) in odomInc **')
   return;
end
% Check that all components are within [ 1 1 ... ] to maxval.
if any( currval < ones(size(currval)) ) | any( currval > maxval )
   error(' ** currval has values outside of allowed range in odomInc **')
   return;
end
% Intialize column as last (far right) component.
colIdx = length(currval) ;
% Call the incrementing function
nextval = odomIncCol( currval, maxval, colIdx );
return;
function nextval = odomIncCol( thisval, maxval, colIdx )
% Increment the column specified by colIdx. Carries are accomplished by
% recursively calling this function with colIdx shifted. When first column
% is exceeded, a vector of all zeros is returned.
nextval = thisval ;
nextval(colIdx) = nextval(colIdx) + 1 ;
if nextval(colIdx) > maxval(colIdx)
   if colIdx > 1
      nextval(colIdx) = 1 ;
      colIdx = colIdx - 1 ;
      nextval = odomIncCol( nextval, maxval, colIdx) ;
   else
      nextval = zeros( size( maxval ) ) ;
   end
end
return;

%-------------------------------------------------------------------------
function density = normalpdf( xvec, mu, sd )
% mu and sd>0 should be scalars.
normalizer = (1/(sd*sqrt(2*pi))) ;
density = normalizer * exp( -0.5 * ( (xvec - mu) / (sd) ).^2 ) ;
return;

%-------------------------------------------------------------------------
function n = nRow( array )
n = size( array , 1 ) ;
return;

%-------------------------------------------------------------------------
function n = nCol( array )
n = size( array , 2 ) ;
return;

%-------------------------------------------------------------------------
function y = sigmoid( x )
% sigmoid function.
gain = 1.0 ;
threshold = 0.0 ;
y =  1 ./ ( 1 + exp( -gain * ( x - threshold ))) ;
return;

%-------------------------------------------------------------------------
% End of file
%-------------------------------------------------------------------------

