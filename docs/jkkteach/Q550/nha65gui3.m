function varargout = nha65gui3(varargin)
% NHA65GUI3 Application M-file for nha65gui3.fig
%    FIG = NHA65GUI3 launch nha65gui3 GUI.
%    NHA65GUI3('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 12-Mar-2003 13:13:16

if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);
    
    % User-defined GUI initialization here -------------------------------------
    
    % First, just to be sure that nothing unintended appears, 
    % make everything invisible and un-enabled.
    set(handles.instruction_text,'Visible','off');
    set(handles.instruction_text,'Enable','off');
    set(handles.end_instruction,'Visible','off');
    set(handles.end_instruction,'Enable','off');
    set(handles.trait_text,'Visible','off');
    set(handles.trait_text,'Enable','off');
    set(handles.response_prompt_text,'Visible','off');
    set(handles.response_prompt_text,'Enable','off');
    set(handles.rating_text,'Visible','off');
    set(handles.rating_text,'Enable','off');
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Initialize info for this subject.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % To make these variables globally accessible, they are defined as
    % field structures of the handles structure. 
    
    % Create subject ID number.
    handles.SubjID = Now2SubjID;
    % Initialize empty data array. Each row will have:
    % subject_ID condition_ID response_choice response_time.
    % In actual experiments, the condition_ID might consist of several fields.
    handles.Data = [];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Specify and initialize the design of the experiment.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    H1='reasonable';
    H2='truthful';
    Mp1='painstaking';
    Mp2='persuasive';
    Mm1='unpopular';
    Mm2='dependent';
    L1='spiteful';
    L2='abusive';
    
    % There are 10 types of trait combination, such as HH, HMp, MpMp, etc.
    % Types such as HMp involve four specific tokens of word combinations:
    % H1Mp1, H1Mp2, H2Mp1, and H2Mp2. The other types are also given four
    % tokens so that the frequencies of the types are equilized. Therefore
    % there are a total of 10 x 4 = 40 trials conditions in a block. These 
    % 40 conditions are specified in the Cond structure.
    
    handles.Cond(1).type = 'H';
    handles.Cond(1).token = 'H1';
    handles.Cond(1).traits = H1;
    
    handles.Cond(2).type = 'H';
    handles.Cond(2).token = 'H1';
    handles.Cond(2).traits = H1;
    
    handles.Cond(3).type = 'H';
    handles.Cond(3).token = 'H2';
    handles.Cond(3).traits = H2;
    
    handles.Cond(4).type = 'H';
    handles.Cond(4).token = 'H2';
    handles.Cond(4).traits = H2;
    
    handles.Cond(5).type = 'Mp';
    handles.Cond(5).token = 'Mp1';
    handles.Cond(5).traits = Mp1;
    
    handles.Cond(6).type = 'Mp';
    handles.Cond(6).token = 'Mp1';
    handles.Cond(6).traits = Mp1;
    
    handles.Cond(7).type = 'Mp';
    handles.Cond(7).token = 'Mp2';
    handles.Cond(7).traits = Mp2;
    
    handles.Cond(8).type = 'Mp';
    handles.Cond(8).token = 'Mp2';
    handles.Cond(8).traits = Mp2;
    
    handles.Cond(9).type = 'Mm';
    handles.Cond(9).token = 'Mm1';
    handles.Cond(9).traits = Mm1;
    
    handles.Cond(10).type = 'Mm';
    handles.Cond(10).token = 'Mm1';
    handles.Cond(10).traits = Mm1;
    
    handles.Cond(11).type = 'Mm';
    handles.Cond(11).token = 'Mm2';
    handles.Cond(11).traits = Mm2;
    
    handles.Cond(12).type = 'Mm';
    handles.Cond(12).token = 'Mm2';
    handles.Cond(12).traits = Mm2;
    
    handles.Cond(13).type = 'L';
    handles.Cond(13).token = 'L1';
    handles.Cond(13).traits = L1;
    
    handles.Cond(14).type = 'L';
    handles.Cond(14).token = 'L1';
    handles.Cond(14).traits = L1;
    
    handles.Cond(15).type = 'L';
    handles.Cond(15).token = 'L2';
    handles.Cond(15).traits = L2;
    
    handles.Cond(16).type = 'L';
    handles.Cond(16).token = 'L2';
    handles.Cond(16).traits = L2;
    
    handles.Cond(17).type = 'HH';
    handles.Cond(17).token = 'H1H2';
    handles.Cond(17).traits = [H1 ' and ' H2];
    
    handles.Cond(18).type = 'HH';
    handles.Cond(18).token = 'H2H1';
    handles.Cond(18).traits = [H2 ' and ' H1];
    
    handles.Cond(19).type = 'HH';
    handles.Cond(19).token = 'H1H2';
    handles.Cond(19).traits = [H1 ' and ' H2];
    
    handles.Cond(20).type = 'HH';
    handles.Cond(20).token = 'H2H1';
    handles.Cond(20).traits = [H2 ' and ' H1];
    
    handles.Cond(21).type = 'MpMp';
    handles.Cond(21).token = 'Mp1Mp2';
    handles.Cond(21).traits = [Mp1 ' and ' Mp2];
    
    handles.Cond(22).type = 'MpMp';
    handles.Cond(22).token = 'Mp2Mp1';
    handles.Cond(22).traits = [Mp2 ' and ' Mp1];
    
    handles.Cond(23).type = 'MpMp';
    handles.Cond(23).token = 'Mp1Mp2';
    handles.Cond(23).traits = [Mp1 ' and ' Mp2];
    
    handles.Cond(24).type = 'MpMp';
    handles.Cond(24).token = 'Mp2Mp1';
    handles.Cond(24).traits = [Mp2 ' and ' Mp1];
    
    handles.Cond(25).type = 'MmMm';
    handles.Cond(25).token = 'Mm1Mm2';
    handles.Cond(25).traits = [Mm1 ' and ' Mm2];
    
    handles.Cond(26).type = 'MmMm';
    handles.Cond(26).token = 'Mm2Mm1';
    handles.Cond(26).traits = [Mm2 ' and ' Mm1];
    
    handles.Cond(27).type = 'MmMm';
    handles.Cond(27).token = 'Mm1Mm2';
    handles.Cond(27).traits = [Mm1 ' and ' Mm2];
    
    handles.Cond(28).type = 'MmMm';
    handles.Cond(28).token = 'Mm2Mm1';
    handles.Cond(28).traits = [Mm2 ' and ' Mm1];
    
    handles.Cond(29).type = 'LL';
    handles.Cond(29).token = 'L1L2';
    handles.Cond(29).traits = [L1 ' and ' L2];
    
    handles.Cond(30).type = 'LL';
    handles.Cond(30).token = 'L2L1';
    handles.Cond(30).traits = [L2 ' and ' L1];
    
    handles.Cond(31).type = 'LL';
    handles.Cond(31).token = 'L1L2';
    handles.Cond(31).traits = [L1 ' and ' L2];
    
    handles.Cond(32).type = 'LL';
    handles.Cond(32).token = 'L2L1';
    handles.Cond(32).traits = [L2 ' and ' L1];
    
    handles.Cond(33).type = 'HMp';
    handles.Cond(33).token = 'H1Mp1';
    handles.Cond(33).traits = [H1 ' and ' Mp1];
    
    handles.Cond(34).type = 'HMp';
    handles.Cond(34).token = 'H1Mp2';
    handles.Cond(34).traits = [H1 ' and ' Mp2];
    
    handles.Cond(35).type = 'HMp';
    handles.Cond(35).token = 'H2Mp1';
    handles.Cond(35).traits = [H2 ' and ' Mp1];
    
    handles.Cond(36).type = 'HMp';
    handles.Cond(36).token = 'H2Mp2';
    handles.Cond(36).traits = [H2 ' and ' Mp2];
    
    handles.Cond(37).type = 'MmL';
    handles.Cond(37).token = 'Mm1L1';
    handles.Cond(37).traits = [Mm1 ' and ' L1];
    
    handles.Cond(38).type = 'MmL';
    handles.Cond(38).token = 'Mm1L2';
    handles.Cond(38).traits = [Mm1 ' and ' L2];
    
    handles.Cond(39).type = 'MmL';
    handles.Cond(39).token = 'Mm2L1';
    handles.Cond(39).traits = [Mm2 ' and ' L1];
    
    handles.Cond(40).type = 'MmL';
    handles.Cond(40).token = 'Mm2L2';
    handles.Cond(40).traits = [Mm2 ' and ' L2];
    
    handles.NumTrialsPerBlock = 4;
    handles.NumBlocks = 2;

    guidata(fig,handles) % Save the handles structure with all the new variables.

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Instructions to participant.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Before making the instructions visible, set their text as desired.
    set(handles.instruction_text, ...
        'String', ...
        ['Here are instructions regarding what you need to do. You will see '...
            'words that describe traits of individual people. For a given '...
            'trait or set of traits, you need to rate how likable a person '...
            'would be who had that trait or set of traits. Likability is '...
            'rated on a scale from 0 to 100, where 0 is least likable, 100 '...
            'is most likable, and 50 is neutral, that is, neither likable '...
            'nor dislikable. You will see a total of only 80 short lists of '...
            'traits, so please take your time with each list and give it a '...
            'thoughtful rating.'] ...
        );    
    % Make instructions and instructions-done button visible,
    set(handles.instruction_text,'Visible','on');
    set(handles.instruction_text,'Enable','on');
    set(handles.end_instruction,'Visible','on');
    set(handles.end_instruction,'Enable','on');
    
    % End of user-defined GUI initialization -----------------------------------
    
	if nargout > 0
		varargout{1} = fig;
	end

