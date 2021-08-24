function varargout = Training(varargin)
% TRAINING MATLAB code for Training.fig
% --------------------------------------------------------
% Authors: Hernández-Soto R & Villasana-Salazar B.
% Contact: rebecahernandezsoto@comunidad.unam.mx, benvillasanasalazar@gmail.com
% Institute of Neurobiology, National University of Mexico (UNAM), Mexico
% --------------------------------------------------------
% For more info read the user manual.
% --------------------------------------------------------

% Last Modified by GUIDE v2.5 19-Aug-2021 17:53:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Training_OpeningFcn, ...
                   'gui_OutputFcn',  @Training_OutputFcn, ...
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


% --- Executes just before Training is made visible.
function Training_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Training (see VARARGIN)

% Choose default command line output for Training
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

disp('--------------------------------------------------------')
disp('Taining protocol')
set(handles.text17,'String','...')

% UIWAIT makes Training wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Training_OutputFcn(hObject, eventdata, handles) 
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

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
% --- Executes during object creation, after setting all properties.

function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
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
global STOP StimTrials
set(handles.text17,'String','Reading parameters')
STOP = 0;

%Get variables
contents = cellstr(get(handles.listbox1,'String'));
COMPort  = contents{get(handles.listbox1,'Value')};
NumTrials = str2double(get(handles.edit1,'String'));
PreStimDuration = str2double(get(handles.edit2,'String'));
StimDuration = str2double(get(handles.edit3,'String'));
DecPerDuration = str2double(get(handles.edit4,'String'));
PostRewPerDuration = str2double(get(handles.edit5,'String'));
SolenoidDuration = str2double(get(handles.edit6,'String'));
BuzzerDurtation = str2double(get(handles.edit7,'String'));
BuuzerFreq = str2double(get(handles.edit8,'String'));
TotalDuration = PreStimDuration + StimDuration + DecPerDuration + PostRewPerDuration;
clear contents

if isnan(NumTrials)||...
        isnan(PreStimDuration)||isnan(StimDuration) ||...
        isnan(DecPerDuration)||isnan(PostRewPerDuration) ||...
        isnan(SolenoidDuration)||isnan(BuzzerDurtation) ||...
        isnan(BuuzerFreq)
    errordlg('Fill session parameters','Error')
    disp('Error: Session parameters are needed')
    set(handles.text17,'String','...')
    return
elseif BuuzerFreq > 32767
    errordlg('Frequency of error buzzer','Error')
    disp('Error: Buzzer frequency must be between 0 Hz and 32767 Hz')
    set(handles.text17,'String','...')
    return
end

% Display variables to the user
disp('Parameters: ')
fprintf('Number of trials:  \n')
disp(NumTrials)
fprintf('Duration of pre-stimulus period (ms): \n')
disp(PreStimDuration)
fprintf('Duration of stimulation period (ms): \n')
disp(StimDuration)
fprintf('Duration of decision period (ms): \n')
disp(DecPerDuration)
fprintf('Duration of inter-trial interval (ms): \n')
disp(PostRewPerDuration)
fprintf('Duration of solenoid opening (ms): \n')
disp(SolenoidDuration)
fprintf('Duration of error buzzer (ms): \n')
disp(BuzzerDurtation)
fprintf('Frequency of error buzzer (Hz): \n')
disp(BuuzerFreq)
fprintf('Duration of each trial (ms): \n')
disp(TotalDuration)

%A Arduino's Parameters
set(handles.text17,'String','Connecting the Arduino board')
clear arduino
Arduino = arduino(COMPort);
    
% Trials beggins here
set(handles.text17,'String','Working')
estado_del_lick = [];
Responses=[];

