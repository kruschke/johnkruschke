function rmse = ExitTableNine(paramVector) 
% 'EXIT' Model 
% Programmed by John Kruschke, June 2002 - January 2003.
% Implements the EXIT model, and applies it to the results of the basic 
% inverse base-rate effect reported in Table 9 of 
% Kruschke, J. K. (2001). The inverse base-rate effect is not explained by 
% eliminative inference. Journal of Experimental Psychology: Learning, Memory & 
% Cognition, v.27, pp.1385-1400.
% References to equation, page, or table numbers are pointing to that article.
%
% There are two differences between this program and the program used for the
% model fits in Kruschke (2001). First, the present program uses randomly
% generated simulated subjects, instead of the actual sequence of training items
% seen by the actual subjects in the original experiments. This is done simply
% to reduce clutter. Second, this program recruits exemplar nodes when the
% training item is novel, rather than pre-loading the exemplars at the beginning
% of training. (There's a third difference: The original program was coded in
% C, not Matlab.)
%
% How to run this program:
%
% To test a single set of parameter values, at the Matlab command prompt type (for example):
% paramVector = [ 2.3251    3.8491    3.0492    5.5091    0.0841    1.2180    0.0614 ];
%  ExitTableNine(paramVector) ;
%
% To search for best fitting parameters, at the Matlab command prompt type (for example):
% clear;
% paramInit   = [ 0.01 2.39 3.94 0.36 0.05 0.017 0.01 ];
% defOpts = optimset(@fminsearch);
% newOpts = optimset(defOpts,'Display','iter','TolX',0.001);
% tic;
% [X,FVAL,exitflag,output] = fminsearch(@ExitTableNine,paramInit,newOpts);
% searchDuration = toc;
% save ExitTableNineFit;

% set parameter values
disp(' ')
disp(' ---------|---------|---------|---------|---------|---------|---------|')
disp('      spec    attCap   choiceD  attShift   outWtLR  gainWtLR   biasSal')
disp(paramVector)
if sum(paramVector<0)>0
    disp('** WARNING: NEGATIVE PARAMETER VALUE(S) RE-SET TO ZERO **')
    paramVector(paramVector<0)=0;
    disp(paramVector)
end

spec = paramVector(1);           % exemplar specificity = c in Eqn.3, p.1399
attCap = paramVector(2);         % attention capacity = P in Eqn.5 p.1400
choiceD = paramVector(3);        % choice decisiveness = phi in Eqn.2, p.1399 
attShift = paramVector(4);       % attention shift rate = lambda_g in Eqn.7, p.1400
outWtLrnRt = paramVector(5);     % output weight learning rate = lambda_w in Eqn.8, p.1400
gainWtLrnRt = paramVector(6);    % gain weight learning rate = lambda_x in Eqn.9, p.1400
biasSalience = paramVector(7);   % bias salience, sigma_1 in Eqn.3 and Eqn.4, p. 1399

% set constants
nSubjects = 10;
nAttShiftIterations = 10 ;          % number of attention shift iterations
rand('state',47) ; % resets random number seed (to 47, just for kicks)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Define the training and testing blocks for
%   Exp.1 or Kruschke (1996a), summarized on p.1390 of Kruschke (2001).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nIn = 7; % Number of input nodes: 1 bias node plus 6 phasic cues.

nOut = 4; % Number of outcome nodes.

nPhases = 4; % Number of phases of training and testing. See Table 1, p.1387.

% Declare a cell structure to hold the training and testing patterns.
phase = cell(nPhases,1);

% Define the input patterns (as column vectors):
% bias node is the first component and is always "on";
% cues are in the order PC1 I1 PR1 PC2 I2 PR2.

I1PC1 = [ 1  1 1 0  0 0 0 ]' ;
I1PR1 = [ 1  0 1 1  0 0 0 ]' ;

I2PC2 = [ 1  0 0 0  1 1 0 ]' ;
I2PR2 = [ 1  0 0 0  0 1 1 ]' ;

I1       = [ 1  0 1 0  0 0 0 ]' ;
I2       = [ 1  0 0 0  0 1 0 ]' ;

PC1PR1   = [ 1  1 0 1  0 0 0 ]' ;
PC2PR2   = [ 1  0 0 0  1 0 1 ]' ;

