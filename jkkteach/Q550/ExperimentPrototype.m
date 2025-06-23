function ExperimentPrototype()
% Prototype for an experiment conducted via the MATLAB Command Window. 
% John Kruschke, 08-Feb-2003

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prompt the experimenter for set up, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf(1,'\n') % A blank line printed on screen.
disp('Dear experimenter: You are now running this experiment.')
disp('This is where you would enter subject info or specify conditions')
disp('or set up the screen.')
% Screen set up:
disp(' ') % Another way to make a blank line.
disp('CLOSE ALL NON-COMMAND PANELS IN MATLAB. In the Matlab VIEW menu, ')
disp('uncheck all items EXCEPT ''command window''.')
disp('Press any key after you have accomplished that.')
pause;
disp(' ') 
disp('MAXIMIZE THIS MATLAB COMMAND WINDOW (e.g., in Windows, ')
disp('click the rectangle button at the top right corner of the window).')
disp('Press any key after you have accomplished that.')
pause;
% Help experimenter count lines on display
MaxLines = 70;
for Line = MaxLines : -1 : 1
    disp(num2str(Line))
end
ScreenHeight = input( ...
    'Type the largest number visible at the top of the screen, and press Enter: ');
ScreenHeight = ScreenHeight + 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize info for this subject.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create subject ID number.
SubjID = Now2SubjID;
% Initialize empty data array. Each row will have:
% subject_ID condition_ID response_choice response_time.
% In actual experiments, the condition_ID might consist of several fields.
AllData = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instructions to participant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

scroll(ScreenHeight);
disp('Dear participant: Thank you for participating.')
disp('Here are instructions about what to do in this experiment...')
disp('Press any key to begin the experiment.')
pause;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify and initialize the design of the experiment.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

NumTrials = 4;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run through the trials.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for TrialIndex = 1 : NumTrials

    % Display stimulus.
    scroll(ScreenHeight);
    disp( [ 'STIMULUS GOES HERE. (This is trial '  num2str(TrialIndex) ...
            ' of ' num2str(NumTrials) '.)' ] );
    tic; % Start response timer.
    
    % Collect response.
    fprintf(1,'\n') % A blank line printed on screen.
    TrialChoice = input('RESPONSE PROMPT: Type a letter, then press Enter: ','s');
    TrialRT = toc;
    
    % Append trial data to overall data.
    AllData(TrialIndex).subjID = SubjID;
    AllData(TrialIndex).condition = TrialIndex;
    AllData(TrialIndex).respChoice = TrialChoice;
    AllData(TrialIndex).RT = TrialRT;
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Farewell to participant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

scroll(ScreenHeight);
disp('Dear participant: That''s all! Thank you for participating.')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Store the data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FileName = [SubjID,'.txt'];
FileID = fopen(FileName,'w');
for rowIndex = 1 : NumTrials
    fprintf(FileID,'%s',AllData(rowIndex).subjID);
    fprintf(FileID,'\t');
    fprintf(FileID,'%3.0f',AllData(rowIndex).condition);
    fprintf(FileID,'\t');
    fprintf(FileID,'%s',AllData(rowIndex).respChoice);
    fprintf(FileID,'\t');
    fprintf(FileID,'%7.3f',AllData(rowIndex).RT);
    fprintf(FileID,'\n');
end
fclose(FileID);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subfunctions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------------
function scroll(nlines)
% Displays nlines blank lines.
for i = 1 : nlines
    fprintf(1,'\n')
end

% -------------------------------------------------------------------------
function SubjID = Now2SubjID()
% Generates a nine-digit numeral (N.B.: STRING) based on current time.
% Useful for creating (hopefully) unique subject ID numbers.
% (The algorithm assumes it is being used before 26-Nov-2737; i.e., 
% it will have to be modified in 700 years. Look out for the Y2.7K bug!)
% John Kruschke, 08-Feb-2003.
SubjTime = now;
DayPow = 1; % 1 for 1-day high digit, 2 for 10-day high digit
SubjID = num2str( fix( 10^(9-DayPow) * ...
    ( SubjTime - (10^DayPow)*fix(SubjTime/(10^DayPow)) ) ));
% Pad with leading zeros if result is less than 9 digits
for i = 1 : 9-length(SubjID)
    SubjID = [ '0' , SubjID ];
end

% --------------------------------------------------------------------