elseif ischar(varargin{1}) % INVOKE NAMED SUBFUNCTION OR CALLBACK

	try
		if (nargout)
			[varargout{1:nargout}] = feval(varargin{:}); % FEVAL switchyard
		else
			feval(varargin{:}); % FEVAL switchyard
		end
	catch
		disp(lasterr);
	end

end


%| ABOUT CALLBACKS:
%| GUIDE automatically appends subfunction prototypes to this file, and 
%| sets objects' callback properties to call them through the FEVAL 
%| switchyard above. This comment describes that mechanism.
%|
%| Each callback subfunction declaration has the following form:
%| <SUBFUNCTION_NAME>(H, EVENTDATA, HANDLES, VARARGIN)
%|
%| The subfunction name is composed using the object's Tag and the 
%| callback type separated by '_', e.g. 'slider2_Callback',
%| 'figure1_CloseRequestFcn', 'axis1_ButtondownFcn'.
%|
%| H is the callback object's handle (obtained using GCBO).
%|
%| EVENTDATA is empty, but reserved for future use.
%|
%| HANDLES is a structure containing handles of components in GUI using
%| tags as fieldnames, e.g. handles.figure1, handles.slider2. This
%| structure is created at GUI startup using GUIHANDLES and stored in
%| the figure's application data using GUIDATA. A copy of the structure
%| is passed to each callback.  You can store additional information in
%| this structure at GUI startup, and you can change the structure
%| during callbacks.  Call guidata(h, handles) after changing your
%| copy to replace the stored original so that subsequent callbacks see
%| the updates. Type "help guihandles" and "help guidata" for more
%| information.
%|
%| VARARGIN contains any extra arguments you have passed to the
%| callback. Specify the extra arguments by editing the callback
%| property in the inspector. By default, GUIDE sets the property to:
%| <MFILENAME>('<SUBFUNCTION_NAME>', gcbo, [], guidata(gcbo))
%| Add any extra arguments after the last argument, before the final
%| closing parenthesis.


