function NHA65CW()
% Partial replication of experiment from N.H.Anderson (1965).
% Stimuli-response via Matlab command window.
% John Kruschke, 08-Feb-2003, 23-Feb-2005.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Prompt the experimenter for set up, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; % clears the command window
fprintf(1,'\n') % A blank line printed on screen.
disp(' This is a partial replication of the experiment reported')
disp(' by N. H. Anderson (1965).')
disp('')
disp(' Thank you for participating. If this were ''real'' research,')
disp(' you would at this point be provided with detailed information')
disp(' so that you could give your informed consent to participate in')
disp(' this experiment. But this experiment is purely for pedagogical')
disp(' purposes and carries essentially no risks, so neither HSC')
disp(' approval nor formal consent is required. Nevertheless, your')
disp(' name will not be linked to the data you provide except for the')
disp(' sole purpose of verifying that you have completed the experiment.')
disp(' Beyond that, the data you provide are anonymous.')
disp('')
disp(' Before you read further instructions,')
disp(' you need to set up the display, as follows:')
% Screen set up:
disp(' ') % Another way to make a blank line.
disp(' CLOSE ALL NON-COMMAND PANELS IN MATLAB:')
disp(' In the Matlab DESKTOP (or VIEW) menu, ')
disp(' uncheck all items EXCEPT ''command window''.')
disp(' Press any key after you have accomplished that.')
pause;
disp(' ')
disp(' MAXIMIZE THIS MATLAB COMMAND WINDOW (e.g., in Windows, ')
disp(' click the rectangle button at the top right corner of the window).')
disp(' Press any key after you have accomplished that.')
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize info for this subject.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create subject ID number.
SubjID = Now2SubjID;
% Initialize empty data array. Each row will have:
% subject_ID condition_ID response_choice response_time.
% In actual experiments, the condition_ID might consist of several fields.
Data = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instructions to participant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
disp(' Here are instructions regarding what you need to do.')
disp('')
disp(' You will see words that describe traits of individual')
disp(' people. For a given trait or set of traits, you need')
disp(' to rate how likable a person would be who had that trait')
disp(' or set of traits. Likability is rated on a scale from')
disp(' 0 to 100, where 0 is least likable, 100 is most likable,')
disp(' and 50 is neutral, that is, neither likable nor dislikable.')
disp('')
disp(' You will see a total of only 80 short lists of traits,')
disp(' so please take your time with each list and give it a')
disp(' thoughtful rating.')
disp('')
disp(' Press any key to begin rating individuals.')
pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify and initialize the design of the experiment.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% There are four levels of trait: High, Medium plus, Medium minus, and Low.
% Each of the four levels has two instantiations:

H1='  reasonable ';
H2='  truthful ';
Mp1='  painstaking ';
Mp2='  persuasive ';
Mm1='  unpopular ';
Mm2='  dependent ';
L1='  spiteful ';
L2='  abusive ';

% There are 10 types of trait combination, such as HH, HMp, MpMp, etc.
% Types such as HMp involve four specific tokens of word combinations:
% H1Mp1, H1Mp2, H2Mp1, and H2Mp2. The other types are also given four
% tokens so that the frequencies of the types are equalized. Therefore
% there are a total of 10 x 4 = 40 trials conditions in a block. These
% 40 conditions are specified in the Cond structure:

Cond(1).type = 'H';
Cond(1).token = 'H1';
Cond(1).traits = H1;

Cond(2).type = 'H';
Cond(2).token = 'H1';
Cond(2).traits = H1;

Cond(3).type = 'H';
Cond(3).token = 'H2';
Cond(3).traits = H2;

Cond(4).type = 'H';
Cond(4).token = 'H2';
Cond(4).traits = H2;

Cond(5).type = 'Mp';
Cond(5).token = 'Mp1';
Cond(5).traits = Mp1;

Cond(6).type = 'Mp';
Cond(6).token = 'Mp1';
Cond(6).traits = Mp1;

