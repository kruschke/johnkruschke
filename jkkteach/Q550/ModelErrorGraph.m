% modelErrorGraph.m
% Plots graphs of parameter optimization for simple two-parameter functions.
% Calls SimpleHillClimb, modelError and GridEvaluation functions.
% Programmed by John Kruschke, 1/28/03

% Initial parameter values 
parInit = [ 1.6 -1.6 ] ;

% Increment (a.k.a. step) size on each parameter 
parInc = [ 0.1 0.1 ] ;

% Lowest and highest parameter values allowed 
parLow = [ -4 -4 ] ;
parHigh = [ 4 4 ] ;

% The function that returns the model error is "modelError".

% Compute optimization from SimpleHillClimb.
traj = SimpleHillClimb(@modelError,parInit,parLow,parHigh,parInc) ;
bestFitSimpleHillClimb = traj(size(traj,1),:)

% Compute optimization from built-in MATLAB routine.
[X,FVAL] = fmincon(@modelError,parInit,[],[],[],[],parLow,parHigh);
bestFitFMINCON = [ X FVAL ] 


% Graph the results

% GridEvaluation evaluates the model error over an entire grid of points.
% This can be done for the simplistic two-parameter "model"  used here,
% but in general is not feasible.
[ X Y Z ] = GridEvaluation(@modelError,parLow,parHigh,parInc) ;

figure(1)

subplot(1,2,1,'replace') ;
hold on;
meshc(X,Y,Z) ;
plot3(traj(:,1),traj(:,2),traj(:,3),'-mo','LineWidth',2);
hold off;
axis([ parLow(1) parHigh(1) parLow(2) parHigh(2) -10 10 ]) ;
axis square ;
title('modelError function with hill descent trajectory') ;
xlabel('Param_1') ;
ylabel('Param_2') ;
zlabel('Error') ;

subplot(1,2,2,'replace') ;
hold on;
contour(X,Y,Z,20) ;
plot(traj(:,1),traj(:,2),'-mo','LineWidth',2);
hold off;
axis([  parLow(1) parHigh(1) parLow(2) parHigh(2) ]) ;
axis square ;
xlabel('Param_1') ;
ylabel('Param_2') ;

%%%%%%%%%%%%%%% end of program %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%