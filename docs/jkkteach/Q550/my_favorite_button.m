function varargout = my_favorite_button(varargin)
% MY_FAVORITE_BUTTON Application M-file for my_favorite_button.fig
%    FIG = MY_FAVORITE_BUTTON launch my_favorite_button GUI.
%    MY_FAVORITE_BUTTON('callback_name', ...) invoke the named callback.

% Last Modified by GUIDE v2.0 15-Mar-2003 11:08:09

if nargin == 0  % LAUNCH GUI

	fig = openfig(mfilename,'reuse');

	% Use system color scheme for figure:
	set(fig,'Color',get(0,'defaultUicontrolBackgroundColor'));

	% Generate a structure of handles to pass to callbacks, and store it. 
	handles = guihandles(fig);
	guidata(fig, handles);

    % User-defined GUI initialization here ------------------------------------------
    
    % Initialize click count (as field in global structure "handles")
    handles.click_count = 0;
    % Save global handles values.
    guidata(fig,handles);
    % Display click count in button.
    set(handles.my_favorite_button,'String',['Click count = ' num2str(handles.click_count)]);
    
    % End of user-defined GUI initialization ----------------------------------------
    
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
function varargout = my_favorite_button_Callback(h, eventdata, handles, varargin)

% Increment click count (as field in global structure "handles")
handles.click_count = handles.click_count + 1;
% Save global handles values.
guidata(h,handles);
% Display click count in button.
set(handles.my_favorite_button,'String',['Click count = ' num2str(handles.click_count)]);
    