for loop = 1:NumTrials

    %STOP button
    if STOP
        errordlg('User stopped the protocol','STOP button')
        disp('User stopped the protocol')
        set(handles.text17,'String','STOP')
        disp('--------------------------------------------------------')
        STOP = 0;
        return
    end
    % Trial and stimulus number
    disp('--------------------------------')
    fprintf('Trial: \n')
    disp(loop)
    fprintf('Stimulus: \n')
    disp(StimTrials(loop))

    %Trial graphication
    figure (1), clf
    set(gcf, 'Name', 'Go-NoGo Trial','Units','Normalized','Position',[0.1259    0.1953    0.7167    0.6289])
    title(strcat('Trial: ', string(loop),',',' Stimulus: ', string(StimTrials(loop))),...
        'FontWeight', 'bold','FontSize',10)
    xlabel('Time (s)')
    ylabel('Licks')
    grid minor
    ax=gca;
    ax.YLim = [-0.2 1.4]; % Valores extremos del eje Y
    ax.XLim = [datenum(seconds(-0.5)) ...
        datenum(milliseconds(TotalDuration)+seconds(0.5))]; % Valores extremos del eje X

    hold on
    plot(datenum(seconds(0)),-0.2:0.01:1.2,'.k','MarkerSize',6) % inicio del ensayo
    text(datenum(seconds(0)),1.25,'Start')
    plot(datenum(milliseconds(PreStimDuration))...
        ,-0.2:0.01:1.2,'.g','MarkerSize',6) % inicio de estimulación
    text(datenum(milliseconds(PreStimDuration)),1.25,'ON odorant')
    plot(datenum(milliseconds(PreStimDuration + StimDuration))...
        ,-0.2:0.01:1.2,'.g','MarkerSize',6) % Fin de estimulación
    text(datenum(milliseconds(PreStimDuration + StimDuration)),1.25,'OFF odorant')
    plot(datenum(milliseconds(PreStimDuration + StimDuration + DecPerDuration))...
        ,-0.2:0.01:1.2,'.b','MarkerSize',6) % Reward/No-reward
    text(datenum(milliseconds(PreStimDuration + StimDuration + DecPerDuration))...
        ,1.25,'Reward/No-reward')
    plot(datenum(milliseconds(PreStimDuration + StimDuration + DecPerDuration + PostRewPerDuration))...
        ,-0.2:0.01:1.2,'.k','MarkerSize',6) % End of trial
    text(datenum(milliseconds(TotalDuration))...
        ,1.25,'End')
	
    %Output variables (Responses per trial):

    %Licks for the decision period:
    Responses(loop,1) = loop; % Trial number
    Responses(loop,2) = StimTrials(loop); % Stimulus (1 or 2)
    % 3rd column = Response (0 = Error; 1 = Correct)
    % 4th column to end = Licks for the decision period

    % Licks for the entire trial:
    Raster_Licks(loop,1) = loop; % Trial number
    Raster_Licks(loop,2) = StimTrials(loop); % Stimulus (1 or 2)
    % 3rd column = Response (0 = Error; 1 = Correct)
    % 4th column to end = Licks for the entire trial

    % Start tone
    playTone(Arduino,'D3',8000,0.1) 

    % Animated line
    h = animatedline('Color','r','LineWidth',2);

    % Time counter for licks
    contador_licks = 4;

    % Start trials' time counter 
    startTime= datetime('now');

    % Pre-stimulus period
    t0 = datetime('now');
    while datetime('now') - t0 < milliseconds(PreStimDuration)
        %STOP button
        if STOP
            errordlg('User stopped the protocol','STOP button')
            disp('User stopped the protocol')
            set(handles.text17,'String','STOP')
            disp('--------------------------------------------------------')
            STOP = 0;
            return
        end
        figure (1)
        t =  datetime('now') - startTime;
        estado_del_lick = readDigitalPin (Arduino,'D6');
        addpoints(h,datenum(t),estado_del_lick);
        datetick('x','keeplimits')
        drawnow limitrate

        Raster_Licks (loop,contador_licks) = estado_del_lick;
        contador_licks = contador_licks+1;
    end

    % Stimulus
    t1 = datetime('now');
    while datetime('now') - t1 < milliseconds(StimDuration)
        if STOP
            errordlg('User stopped the protocol','STOP button')
            disp('User stopped the protocol')
            set(handles.text17,'String','STOP')
            disp('--------------------------------------------------------')
            STOP = 0;
            return
        end
        figure (1)
        writeDigitalPin(Arduino,'D10',1) % TTL pulse to olfactometer. 1 = HIGH, 5V
        t =  datetime('now') - startTime;
        estado_del_lick = readDigitalPin (Arduino,'D6');
        addpoints(h,datenum(t),estado_del_lick);
        datetick('x','keeplimits')
        drawnow limitrate

        Raster_Licks (loop,contador_licks) = estado_del_lick;
        contador_licks = contador_licks+1;
    end
    writeDigitalPin(Arduino,'D10',0) % 0 = LOW

    % Decision Period
    contador_Responses=4;
    Counter=1;
    VentanaDeRespuesta=[];

    t2 = datetime('now');
    
    while datetime('now') - t2 < milliseconds(DecPerDuration)
        if STOP
            errordlg('User stopped the protocol','STOP button')
            disp('User stopped the protocol')
            set(handles.text17,'String','STOP')
            disp('--------------------------------------------------------')
            STOP = 0;
            return
        end
        figure (1)
        %Output variables:
        Responses(loop,contador_Responses) = estado_del_lick;
        VentanaDeRespuesta(Counter) = estado_del_lick;

        % Responses counter
        contador_Responses=contador_Responses+1;
        Counter=Counter+1;

        t =  datetime('now') - startTime;
        estado_del_lick = readDigitalPin (Arduino,'D6');
        addpoints(h,datenum(t),estado_del_lick);
        datetick('x','keeplimits')
        drawnow limitrate

        Raster_Licks (loop,contador_licks) = estado_del_lick;
        contador_licks = contador_licks+1;
    end   

    % Conditions for Reward/Penalty:

    % Stimulus 1 & Lick
    if StimTrials(loop) == 1 && any(VentanaDeRespuesta) 
    	writeDigitalPin(Arduino,'D8',1) % Solenoid
        fprintf('Response:  \n')
        disp('Correct Response')
        Responses(loop,3) = 1; %Correct Response
        Raster_Licks(loop,3) = 1;
        pause(SolenoidDuration/1000)% Solenoid opening in sec

    %Stimulus 1 & No-Lick
    elseif StimTrials(loop) == 1 && ~any(VentanaDeRespuesta) 
        playTone(Arduino,'D3',BuuzerFreq,1)
        fprintf('Response:  \n')
        disp('Error')
        Responses(loop,3) = 0; % Error
        Raster_Licks(loop,3) = 0;

    %Stimulus 2 & Lick    
    elseif StimTrials(loop) == 2 && any(VentanaDeRespuesta) 
        playTone(Arduino,'D3',BuuzerFreq,1)
        fprintf('Response:  \n')
        disp('Error')
        Responses(loop,3) = 0; % Error
        Raster_Licks(loop,3) = 0;

    %Estimulo 2 y No-Lick
    elseif StimTrials(loop) == 2 && ~any(VentanaDeRespuesta) 
        fprintf('Response:  \n')
        disp('Correct Response')
        Responses(loop,3) = 1; % Correct Response
        Raster_Licks(loop,3) = 1;
	end

    if ~isempty(Responses(loop,3))
        writeDigitalPin(Arduino,'D8',0) % Solenoid closure
    end

    % Inter-trial Period
    t3 = datetime('now');
    while datetime('now') - t3 < milliseconds(PostRewPerDuration)
        if STOP
            errordlg('User stopped the protocol','STOP button')
            disp('User stopped the protocol')
            set(handles.text17,'String','STOP')
            disp('--------------------------------------------------------')
            STOP = 0;
            return
        end
        figure (1)
        t =  datetime('now') - startTime;
        estado_del_lick = readDigitalPin (Arduino,'D6');
        addpoints(h,datenum(t),estado_del_lick);
        datetick('x','keeplimits')
        drawnow limitrate

        Raster_Licks (loop,contador_licks) = estado_del_lick;
        contador_licks = contador_licks+1;
    end
    figure (1)
