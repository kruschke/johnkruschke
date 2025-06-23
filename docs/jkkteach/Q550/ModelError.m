function error = modelError(paramVals)
% Takes parameter values as input and returns, as output, 
% the error (i.e., discrepancy) between the resulting model 
% predictions and human data.  Usage:
%
%    error = modelError( paramVals )
%
% where paramVals is a 2x1 vector. 
%
% The particular function used here, i.e., -peaks(), is just 
% a stand-in for an actual model. The "peaks" function is 
% defined in MATLAB. Try "help peaks".
%
% Programmed by John Kruschke, 1/28/03.

% check that input vector has two components
if sum(size(paramVals)) < 3
    disp('** Input must be a two-component vector! ** (press any key to continue)')
    pause
else if sum(size(paramVals)) > 3
        disp('** Components beyond first two are ignored! ** (press any key to continue)')
        pause
    end
end

% compute error

error = -peaks(paramVals(1),paramVals(2));

%%% end of program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%