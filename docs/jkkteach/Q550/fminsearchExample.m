function fminsearchExample()
%
% Example to accompany Q550 Homework. The goal here is to illustrate the
% passing of additional arguments to functions called by fminsearch. This
% is useful for passing data and experiment design constants into models.
%
% This example puts both the Gaussian and Exponential models into a single
% sub-function, which one would never do in 'real life'. But doing it here
% illustrates the use of structures and switch statements in Matlab.
%
% John Kruschke, February 2005.

% MyFunctionToMinimize, defined below, is Gaussian, so its parameters are
% mu and sigma. They are initialized here.
muInit = 0.0 ;
sigmaInit = 10.0 ;
parInit = [ muInit sigmaInit ] ;

% Data vector could have any number of values.
data = [ 10.0 20.0 25.0 32.0 ] ;
MyFunctionArguments.data = data ;
% Comment out one of the statements below (whichever model you do NOT want)
MyFunctionArguments.model = 'Gaussian';
% MyFunctionArguments.model = 'Exponential';

% Call fminsearch. Notice the last argument is MyFunctionArguments, i.e.,
% the data.
searchOptions = optimset('Display','iter') ;
[bestParam,fitVal,exitflag,output] = fminsearch( @MyFunctionToMinimize, ...
   parInit, searchOptions, MyFunctionArguments ) ;

% Display the outcome of fminsearch, and display the mean and SD of the
% data.
fprintf(1,'fminsearch best fitting mu and sigma:\n\t%f\t%f\n', bestParam);
fprintf(1,'Mean and SD of data:\n\t%f\t%f\n', mean(data), std(data,1));

%-------------------------------------------------------------------------
function FitDiscrepancy = MyFunctionToMinimize( Parameters, ...
   MyFunctionArguments )
%
% This function determines the Gaussian probability of the data specified
% in MyFunctionArguments relative to the mean and sd specified in
% Parameters. The output is the negative log likelihood of the data.
%
% This function expects a Parameters vector with two components and a
% MyFunctionArguments vector (e.g., data constants) with an arbitrary
% number of components.

% Unpack the arguments into meaningful components.
mu = Parameters(1);
sigma = Parameters(2);
data = MyFunctionArguments.data;
model = MyFunctionArguments.model;

% ReallyBadFit is any value bigger than a negLogLik you would get.
ReallyBadFit = 9.9e+99 ; 

% Check if sigma is non-positive, and if so, return a punishing fit value.
if sigma <= 0.0;
   FitDiscrepancy = ReallyBadFit ;
   return;
end
% If exponential model is being fit, then check if mu is greater than any
% data values, and if so, return a punishing fit value.
if strcmp(model,'Exponential')
   if sum(data < mu)
      FitDiscrepancy = ReallyBadFit ;
      return;
   end
end

% pDatum (below) is a vector of probabilities of the data values.
switch model

   case 'Gaussian'
      % Notice in the formula below that ((data-mu)/sigma) is a vector, and
      % its components are individually squared by using the .^ operator.
      pDatum = (1/(sigma*sqrt(2*pi))) * ...
         exp( -0.5 * (( data - mu )/sigma).^2 );
   
   case 'Exponential'
      % Notice the use of logical indexing.
      pDatum = zeros(size(data));
      pDatum(data >= mu) = (1/sigma) * ...
         exp( -(1/sigma) * ( data(data >= mu) - mu ) ) ;
   
   otherwise
      error('Model not recognized');
      
end

negLogLik = -sum(log(pDatum));

FitDiscrepancy = negLogLik ;

%-------------------------------------------------------------------------