Cond(7).type = 'Mp';
Cond(7).token = 'Mp2';
Cond(7).traits = Mp2;

Cond(8).type = 'Mp';
Cond(8).token = 'Mp2';
Cond(8).traits = Mp2;

Cond(9).type = 'Mm';
Cond(9).token = 'Mm1';
Cond(9).traits = Mm1;

Cond(10).type = 'Mm';
Cond(10).token = 'Mm1';
Cond(10).traits = Mm1;

Cond(11).type = 'Mm';
Cond(11).token = 'Mm2';
Cond(11).traits = Mm2;

Cond(12).type = 'Mm';
Cond(12).token = 'Mm2';
Cond(12).traits = Mm2;

Cond(13).type = 'L';
Cond(13).token = 'L1';
Cond(13).traits = L1;

Cond(14).type = 'L';
Cond(14).token = 'L1';
Cond(14).traits = L1;

Cond(15).type = 'L';
Cond(15).token = 'L2';
Cond(15).traits = L2;

Cond(16).type = 'L';
Cond(16).token = 'L2';
Cond(16).traits = L2;

Cond(17).type = 'HH';
Cond(17).token = 'H1H2';
Cond(17).traits = [H1 ' and ' H2];

Cond(18).type = 'HH';
Cond(18).token = 'H2H1';
Cond(18).traits = [H2 ' and ' H1];

Cond(19).type = 'HH';
Cond(19).token = 'H1H2';
Cond(19).traits = [H1 ' and ' H2];

Cond(20).type = 'HH';
Cond(20).token = 'H2H1';
Cond(20).traits = [H2 ' and ' H1];

Cond(21).type = 'MpMp';
Cond(21).token = 'Mp1Mp2';
Cond(21).traits = [Mp1 ' and ' Mp2];

Cond(22).type = 'MpMp';
Cond(22).token = 'Mp2Mp1';
Cond(22).traits = [Mp2 ' and ' Mp1];

Cond(23).type = 'MpMp';
Cond(23).token = 'Mp1Mp2';
Cond(23).traits = [Mp1 ' and ' Mp2];

Cond(24).type = 'MpMp';
Cond(24).token = 'Mp2Mp1';
Cond(24).traits = [Mp2 ' and ' Mp1];

Cond(25).type = 'MmMm';
Cond(25).token = 'Mm1Mm2';
Cond(25).traits = [Mm1 ' and ' Mm2];

Cond(26).type = 'MmMm';
Cond(26).token = 'Mm2Mm1';
Cond(26).traits = [Mm2 ' and ' Mm1];

Cond(27).type = 'MmMm';
Cond(27).token = 'Mm1Mm2';
Cond(27).traits = [Mm1 ' and ' Mm2];

Cond(28).type = 'MmMm';
Cond(28).token = 'Mm2Mm1';
Cond(28).traits = [Mm2 ' and ' Mm1];

Cond(29).type = 'LL';
Cond(29).token = 'L1L2';
Cond(29).traits = [L1 ' and ' L2];

Cond(30).type = 'LL';
Cond(30).token = 'L2L1';
Cond(30).traits = [L2 ' and ' L1];

Cond(31).type = 'LL';
Cond(31).token = 'L1L2';
Cond(31).traits = [L1 ' and ' L2];

Cond(32).type = 'LL';
Cond(32).token = 'L2L1';
Cond(32).traits = [L2 ' and ' L1];

Cond(33).type = 'HMp';
Cond(33).token = 'H1Mp1';
Cond(33).traits = [H1 ' and ' Mp1];

Cond(34).type = 'HMp';
Cond(34).token = 'H1Mp2';
Cond(34).traits = [H1 ' and ' Mp2];

Cond(35).type = 'HMp';
Cond(35).token = 'H2Mp1';
Cond(35).traits = [H2 ' and ' Mp1];

Cond(36).type = 'HMp';
Cond(36).token = 'H2Mp2';
Cond(36).traits = [H2 ' and ' Mp2];

Cond(37).type = 'MmL';
Cond(37).token = 'Mm1L1';
Cond(37).traits = [Mm1 ' and ' L1];

