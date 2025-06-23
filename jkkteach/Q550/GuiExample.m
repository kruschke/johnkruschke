function varargout = GuiExample(varargin)
%
% vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv Begin code inserted by John.
%
% How I created this GUI in Matlab Version 7.0.0. (John Kruschke, March
% 2005.)
%
% At the Matlab prompt, I typed "guide". At the dialogue, I opened a blank
% figure.
%
% I dragged a pushbutton to the figure, and I dragged an axes to the
% figure. I resized them a bit, by clicking and dragging. By default,
% Matlab has tagged the pushbutton as "pushbutton1" and the axes as
% "axes1". (You can change the tags in the properties window if you want;
% the callback function names will also be changed to reflect the tags you
% choose.)
%
% I then went to View -> M-file Editor. The dialogue asked for a filename;
% I typed in the name. The editor then opened with this file, with just
% placeholders for the callback functions of the items in the figure.
%
% I then typed in three chunks of code: 
% 1. These comments at the top.
% 2. The initialization inside the function GuiExample_OpeningFcn
% 3. The action inside pushbutton1_Callback
% (Of course, I then saved this file.)
%
% To run, type this filename at the command line in Matlab, or, if guide is
% still open, press the play button on the guide window.
%
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ End code inserted by John.
%
% GUIEXAMPLE M-file for GuiExample.fig
%      GUIEXAMPLE, by itself, creates a new GUIEXAMPLE or raises the existing
%      singleton*.
%
%      H = GUIEXAMPLE returns the handle to a new GUIEXAMPLE or the handle to
%      the existing singleton*.
%
%      GUIEXAMPLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIEXAMPLE.M with the given input arguments.
%
%      GUIEXAMPLE('Property','Value',...) creates a new GUIEXAMPLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiExample_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiExample_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help GuiExample

% Last Modified by GUIDE v2.5 06-Mar-2005 11:02:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiExample_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiExample_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GuiExample is made visible.
function GuiExample_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiExample (see VARARGIN)

% Choose default command line output for GuiExample
handles.output = hObject;

%
% vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv Begin code inserted by John.
%

% Initialize click counter.
handles.clickCount = 0;

% Initialize text displayed in pushbutton1.
set( handles.pushbutton1 ...
   ,'String', ...
   ['CLICK ME! (click count = ' num2str(handles.clickCount) ')'] ...
   );

% Initialize the image displayed in axes1.
% Actually, I decided not to change anything on the axes, so you can see
% what it looks like initially. 

% What must follow this is
%    % Update handles structure
%    guidata(hObject, handles);
% but Matlab already has these lines by default, right below this

%
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ End code inserted by John.
%

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiExample wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiExample_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%
% vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv Begin code inserted by John.
%

% Increment the click counter.
handles.clickCount = handles.clickCount + 1;

% Update the text displayed in pushbutton1.
set( handles.pushbutton1 ...
   ,'String', ...
   ['CLICK ME! (click count = ' num2str(handles.clickCount) ')'] ...
   );

% Update the image displayed in axes1.
% Make an image to display. Here it is just a 2x3 array of random colors.
randompicture = ceil( 64 * rand(2,3) );
% Tell Matlab what axes you're referring to.
axes(handles.axes1)
% Put image in those axes.
image(randompicture)
% Turn off the box and axis lines around the image.
box off
axis off
% Actually display the image.
drawnow

% Update handles structure
guidata(hObject, handles);

%
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ End code inserted by John.
%