I1PC1PR1 = [ 1  1 1 1  0 0 0 ]' ;
I2PC2PR2 = [ 1  0 0 0  1 1 1 ]' ;

I1PC2PR2 = [ 1  0 1 0  1 0 1 ]' ;
I2PC1PR1 = [ 1  1 0 1  0 1 0 ]' ;


% Define the teacher patterns (as column vectors):
% outcomes are in the order C1 R1 C2 R2.
C1 = [ 1 0 0 0 ]' ;
R1 = [ 0 1 0 0 ]' ;
C2 = [ 0 0 1 0 ]' ;
R2 = [ 0 0 0 1 ]' ;

% absent feedback is arbitrarily coded as all negative ones:
NF = [ -1 -1 -1 -1 ]' ;

% Specify items for phase 1.
phase{1}.nEpoch = 3 ; % an "epoch" is a repetition of the phase.
phase{1}.inPat =    [ I1PC1 I1PC1 I1PC1 I1PC1  I2PC2 I2PC2 I2PC2 I2PC2  ];
phase{1}.teachPat = [ C1    C1    C1    C1     C2    C2    C2    C2     ];

%% Specify items for phase 2.
phase{2}.nEpoch = 15 ; % an "epoch" is a repetition of the phase.
phase{2}.inPat =    [ I1PC1 I1PC1 I1PC1 I1PR1  I2PC2 I2PC2 I2PC2 I2PR2  ];
phase{2}.teachPat = [ C1    C1    C1    R1     C2    C2    C2    R2     ];

%% Specify items for phase 3.
phase{3}.nEpoch = 5 ; % an "epoch" is a repetition of the phase.
phase{3}.inPat =    [ I1PC1 I1PR1  I1PR1  I1PR1  I2PC2 I2PR2 I2PR2 I2PR2  ];
phase{3}.teachPat = [ C1    R1     R1     R1     C2    R2    R2    R2     ];