Cond(38).type = 'MmL';
Cond(38).token = 'Mm1L2';
Cond(38).traits = [Mm1 ' and ' L2];

Cond(39).type = 'MmL';
Cond(39).token = 'Mm2L1';
Cond(39).traits = [Mm2 ' and ' L1];

Cond(40).type = 'MmL';
Cond(40).token = 'Mm2L2';
Cond(40).traits = [Mm2 ' and ' L2];

NumTrialsPerBlock = 40;
NumBlocks = 2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run through the trials.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

TrialCount = 0;

for BlockIndex = 1 : NumBlocks

   % Randomize the order of presented trials. Check that no consecutive
   % items are of the same type.
   not_random = 1;
   while not_random
      CondIndex = randperm(length(Cond));
      not_random = 0;
      for Idx = 1 : length(CondIndex)-1
         if strcmp( ...
               Cond(CondIndex(Idx)).type , ...
               Cond(CondIndex(Idx+1)).type )
            not_random = 1;
         end
      end
   end

   for TrialInBlockIndex = 1 : NumTrialsPerBlock

      TrialCount = TrialCount + 1;

      % Display stimulus.
      clc;
      disp(' ');
      disp( Cond(CondIndex(TrialInBlockIndex)).traits );
      tic; % Start response timer.

      % Collect response.
      fprintf(1,'\n') % A blank line printed on screen.
      Rating = [];
      while ( (isempty(Rating)) | (Rating < 0) | (Rating > 100) )
         Rating = input( ...
            'Rate the likability (1 to 100), then press Enter: ' );
      end
      TrialRT = toc;

      % Append trial data to overall data.
      Data(TrialCount).subjID = SubjID;
      Data(TrialCount).block = BlockIndex;
      Data(TrialCount).trialInBlock = TrialInBlockIndex;
      Data(TrialCount).trial = TrialCount;
      Data(TrialCount).type = Cond(CondIndex(TrialInBlockIndex)).type;
      Data(TrialCount).token = Cond(CondIndex(TrialInBlockIndex)).token;
      Data(TrialCount).rating = Rating;
      Data(TrialCount).RT = TrialRT;

   end % end trial

end % end block

TotalNumTrials = TrialCount;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Store the data.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

FileName = [SubjID,'.txt'];
FileID = fopen(FileName,'w');
for rowIndex = 1 : TotalNumTrials
   fprintf(FileID,'%9s',Data(rowIndex).subjID);
   fprintf(FileID,'\t');
   fprintf(FileID,'%4.0f',Data(rowIndex).block);
   fprintf(FileID,'\t');
   fprintf(FileID,'%4.0f',Data(rowIndex).trialInBlock);
   fprintf(FileID,'\t');
   fprintf(FileID,'%4.0f',Data(rowIndex).trial);
   fprintf(FileID,'\t');
   fprintf(FileID,'%s',Data(rowIndex).type);
   fprintf(FileID,'\t');
   fprintf(FileID,'%s',Data(rowIndex).token);
   fprintf(FileID,'\t');
   fprintf(FileID,'%4.0f',Data(rowIndex).rating);
   fprintf(FileID,'\t');
   fprintf(FileID,'%7.3f',Data(rowIndex).RT);
   fprintf(FileID,'\n');
end
fclose(FileID);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Farewell to participant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
disp(' The rating trials are now completed! There are just two more things')
disp(' you need to do:')
disp('')
disp([' 1. Make sure your data file, ',FileName,', is in a directory where'])
disp(' it will not be erased inadvertently.')
disp('')
disp([' 2. E-mail your data file, ',FileName,', to Prof. Kruschke at'])
disp(' kruschke@indiana.edu. This way Prof. Kruschke can verify that')
disp(' you completed the experiment, and he can include your data with')
disp(' those submitted from other participants. The collected data')
disp(' will NOT include your name or computer username.')
disp('')
disp(' Thank you!')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subfunctions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% -------------------------------------------------------------------------