end

disp('Session ended')
disp('--------------------------------')

% Results graphication
set(handles.text17,'String','Plotting the results')
figure(2), clf
set(gcf, 'Name', 'Raster of licks','Units','Normalized','Position',[0.2189    0.1042    0.7167    0.6289])
% Raster of licks through trial
subplot(2,1,1)
imagesc(linspace(0,TotalDuration/1000,size(Raster_Licks,2)-3),...
    linspace(1,size(Raster_Licks,1),size(Raster_Licks,1)),...
    Raster_Licks(:,4:end))
colormap([1 1 1; 0 0 0])
c = colorbar;
c.Ticks = [0 1];
c.TickLabels = {'No-Lick'; 'Lick'};
    
hold on
plot(PreStimDuration/1000, ...
    linspace(1,NumTrials,NumTrials*10),'.g','MarkerSize',6)
plot((PreStimDuration + StimDuration)/1000, ...
    linspace(1,NumTrials,NumTrials*10),'.g','MarkerSize',6)
plot((PreStimDuration + StimDuration + DecPerDuration)/1000, ...
    linspace(1,NumTrials,NumTrials*10),'.b','MarkerSize',6)
hold off

ylim([1 NumTrials])
xlim([0 TotalDuration/1000])
title('Session')
xlabel('Time (s)')
ylabel('Trials')

