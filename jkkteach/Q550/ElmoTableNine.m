function rmse = ElmoTableNine(paramVector) 
% 'ELMO' Model 
% Programmed by John Kruschke, June 2002 - January 2003.
% Implements the ELMO model of Juslin et al. (2001), 
% and applies it to the results of  Table 9 of 
% Kruschke, J. K. (2001). The inverse base-rate effect is not explained by 
% eliminative inference. Journal of Experimental Psychology: Learning, Memory & 
% Cognition, v.27, pp.1385-1400.
% References to equation, page, or table numbers are pointing to that article.
%
%
% How to run this program:
%
% To test a single set of parameter values, at the Matlab command prompt type (for example):
% >> paramVector = [ 0.643 0.388 0.957 0.670 ];
% >> ElmoTableThree(paramVector) ;
%
% To search for best fitting parameters, at the Matlab command prompt type (for example):
% clear;
% paramInit   = [ 0.7 0.7 0.7 0.7 ];
% defOpts = optimset(@fminsearch);
% newOpts = optimset(defOpts,'Display','iter');
% tic;
% [X,FVAL,exitflag,output] = fminsearch(@ElmoTableNine,paramInit,newOpts);
% searchDuration = toc;
% save ElmoTableNineFit;

%paramVector = [ 0.5 0.2 0.7 0.71 ];

% set parameter values
disp(' ')
disp(' ---------|---------|---------|---------|')
disp('        si        sp        pc        pr ')
disp(paramVector)
if sum(paramVector<0)>0
    disp('** WARNING: NEGATIVE PARAMETER VALUE(S) RE-SET TO ZERO **')
    paramVector(paramVector<0)=0;
    disp(paramVector)
end

si = paramVector(1);           % insignificance of an imperfect cue (last par. p.1387)
sp = paramVector(2);           % insignificance of a perfect cue (last par. p.1387)
pc = paramVector(3);           % probability of knowing common rule (right col. 2nd par. p.1387)
pr = paramVector(4);           % probability of knowing rare rule (right col. 2nd par. p.1387)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Define the training and testing blocks for
%   Exp.1 or Kruschke (1996a), summarized on p.1390 of Kruschke (2001).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nIn = 6;  % Number of input cues
nOut = 4; % Number of outcomes.

% Define the input patterns (as column vectors):
% cues are in the order PC1 I1 PR1 PC2 I2 PR2.

cueInsig = [ sp si sp  sp si sp ] ;

I1PC1 = [ 1 1 0  0 0 0 ]' ;
I1PR1 = [ 0 1 1  0 0 0 ]' ;

I2PC2 = [ 0 0 0  1 1 0 ]' ;
I2PR2 = [ 0 0 0  0 1 1 ]' ;

I1       = [ 0 1 0  0 0 0 ]' ;
I2       = [ 0 0 0  0 1 0 ]' ;

PC1PR1   = [ 1 0 1  0 0 0 ]' ;
PC2PR2   = [ 0 0 0  1 0 1 ]' ;

I1PC1PR1 = [ 1 1 1  0 0 0 ]' ;
I2PC2PR2 = [ 0 0 0  1 1 1 ]' ;

I1PC2PR2 = [ 0 1 0  1 0 1 ]' ;
I2PC1PR1 = [ 1 0 1  0 1 0 ]' ;


% Define the teacher patterns (as column vectors):
% outcomes are in the order C1 R1 C2 R2.
C1 = [ 1 0 0 0 ]' ;
R1 = [ 0 1 0 0 ]' ;
C2 = [ 0 0 1 0 ]' ;
R2 = [ 0 0 0 1 ]' ;

% Note: ELMO in its present formulation assumes there is
% just one rule per outcome. In more complicated situations
% where there is more than one rule per outcome, some modified
% model will need to be created.
nRules = 4;
ruleCondition = [ I1PC1 I1PR1 I2PC2 I2PR2 ] ;
ruleOutcome   = [ C1    R1    C2    R2    ] ;
ruleProb      = [ pc    pr    pc    pr    ] ;

% The order of items in the probe array is used later in creating a 
% summary table, so don't change this without changing that!
nProbes = 12;
probe = [  I1PC1 I2PC2   I1PR1 I2PR2   I1 I2  I1PC1PR1 I2PC2PR2    PC1PR1 PC2PR2  I1PC2PR2 I2PC1PR1 ] ;

% Clear out the array that stores the model's predictions.
probeChoice = zeros(nProbes,nRules);

