function rmse = NHA65model(paramVector)

L  = paramVector(1);
Mm = paramVector(2);
Mp = paramVector(3);
H  = paramVector(4);
I  = paramVector(5);
% w  = paramVector(6);
w = 0;

disp(' -----------------------------------------------------------')
disp(' Using ADDING WITH INITIAL IMPRESSION model (no w paramter)')
disp('         L        Mm        Mp         H         I         w')
disp(paramVector)

if w < 0
    w = 0;
    disp('** w < 0 reset to 0 **')
end
if w > 1
    w = 1;
    disp('** w > 1 reset to 1 **')
end


humHHHH	    = 79.39;
humHH	    = 72.85;
humHHMpMp	= 71.11;
humMpMpMpMp	= 63.20;
humMpMp	    = 57.56;
humMmMm	    = 42.18;
humMmMmMmMm	= 39.50;
humLLMmMm	= 25.67;
humLL	    = 23.70;
humLLLL	    = 17.64;

modHHHH	    = modelRating([ H H H H ],I,w) ;
modHH	    = modelRating([ H H ],I,w) ;
modHHMpMp	= modelRating([ H H Mp Mp ],I,w) ;
modMpMpMpMp	= modelRating([ Mp Mp Mp Mp ],I,w) ;
modMpMp	    = modelRating([ Mp Mp ],I,w) ;
modMmMm	    = modelRating([ Mm Mm ],I,w) ;
modMmMmMmMm	= modelRating([ Mm Mm Mm Mm ],I,w) ;
modLLMmMm	= modelRating([ L L Mm Mm ],I,w) ;
modLL	    = modelRating([ L L ],I,w) ;
modLLLL	    = modelRating([ L L L L ],I,w) ;

data = [ ...
        humHHHH ; ...
        humHH ; ...
        humHHMpMp ; ...
        humMpMpMpMp ; ...
        humMpMp ; ...
        humMmMm ; ...
        humMmMmMmMm ; ...
        humLLMmMm ; ...
        humLL ; ...
        humLLLL 
];

pred = [ ...
        modHHHH ; ...
        modHH ; ...
        modHHMpMp ; ...
        modMpMpMpMp ; ...
        modMpMp ; ...
        modMmMm ; ...
        modMmMmMmMm ; ...
        modLLMmMm ; ...
        modLL ; ...
        modLLLL 
];

HumanModel = [ data pred ]

rmse = (sum((data-pred).^2)/length(data))^0.5

% plot(data,pred,'bd-')

% % Subfunction AVERAGING MODEL
% function rating = modelRating(traitVector,I,w)
% disp('Using AVERAGING model')
% numerator = w*sum(traitVector)+(1-w)*I;
% denominator = w*length(traitVector)+(1-w);
% rating = numerator/denominator;

% % Subfunction ADDING MODEL
% function rating = modelRating(traitVector,I,w)
% % does not use I or w
% disp('Using ADDING model (no I or w)')
% rating = sum(traitVector);

% Subfunction ADDING WITH INITIAL IMPRESSION MODEL
function rating = modelRating(traitVector,I,w)
% does not use w
rating = sum(traitVector)+I;


% ------------------------------------------------------------------------