% Proportion of CorrectResponses and errors (%)
CorrectResponses = sum(Responses(:,3) == 1) / size(Responses,1)*100;
Errors = sum(Responses(:,3) == 0) / size(Responses,1)*100;

% Graph of proportion of CorrectResponses and errors
subplot(2,1,2)
pie([CorrectResponses, Errors])
legend({'Correct Responses','Errors'}, 'Location', 'Best')
title('Proportion of Correct responses and errors')

% Saving results
set(handles.text17,'String','Saving results')
disp('Saving results')

[filename,path] = uiputfile('*.mat','Save results');

if isequal(filename,0) || isequal(filename,0)
       disp('Results were not saved by the user')
    else 

    Results = {'Responses through session', Raster_Licks;...
        '% of Correct responses',CorrectResponses; '% of errors', Errors;...
        'Number of trials', NumTrials;...
        'Duration of pre-stimulus period (ms)', PreStimDuration; 'Stimulus duration', StimDuration;...
        'Duration of decision period (ms)', DecPerDuration;...
        'Duration of inter-trial interval (ms)', PostRewPerDuration;
        'Duration of trials (ms) ', TotalDuration;...
        'Date',datetime('now')};

    cd(path)
    save(filename,'Results');
    H = figure(2);
    savefig(H, filename(1:end-4));

    fprintf('Data was saved in:  \n')
    disp(path)
    fprintf('File name:  \n')
    disp(filename)
end

disp('--------------------------------')

set(handles.text17,'String','...')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global STOP
STOP = get(hObject,'Value');

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Generate Matrix of stimuli
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global StimTrials

NumTrials = str2double(get(handles.edit1,'String'));
if isnan(NumTrials)
    errordlg('Type the number of trials','Error')
    disp('Error: Number of trials is needed')
    return
elseif rem(NumTrials, 2)
    errordlg('Number of trials must be an even number','Error')
    disp('Error: Number of trials must be an even number')
    return
end
    
% Stimulus matrix (50% probability for each stimulus)
MatrizUnos = ones(NumTrials/2,1); % Ones matrix with NumTrials/2 row
MatrizDos = MatrizUnos+1; % Twos Matrix with NumTrials/2 row
Matriz_UD = cat(1,MatrizUnos,MatrizDos); % Concatenated matrices
StimM = Matriz_UD(randperm(length(Matriz_UD))); % Randomization of concatenated matrix
StimTrials = StimM(randperm(length(StimM))); % Second randomization

disp('Matrix of stimuli (copy to olfactometer software):')
if NumTrials <= 10
    StimMatrix = StimTrials';
    disp(StimMatrix)
else 
    SkipRow = 1;
    SkipColumn = 1;
    for t=1:NumTrials
        StimMatrix(SkipRow,SkipColumn) = StimTrials(t);
        SkipColumn=SkipColumn+1;
        if SkipColumn == 11
            SkipColumn = 1;
            SkipRow = SkipRow+1;
        end
    end
    disp(StimMatrix)
end
% Matrix separated by comas
[filename,path] = uiputfile('*.*','File Selection','MatrixStimuliGoNoGo.dat');
cd(path)
csvwrite(filename,StimMatrix) 

disp('Do not start the trials until you copy the matrix of stimuli to olfactometer software')
disp('--------------------------------')

% MatrizExtimulosKnosys = Matriz de 10 columnas x n filas.