% Specify items for phase 4
testPhaseIndex = 4 ;
phase{4}.nEpoch = 1 ; % an "epoch" is a repetition of the phase.
phase{4}.inPat =    [ I1PC1 I2PC2   I1PR1 I2PR2   I1 I2  I1PC1PR1 I2PC2PR2    PC1PR1 PC2PR2  I1PC2PR2 I2PC1PR1 ];
phase{4}.teachPat = [ NF    NF      NF    NF      NF NF  NF       NF          NF     NF      NF       NF       ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Model training loop begins here...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set saliences.
salience = ones(nIn,1) ; % default set all saliences to 1.
salience(1,1) = biasSalience ; % 1st component is bias node.

% Clear out the array that stores the model's predictions.
modelData = [] ;

% Begin subject.
for subjectIdx = 1 : nSubjects, 
    % disp(subjectIdx); % for debugging or monitoring
    
    % Initialize Subject: 

    % Initialize exemplar nodes and gain weights
    nExemp  = 0 ; 
    exempWt = zeros(nIn,nExemp) ;
    gainWt  = zeros(nIn,nExemp) ;

    % Initialize output weights
    outWt = zeros(nOut,nIn)  ;
    
    % Begin phase 
    for phaseIdx = 1 : nPhases,
        
        % Copy this phase's patterns into a working array
        patIn = phase{phaseIdx}.inPat ;
        nPat = size(patIn,2) ;
        patOut = phase{phaseIdx}.teachPat ;
        
        % begin epoch (repetition of the phase)
        for epochIdx = 1 : phase{phaseIdx}.nEpoch, 
            
            % permute columns of patIn and patOut
            p = randperm(nPat) ;
            patIn = patIn(:,p) ;
            patOut = patOut(:,p) ;
            
            % begin trial (within epoch)
            for patIdx = 1 : nPat, 
                
                %%%%%%%%%%%%%% PROPAGATE ACTIVATION %%%%%%%%%%%%%%%%%%%%%%%%%%
                
                % set teacher values
                outTeach = patOut(:,patIdx) ;
                if outTeach == NF  % if sum(outTeach) == -nOut
                    thisIsTestPat = 1;
                else
                    thisIsTestPat = 0;
                end
                
                % activate input nodes
                inAct = patIn(:,patIdx)  ;
                
                % Recruit new exemplar node if inAct is novel,
                % and if it's not a test trial. In equations below, notice that
                % repmat(inAct,1,nExemp) is a matrix the same size as exempWt
                % with the inAct vector repeated in all the columns.
                % (exempWt==repmat(inAct,1,nExemp)) returns a matrix of 1's in
                % cells that match; we're looking for a column of all 1's; i.e. a match.
                % sum(exempWt==repmat(inAct,1,nExemp)) totals the number of 1's in each
                % column; we want to know if any of these column totals equals the column
                % length, which is nIn. So, the sum of this sum will be nonzero 
                % only if there is a perfect match to one of the exempWt columns.
                if thisIsTestPat ~= 1
                    if sum(sum(exempWt==repmat(inAct,1,nExemp))==nIn) == 0
                        % recruit new exempWt column, initialize gain weights too
                        exempWt = [ exempWt inAct ] ;
                        nExemp = nExemp + 1 ;
                        gainWt = [ gainWt zeros(nIn,1) ] ;
                    end
                end
                
                % Activate exemplar nodes (Eqn.3 p.1399)
                exempAct = (exp(-spec*(salience'*abs(exempWt-repmat(inAct,1,nExemp)))))' ;
                
                % Activate gain nodes (Eqn.4 p.1399)
                gain = inAct .* salience .* exp( gainWt * exempAct )  ;
                % Store these gain values from before the attention shift.
                gainInit = gain ;
                
                % Activate attention nodes (Eqn.5, p.1400)
                att = gain / ( sum( gain .^ attCap ) .^ (1/attCap) )  ;
                
                % Activate output nodes (Eqn.1, p.1399)
                outAct = outWt * ( att .* inAct )  ;
                
                % Compute choice probabilities (Eqn.2, p.1399)
                outProb = exp(choiceD * outAct) / sum(exp(choiceD * outAct)) ;
                
                % Store this trial's model prediction for later fitting to human data
                modelData = [ modelData; subjectIdx phaseIdx epochIdx patIdx inAct' outTeach' outProb' ] ;
                % In each row of modelData, there are the following fields:
                % 1: subjectIdx
                % 2: phaseIdx
                % 3: epochIdx
                % 4: patIdx
                % (4+1)to(4+nIn): In'
                % (4+nIn+1)to(4+nIn+nOut): tOut'
                % (4+nIn+nOut+1)to(4+nIn+nOut+nOut): pOut'
                
                if thisIsTestPat ~= 1

                    %%%%%%%%%%%%%%% SHIFT ATTENTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
                    for shiftIteration = 1 : nAttShiftIterations,
                        
                        % Shift the gain (Eqn.7, p.1400).
                        % In matrix form, the derivative is decomposed by the chain rule:
                        % -dE/dg = -dE/da^out * da^out/dalpha * dalpha/dg
                        % First matrix is denoted below as neg_dE_dOut 
                        % Second matrix is denoted below as dOut_dAtt 
                        % Third matrix is denoted below as dAtt_dG 
                        
                        neg_dE_dOut = (outTeach-outAct)' ;
                        
                        dOut_dAtt = outWt .* repmat(inAct',nOut,1) ;
                        
                        % For computing dAtt_dG, must check for division by zero 
                        % (which can happen when raising zero to a negative power)
                        % and reset such components to zero.
                        denom = sum(gain.^attCap)^(1/attCap) ;
                        attcmo = att'.^(attCap-1) ;
                        attcmo(~isfinite(attcmo)) = 0 ;
                        dAtt_dG = ( eye(nIn) - att*attcmo ) ./ denom ;
                        
                        deltaGain = ( neg_dE_dOut * dOut_dAtt * dAtt_dG )' ;
                     
                        gain = gain + attShift * deltaGain ;
                        % Set any negative components of the gain vector to zero
                        gain(gain<0)=0 ;
                        
                        % Re-activate attention nodes 
                        att = gain / ( sum( gain .^ attCap ) .^ (1/attCap) )  ;
                        % Re-activate output nodes 
                        outAct = outWt * ( att .* inAct )  ;
                        
                    end % end of attention shift iteration
                    
                    
                    %%%%%%%%%%%%%%% LEARN ASSOCIATIVE WEIGHTS %%%%%%%%%%%%%%%%%%%%
                    
                    % output weights, Eqn.8 p.1400
                    deltaOutWt = (outTeach-outAct) * (att .* inAct)' ;
                    outWt = outWt + outWtLrnRt * deltaOutWt ;
                    
                    % gain weights from exemplars, Eqn.9 p.1400
                    deltaGainWt = ((gain - gainInit) .* gainInit ) * exempAct' ;
                    gainWt = gainWt + gainWtLrnRt * deltaGainWt ;
                    
                end % end of if thisIsTestPat~=1
            end % end trial (within epoch)
        end % end epoch
    end % end phase
end % end subject

%%%%%%%%%%% End of model training %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Summarize the model predictions.
% This generates a summary table formatted like Table 3, p.1390 of Kruschke (2001).
exitTable9 = zeros(6,4);
nRows = size(exitTable9,1);
nCols = size(exitTable9,2);
nCells = nRows * nCols;

row = 0;
% Reminder: In each row of modelData, there are the following fields:
% 1: subjectIdx
% 2: phaseIdx
% 3: epochIdx
% 4: patIdx
% (4+1)to(4+nIn): In'
% (4+nIn+1)to(4+nIn+nOut): tOut'
% (4+nIn+nOut+1)to(4+nIn+nOut+nOut): pOut'
for subjectIdx = 1 : nSubjects, 
    for phaseIdx = 1 : nPhases,
        for epochIdx = 1 : phase{phaseIdx}.nEpoch, 
            for patIdx = 1 : size(phase{phaseIdx}.inPat,2),
                row = row+1 ;
                if modelData(row,2) == testPhaseIndex % if test phase
                    
                    thisIn = modelData(row,4+1:4+nIn);
                    thispOut = modelData(row,4+nIn+nOut+1:4+nIn+nOut+nOut);
                    thispOutFlip = [ thispOut(3:4) thispOut(1:2) ];
                                        
                    if thisIn == I1PC1'
                        exitTable9(1,:) = exitTable9(1,:)+thispOut;
                    end
                    if thisIn == I2PC2'
                        exitTable9(1,:) = exitTable9(1,:)+thispOutFlip;
                    end
                    
                    if thisIn == I1PR1'
                        exitTable9(2,:) = exitTable9(2,:)+thispOut;
                    end
                    if thisIn == I2PR2'
                        exitTable9(2,:) = exitTable9(2,:)+thispOutFlip;
                    end
                    
                    if thisIn == I1'
                        exitTable9(3,:) = exitTable9(3,:)+thispOut;
                    end
                    if thisIn == I2'
                        exitTable9(3,:) = exitTable9(3,:)+thispOutFlip;
                    end
                    
                    if thisIn == I1PC1PR1'
                        exitTable9(4,:) = exitTable9(4,:)+thispOut;
                    end
                    if thisIn == I2PC2PR2'
                        exitTable9(4,:) = exitTable9(4,:)+thispOutFlip;
                    end
                    
                    if thisIn == PC1PR1'
                        exitTable9(5,:) = exitTable9(5,:)+thispOut;
                    end
                    if thisIn == PC2PR2'
                        exitTable9(5,:) = exitTable9(5,:)+thispOutFlip;
                    end
                    
                    if thisIn == I1PC2PR2'
                        exitTable9(6,:) = exitTable9(6,:)+thispOut;
                    end
                    if thisIn == I2PC1PR1'
                        exitTable9(6,:) = exitTable9(6,:)+thispOutFlip;
                    end
                    
                    
                end
            end
        end
    end
end
exitTable9 = exitTable9 * 100 / (nSubjects*phase{testPhaseIndex}.nEpoch*2)

% Compute the discrepancy (rmse) between the model predictions and the human data.
humanTable9 = [... 
    88.8 6.2 2.7 2.2 ; ...
    7.6 86.6 4.0 1.8 ; ...
    65.6 23.2 8.0 3.1 ; ...
    36.2 53.6 4.9 5.4 ; ...
    26.3 63.8 4.5 5.4 ; ...
    15.6 9.8 21.4 53.1 ...
];

rmse = sqrt( sum(sum(((humanTable9-exitTable9).^2))) / nCells) 

%%%%%%%%%%%%%%%%%%%%%% end of program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
