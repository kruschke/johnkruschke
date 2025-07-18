paramInit = [ 5 35 65 95 50 0.5 9 ]
% dataVector = [ 5 10 15 20 25 75 80 85 90 95 ]
dataVector = [ 4.4286    8.8571    9.6429   30.8750   38.0000   67.5000 ...
   75.3750   88.5000    90.5625   95.7500 ];
searchOptions = optimset(...
   'Display','off' ...
   ,'TolX',0.01 ...
   ,'MaxIter',100 ...
   ) ;
[bestParam,fitVal,exitflag,output] = fminsearch( ...
    @NHA65averagingModel, paramInit, searchOptions, dataVector ) 