% For every probe item...
for probeIdx = 1 : nProbes , 
    thisProbe = probe(:,probeIdx) ;

    % Consider every possible knowledge state...
    % Index values are important: 0 means don't know, 1 means know.
    for know1 = 0 : 1 ,
        for know2 = 0 : 1 ,
            for know3 = 0 : 1 ,
                for know4 = 0 : 1 ,
                    
                    knowState = [ know1 know2 know3 know4 ];
                    nKnownRules = sum(knowState) ;

                    % Compute the probability of being in this knowledge state.
                    % This is 2nd par., p.1387, algebraically generalized.
                    stateProb =  prod( ones(1,nRules) - ruleProb - knowState + (2 * ruleProb .* knowState)  ) ;
                    
                    % If any rules are known...
                    if nKnownRules > 0
                        
                        % Determine for each rule the number of cues that mismatch this probe.
                        nMismatch = sum( repmat(thisProbe,1,nRules) ~= ruleCondition );
                        % Replace any unknown rule's nMismatch with Inf.
                        nMismatch(find(knowState==0)) = Inf ;                        
                        
                        % Determine for each rule the number of PRESENT cues that match.
                        % In other words, cues that are absent in both the probe and the rule
                        % do not count as matching cues. Only cues that are present in both
                        % the probe and the rule count as matching. This is logical AND.
                        nMatch    = sum( repmat(thisProbe,1,nRules) & ruleCondition );
                        % Replace any unknown rule's nMatch with zero.
                        nMatch(find(knowState==0)) = 0 ;
                        
                        % Determine for each rule the similarity (Medin & Shaffer '78) to the probe.
                        sim =  prod( repmat(cueInsig',1,nRules) .^ ...
                            abs( repmat(thisProbe,1,nRules) - ruleCondition ) ) ;
                        % Replace any unknown rule's similarity with zero.
                        sim(find(knowState==0)) = 0 ;

                        % If "high similarity" (at least one rule that deviates by one or less)...
                        if min(nMismatch) <= 1
                            
                            % Direct induction (see Note below regarding possible division by zero).
                            % Exclude rules that match no present features of the probe. 
                            sim(find(nMatch==0)) = 0 ;
                            choiceDenom = sum(sim) ;
                            choice = sim / choiceDenom ;
                            % Note: ELMO assumes that the probe has at least one present feature.
                            % Empty probes, which have been used in some experiments, could cause problems
                            % for the model as presently formulated. For example, suppose there is just one
                            % known rule, and it has only a single present cue. This would have a mismatch 
                            % of only 1, thereby triggering direct induction, yet it would have a match of 0,
                            % and so it would be excluded from consideration and cause division by zero.
                            
                        else % if not "high similarity" ...
                            
                            % and if multiple matching rules ...
                            if sum(nMatch~=0) >= 2
 
                                % Constrained induction.
                                % Exclude rules that match no present features of the probe. 
                                sim(find(nMatch==0)) = 0 ;
                                choiceDenom = sum(sim) ;
                                choice = sim / choiceDenom ;
                                
                            else % if not "high sim" and not multiple matching rules ...

                                % Eliminative inference.
                                unknowState = ones(1,nRules) - knowState ;
                                nUnknownRules = sum(unknowState) ;
                                choice = unknowState ./ nUnknownRules ;
                                
                            end % end if not "high sim" and not mult. match
                            
                        end % end if not "high sim"
                        
                    else % if there are no known rules
                        
                        % guess from all outcomes (eliminative inference with no outcomes eliminated)
                        choice = ones(1,nRules) ./ nRules ;
                        
                    end % end if any rules are known

                    % Choice probability has now been computed, above, 
                    % for this probe in this knowledge state.
                    % Now we accumulate the choice probability for this probe
                    % across knowledge states (weighted by probability of the state).
                    
                    probeChoice(probeIdx,:) = probeChoice(probeIdx,:) + ( stateProb * choice ) ;
                    
                end % end know4
            end % end know3
        end % end know2
    end % end know1
    
end % end probeIdx

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Convert the probeChoice array to a summary array 
% formatted like Table 9, p.1396 of Kruschke (2001).
elmoTable9 = zeros(6,4);
nRows = size(elmoTable9,1);
nCols = size(elmoTable9,2);
nCells = nRows * nCols;
% This depends on the order of items in the "probe" array defined at the beginning.
% I'm sure this could be vectorized, but I'm lazy.
for rowIdx = 1 : nRows ,
    elmoTable9(rowIdx,:) = ... 
        0.5 * probeChoice((2*rowIdx)-1,:) + ...
        0.5 * probeChoice(2*rowIdx,[3 4 1 2]) ;
end
% Convert proportions to percentages.
elmoTable9 = 100 * elmoTable9

% Compute the discrepancy (rmse) between the model predictions and the human data.
humanTable9 = [... 
    88.8 6.2 2.7 2.2 ; ...
    7.6 86.6 4.0 1.8 ; ...
    65.6 23.2 8.0 3.1 ; ...
    36.2 53.6 4.9 5.4 ; ...
    26.3 63.8 4.5 5.4 ; ...
    15.6 9.8 21.4 53.1 ...
];

rmse = sqrt( sum(sum(((humanTable9-elmoTable9).^2))) / nCells ) 

%%%%%%%%%%%%%%%%%%%%%% end of program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