% --------------------------------------------------------------------
function varargout = end_instruction_Callback(h, eventdata, handles, varargin)

% Make instructions invisible and un-enabled.
set(handles.instruction_text,'Visible','off');
set(handles.instruction_text,'Enable','off');
set(handles.end_instruction,'Visible','off');
set(handles.end_instruction,'Enable','off');

% Initialize trial and block counters for 1st trial.
handles.TrialCount = 1;
handles.TrialInBlockIndex = ...
    mod(handles.TrialCount-1,handles.NumTrialsPerBlock)+1;
handles.BlockIndex = fix((handles.TrialCount-1)/handles.NumTrialsPerBlock)+1;


% Permute condition indices for the 1st block.
% 40 is the number of conditions.
handles.CondIndex = randperm(40);

guidata(h,handles) % Save the handles structure with the new variables.

% Set static-text for traits of 1st trial.
set(handles.trait_text,'String',...
    handles.Cond(handles.CondIndex(handles.TrialInBlockIndex)).traits );
% Set rating edit-text to empty.
set(handles.rating_text,'String',[]);

% Make rating regions visible and enabled.
set(handles.trait_text,'Visible','on');
set(handles.trait_text,'Enable','on');
set(handles.response_prompt_text,'Visible','on');
set(handles.response_prompt_text,'Enable','on');
set(handles.rating_text,'Visible','on');
set(handles.rating_text,'Enable','on');

% Begin timer for 1st trial.
tic;


% --------------------------------------------------------------------
function varargout = rating_text_Callback(h, eventdata, handles, varargin)

Rating = str2double(get(handles.rating_text,'String'));

