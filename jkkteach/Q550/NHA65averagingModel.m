function  negLogLik = NHA65averagingModel( paramVector , dataVector )
%
% Variation of the averaging model presented by N. H. Anderson 1965. The
% original averaging model only generated a predicted rating for given
% traits, without any probability distribution around that prediction. This
% version uses a Gaussian function as a probability distribution around the
% averaging model's predicted rating. The SD of the Gaussian is
% sqrt(p*(1-p)/n) where p is the predicted rating /100 and n is a nuisance
% parameter. Future versions could use a beta distribution instead.
%
% This program assumes that there are four trait levels and ten trait
% combinations, as used in the replication experiment NHA65CW.m.
%
% The paramVector must contain the following values in order:
% L  = paramVector(1); is the value of a Low trait
% Mm = paramVector(2); is the value of a Medium-minus trait
% Mp = paramVector(3); is the value of a Medium-plus trait
% H  = paramVector(4); is the value of a High trait
% I  = paramVector(5); is the initial value
% w  = paramVector(6); (1-w) is the weight on the initial value
% n  = paramVector(7); narrowness of prob distribution (sample size).
% The value of n should be at least 1, and 0.0 <= w <= 1.0.
%
% The dataVector must contain the following ratings, in order:
% LL, L, MmL, MmMm, Mm, Mp, MpMp, HMp, H, HH.
% This is the order output by the program NHA65stats.m.
%
% This function returns the negative log likelihood of the parameter values
% for the data.
%
% Example of usage:
% paramInit = [ 0 30 70 100 50 0.6 20 ]
% dataVector = [ 5 10 15 25 35 65 75 85 90 95 ]
% searchOptions = optimset( 'Display','off' ,'TolX',0.01 ,'MaxIter',100 ) ;
% [bestParam,fitVal,exitflag,output] = fminsearch( ...
%     @NHA65averagingModel, paramInit, searchOptions, dataVector ) 
%
% John Kruschke, 2-Mar-2005.

% Unpack the parameter vector into meaningful components.
L  = paramVector(1);
Mm = paramVector(2);
Mp = paramVector(3);
H  = paramVector(4);
I  = paramVector(5);
w  = paramVector(6);
n  = paramVector(7);

% Check that parameter values are in allowed range and if not, return a
% punishing fit value.
ReallyBadFit = 9.9e+99;
if w < 0.0 | w > 1.0
   negLogLik = ReallyBadFit ;
   return;
end
if n < 1
   negLogLik = ReallyBadFit ;
   return;
end
% If we want, we can restrict the trait values to the range 0-100, as done
% below. But it's not clear we should want to do that.
% if L < 0 | L > 100
%    negLogLik = ReallyBadFit ;
%    return;
% end
% if Mm < 0 | Mm > 100
%    negLogLik = ReallyBadFit ;
%    return;
% end
% if Mp < 0 | Mp > 100
%    negLogLik = ReallyBadFit ;
%    return;
% end
% if H < 0 | H > 100
%    negLogLik = ReallyBadFit ;
%    return;
% end
% if I < 0 | I > 100
%    negLogLik = ReallyBadFit ;
%    return;
% end

% Specify the condition structure. This order is used by NHA65stats.m.
% LL, L, MmL, MmMm, Mm, Mp, MpMp, HMp, H, HH.
cond(1).traits = [ L L ] ;
cond(2).traits = [ L ] ;
cond(3).traits = [ Mm L ] ;
cond(4).traits = [ Mm Mm ] ;
cond(5).traits = [ Mm ] ;
cond(6).traits = [ Mp ] ;
cond(7).traits = [ Mp Mp ] ;
cond(8).traits = [ H Mp ] ;
cond(9).traits = [ H ] ;
cond(10).traits = [ H H ] ;

% Unpack the data vector into meaningful components.
% LL, L, MmL, MmMm, Mm, Mp, MpMp, HMp, H, HH.
for condIdx = 1 : 10
   cond(condIdx).datum = dataVector(condIdx) ;
end

negLogLik = 0.0;
for condIdx = 1 : 10
   % Averaging model computations
   numerator = w * sum( cond(condIdx).traits ) + (1-w) * I ;
   denominator = w * length( cond(condIdx).traits ) + (1-w) ;
   cond(condIdx).pred = numerator / denominator ;
   if cond(condIdx).pred > 100 | cond(condIdx).pred < 0
      negLogLik = ReallyBadFit ;
      return;
   end
   % Gaussian distribution computations
   predP = cond(condIdx).pred / 100 ;
   sd = sqrt( predP * (1-predP) / n ) ;
   cond(condIdx).sd = sd * 100 ;
   cond(condIdx).pDatum = (1/(sd*sqrt(2*pi))) ...
      * exp( -( ( (cond(condIdx).datum/100) - predP ) / sd )^2 ) ;
   negLogLik = negLogLik + -log( cond(condIdx).pDatum );
end

% Plot data and predictions.
figure(1)
clf
hold on
plot( 1:10,[cond.datum],'gd-' ,'LineWidth',2 )
errorbar( 1:10,[cond.pred],[cond.sd],'ro:'  ,'LineWidth',2)
hold off
xlim([ 0.5 10.5 ])
ylim([ 0 100 ])
legend( 'Data', 'Averaging Model', 'Location','SouthEast' )
title(['Parameters:  ' num2str(paramVector,'  %5.2f') ])
% write labels on x-axis
nTypes = 10;
typeLabels = cell(nTypes,1); % column
typeLabels(1,1) = {'LL'};
typeLabels(2,1) = {'L'};
typeLabels(3,1) = {'MmL'};
typeLabels(4,1) = {'MmMm'};
typeLabels(5,1) = {'Mm'};
typeLabels(6,1) = {'Mp'};
typeLabels(7,1) = {'MpMp'};
typeLabels(8,1) = {'HMp'};
typeLabels(9,1) = {'H'};
typeLabels(10,1) = {'HH'};
set(gca, 'XTickLabel' , typeLabels );
drawnow

% ------------------------------------------------------------------------
