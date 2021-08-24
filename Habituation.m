function varargout = Habituation(varargin)
% HABITUATION MATLAB code for Habituation.fig
% --------------------------------------------------------
% Authors: Hernández-Soto R & Villasana-Salazar B.
% Contact: rebecahernandezsoto@comunidad.unam.mx, benvillasanasalazar@gmail.com
% Institute of Neurobiology, National University of Mexico (UNAM), Mexico
% --------------------------------------------------------
% For more info read the user manual.
% --------------------------------------------------------

% Last Modified by GUIDE v2.5 17-Jul-2021 16:55:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Habituation_OpeningFcn, ...
                   'gui_OutputFcn',  @Habituation_OutputFcn, ...
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


% --- Executes just before Habituation is made visible.
function Habituation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Habituation (see VARARGIN)
% Choose default command line output for Habituation
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

disp('--------------------------------------------------------')
disp('Habituation (pre-training) protocol')
set(handles.text7,'String','...')

% UIWAIT makes Habituation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Habituation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% START BUTTON
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global STOP
set(handles.text7,'String','Reading parameters')
STOP = 0;

%Get variables
contents = cellstr(get(handles.listbox1,'String'));
COMPort  = contents{get(handles.listbox1,'Value')};
SolenoidDuration = str2double(get(handles.edit1,'String'));
SessionDuration = str2double(get(handles.edit2,'String'));

if isnan(SolenoidDuration)||isnan(SessionDuration)
    errordlg('Fill session parameters','Error')
    disp('Error: Session parameters are needed')
    set(handles.text7,'String','...')
    return
end

clear contents

% Display variables to the user
disp('Parameters: ')
fprintf('Duration of solenoid opening (ms):  \n')
disp(SolenoidDuration)
fprintf('Duration of session (ms):  \n')
disp(SessionDuration)

% Arduino's parameters
set(handles.text7,'String','Connecting the Arduino board')
clear arduino
Arduino = arduino(COMPort);

%Session graphication
figure (1), clf
set(gcf, 'Name', 'Habituation protocol','Units','Normalized','Position',[0.1259    0.1953    0.7167    0.6289])
title('Habituation', 'FontWeight', 'bold','FontSize',10)
xlabel('Time (s)')
ylabel('Licks')
grid minor
ax=gca;
ax.YLim = [-0.2 1.2]; % Valores extremos del eje Y
% ax.XLim = [datenum(seconds(-1)) ...
%     datenum(milliseconds(SessionDuration))]; % Valores extremos del eje X

h = animatedline('Color','r','LineWidth',2);
t = datetime('now');

%Session starts here
set(handles.text7,'String','Working')
while datetime ('now')-t < milliseconds (SessionDuration)
    %STOP button
    if STOP
        errordlg('User stopped the protocol','STOP button')
        disp('User stopped the protocol')
        set(handles.text7,'String','STOP')
        disp('--------------------------------------------------------')
        STOP = 0;
        return
    else
        estado_del_lick = readDigitalPin (Arduino,'D6');
        tt =  datetime('now') - t;

        % Licks graphication
        figure (1)
        addpoints(h,datenum(tt),estado_del_lick);
        datetick('x','keeplimits')
        drawnow 

        if estado_del_lick == 1
            writeDigitalPin(Arduino,'D8',1)
        else  
            writeDigitalPin(Arduino,'D8',0)
        end
    end
end
set(handles.text7,'String','...')
disp('Session ended')
disp('--------------------------------------------------------')

%STOP button
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global STOP
STOP = get(hObject,'Value');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