if ( isempty(Rating) | ~isfinite(Rating) | ~isreal(Rating) | (Rating < 0) | (Rating > 100) )
    errordlg('You must enter a value from 0 to 100','Bad Input','modal')
    set(handles.rating_text,'String',[]);
    return;
end

TrialRT = toc;

% Append trial data to overall data.
handles.Data(handles.TrialCount).subjID = handles.SubjID;
handles.Data(handles.TrialCount).block = handles.BlockIndex;
handles.Data(handles.TrialCount).trialInBlock = ...
    handles.TrialInBlockIndex;
handles.Data(handles.TrialCount).trial = handles.TrialCount;
handles.Data(handles.TrialCount).type = ...
    handles.Cond(handles.CondIndex(handles.TrialInBlockIndex)).type;
handles.Data(handles.TrialCount).token = ...
    handles.Cond(handles.CondIndex(handles.TrialInBlockIndex)).token;
handles.Data(handles.TrialCount).rating = Rating;
handles.Data(handles.TrialCount).RT = TrialRT;
% Save the handles structure with the new variables.
guidata(h,handles) 

% Increment trial counters.
handles.TrialCount = handles.TrialCount + 1;
handles.TrialInBlockIndex = ...
    mod(handles.TrialCount-1,handles.NumTrialsPerBlock)+1;
handles.BlockIndex = fix((handles.TrialCount-1)/handles.NumTrialsPerBlock)+1;
% Save the handles structure with the new variables.
guidata(h,handles) 

% If starting a new block, permute the conditions.
% 40 is the number of conditions.
% This test assumes that the trial counter has already been incremented.
if mod(handles.TrialCount,handles.NumTrialsPerBlock) == 1
    handles.CondIndex = randperm(40);
    guidata(h,handles) % Save the handles structure with the new variables.
end

% If finished with NumBlocks blocks of trials, write data file and farewell...
if handles.BlockIndex > handles.NumBlocks
    SaveDataBye(handles);
    % End GUI
    return;        
else % ...otherwise set traits for next trial.
    % Set static-text for traits of next trial.
    set(handles.trait_text,'String',...
        handles.Cond(handles.CondIndex(handles.TrialInBlockIndex)).traits );
    % Set rating edit-text to empty.
    set(handles.rating_text,'String',[]);
    % Begin timer for next trial.
    tic;
end


% ---------------------------------------------------------------------------
function SaveDataBye(handles)
% Write data file.
FileName = [handles.SubjID,'.txt'];
FileID = fopen(FileName,'w');
for rowIndex = 1 : handles.TrialCount-1
    fprintf(FileID,'%9s',handles.Data(rowIndex).subjID);
    fprintf(FileID,'\t');
    fprintf(FileID,'%4.0f',handles.Data(rowIndex).block);
    fprintf(FileID,'\t');
    fprintf(FileID,'%4.0f',handles.Data(rowIndex).trialInBlock);
    fprintf(FileID,'\t');
    fprintf(FileID,'%4.0f',handles.Data(rowIndex).trial);
    fprintf(FileID,'\t');
    fprintf(FileID,'%s',handles.Data(rowIndex).type);
    fprintf(FileID,'\t');
    fprintf(FileID,'%s',handles.Data(rowIndex).token);
    fprintf(FileID,'\t');
    fprintf(FileID,'%4.0f',handles.Data(rowIndex).rating);
    fprintf(FileID,'\t');
    fprintf(FileID,'%7.3f',handles.Data(rowIndex).RT);
    fprintf(FileID,'\n');
end
fclose(FileID);
% Farewell
set(handles.trait_text,'Visible','off');
set(handles.trait_text,'Enable','off');
set(handles.response_prompt_text,'Visible','off');
set(handles.response_prompt_text,'Enable','off');
set(handles.rating_text,'Visible','off');
set(handles.rating_text,'Enable','off');
set(handles.instruction_text, ...
    'String', ...
    ['The rating trials are now completed! There are just two more things '...
        'you need to do: 1. Make sure your data file, ',FileName, ...
        ', is in a directory where it will not be erased inadvertently. '...
        '2. E-mail your data file, ',FileName,', to Prof. Kruschke at '...
        'kruschke@indiana.edu. This way Prof. Kruschke can verify that '...
        'you completed the experiment, and he can include your data with '...
        'those submitted from other participants. The collected data will '...
        'NOT include your name or computer username. Thank you!'...
    ]...
    );    
set(handles.instruction_text,'Visible','on');
set(handles.instruction_text,'Enable','on');



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

