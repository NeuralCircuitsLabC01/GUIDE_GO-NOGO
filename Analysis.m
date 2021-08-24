function varargout = Analysis(varargin)
% ANALYSIS MATLAB code for Analysis.fig
% --------------------------------------------------------
% Authors: Hernández-Soto R & Villasana-Salazar B.
% Contact: rebecahernandezsoto@comunidad.unam.mx, benvillasanasalazar@gmail.com
% Institute of Neurobiology, National University of Mexico (UNAM), Mexico
% --------------------------------------------------------
% For more info read the user manual.
% --------------------------------------------------------

% Last Modified by GUIDE v2.5 25-Jul-2021 20:38:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Analysis_OutputFcn, ...
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


% --- Executes just before Analysis is made visible.
function Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Analysis (see VARARGIN)
% Choose default command line output for Analysis
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes Analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Data 
Data=[];
disp('--------------------------------------------------------')
disp('Analysis of GO/No-GO session')

set(handles.radiobutton1,'Value',0)
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.text4,'String','...')
format long

% --- Outputs from this function are returned to the command line.
function varargout = Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Load data button
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data ResultsFilename
disp('-------------------------------------------')
set(handles.text4,'String','Loading data')

[ResultsFilename,PathName, ~]=uigetfile({'*.mat', 'MATLAB file'},...
    'Select a results file');   
cd(PathName)
load(ResultsFilename,'-mat');

fprintf('Loading:  \n')
disp(ResultsFilename)

Data = Results;

set(handles.text4,'String','...')

%START button
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data ResultsFilename

if isempty(Data)
    errordlg('Select a results file','Error')
    disp('Select a results file')
    set(handles.text4,'String','Error')
    disp('--------------------------------------------------------')
    set(handles.radiobutton1,'Value',0)
    set(handles.radiobutton2,'Value',0)
    set(handles.radiobutton3,'Value',0)
    return
end

disp('-------------------------------------------')
set(handles.text4,'String','Analyzing')
disp('Analyzing')

%Session parameters:
data = Data {1,2};
NTrials = Data {4,2};
PreStimDuration = Data {5,2};
StimDuration = Data {6,2};
DecPerDuration = Data {7,2};
InterTrialDuration = Data {8,2};
TrialDuration = Data{9,2};
Trials = data(:,1);
Stimulus = data(:,2);
Raster = data(:,4:end);
timeVector = linspace(0,TrialDuration,size(Raster,2));
clear Data data

if get(handles.radiobutton1,'Value') == 1 %Behavioral categorization
    disp('Behavioral categorization')
    %   Hits = Aroma 1 + Lick
    %   Miss = Aroma 1 + No-Lick
    %   False Alarm (FA) = Aroma 2 + Lick
    %   Correct Response (CR) = Aroma 2 + No-Lick
    
    Raster_VR = Raster(:, timeVector>=PreStimDuration+StimDuration & ...
        timeVector<= PreStimDuration+StimDuration+DecPerDuration);
    
    ContadorHits = 1;
    ContadorMiss = 1;
    ContadorFA = 1;
    ContadorCR = 1;
    Hits=[];
    Miss=[];
    FA=[];
    CR=[];
    Raster_Hits=[];
    Raster_Miss=[];
    Raster_FA=[];
    Raster_CR=[];
    
    for t=1:NTrials
        if Stimulus(t) == 1 && any(Raster_VR(t,:))
            Hits(ContadorHits) = t;
            ContadorHits = ContadorHits +1;

        elseif Stimulus(t) == 1 && ~any(Raster_VR(t,:))
            Miss(ContadorMiss) = t;
            ContadorMiss = ContadorMiss +1;

        elseif Stimulus(t) == 2 && any(Raster_VR(t,:))
            FA(ContadorFA) = t;
            ContadorFA = ContadorFA +1;

        elseif Stimulus(t) == 2 && ~any(Raster_VR(t,:))
            CR(ContadorCR) = t;
            ContadorCR = ContadorCR +1;
        end
    end

    % Raster of licks for behavioral categorization

    % Hits
    if any(Hits)
        for t=1:size(Hits,2)
            Raster_Hits(t,:) = Raster(Hits(t),:);
        end
    end

    % Miss
    if any(Miss)
        for t=1:size(Miss,2)
            Raster_Miss(t,:) = Raster(Miss(t),:);
        end
    end

    % False Alarms
    if any(FA)
        for t=1:size(FA,2)
            Raster_FA(t,:) = Raster(FA(t),:);
        end
    end

    % Correct Response
    if any(CR)
        for t=1:size(CR,2)
            Raster_CR(t,:) = Raster(CR(t),:);
        end
    end
    
    % Graphication
    figure(1), clf
    set(gcf, 'Name', 'Behavioral categorization of responses',...
        'Units','Normalized','Position',[0.0044    0.2604    0.7167    0.6289])
    
    % Raw raster
    subplot(5,2,1:2)
    imagesc(timeVector/1000,...
        linspace(1,size(Raster,1),size(Raster,1)),Raster)
    hold on
    plot(PreStimDuration/1000, ...
        linspace(1,size(Raster,1),size(Raster,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration)/1000, ...
        linspace(1,size(Raster,1),size(Raster,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
        linspace(1,size(Raster,1),size(Raster,1)*10),'.b','MarkerSize',6)
    hold off
    title('Raw')
    ylabel('Trial')
    
    % Raster of Hits
    if any(Hits)
        subplot(5,2,3:4)
        imagesc(timeVector/1000,...
        linspace(1,size(Raster_Hits,1),size(Raster_Hits,1)),...
            Raster_Hits)
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(Raster_Hits,1),size(Raster_Hits,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(Raster_Hits,1),size(Raster_Hits,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(Raster_Hits,1),size(Raster_Hits,1)*10),'.b','MarkerSize',6)
        hold off
        title('Hits')
        ylabel('Trial')
        hold off
    end
    
        % Raster of Misses
    if any(Miss)
        subplot(5,2,5:6)
        imagesc(timeVector/1000,...
            linspace(1,size(Raster_Miss,1),size(Raster_Miss,1)),...
            Raster_Miss)
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(Raster_Miss,1),size(Raster_Miss,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(Raster_Miss,1),size(Raster_Miss,1)),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(Raster_Miss,1),size(Raster_Miss,1)),'.b','MarkerSize',6)
        hold off
        title('Misses')
        ylabel('Trial')
        hold off
    end
        
    % Raster of False Alarms
    if any(FA)
        subplot(5,2,7:8)
        imagesc(timeVector/1000,...
            linspace(1,size(Raster_FA,1),size(Raster_FA,1)),...
            Raster_FA)
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(Raster_FA,1),size(Raster_FA,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(Raster_FA,1),size(Raster_FA,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(Raster_FA,1),size(Raster_FA,1)*10),'.b','MarkerSize',6)
        hold off
        title('False Alarms')
        ylabel('Trial')
        hold off
    end
    
    % Raster Correct Responses
    if any(CR)
        subplot(5,2,9:10)
        imagesc(timeVector/1000,...
            linspace(1,size(Raster_CR,1),size(Raster_CR,1)),Raster_CR)
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(Raster_CR,1),size(Raster_CR,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(Raster_CR,1),size(Raster_CR,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(Raster_CR,1),size(Raster_CR,1)*10),'.b','MarkerSize',6)
        hold off
        title('Correct Rejections')
        ylabel('Trial')
        hold off
    end
    xlabel('Time (s)')
    colormap([1 1 1; 0 0 0])

    % Proportion of trials for each behavioral category
    figure(2), clf
    set(gcf, 'Name', 'Proportion of trials for each behavioral category',...
        'Units','Normalized','Position',[0.0359    0.2109    0.7167    0.6289])
    xtitles=categorical({'1.Hits','2.Misses', '3.False Alarms','4.Correct Rejections'});
    bar(xtitles,[(size(Hits,2)/NTrials)*100; (size(Miss,2)/NTrials)*100;...
        (size(FA,2)/NTrials)*100; (size(CR,2)/NTrials)*100])
    title('Proportion of trials for each behavioral category')
    ylabel('Proportion (%)')
    ylim([0 100])
        
    % Display values
    disp('Proportion of trials for each behavioral category:')
    fprintf ('Hits = \n');
    disp((size(Hits,2)/NTrials)*100);
    fprintf ('Misses = \n');
    disp((size(Miss,2)/NTrials)*100);
    fprintf ('False Alarms = \n');
    disp((size(FA,2)/NTrials)*100);
    fprintf ('Correct Rejections = \n');
    disp((size(CR,2)/NTrials)*100);
    
    % Saving results
    set(handles.text4,'String','Saving results')
    disp('--------------------------------')
    disp('Saving results')

    [filename,path] = uiputfile('*.mat','Save results');
    
    if isequal(filename,0) || isequal(filename,0)
       disp('Results were not saved by the user')
    else 
        if isempty(Hits)
            Raster_Hits=0;
        elseif isempty(Miss)
            Raster_Miss=0;
        elseif isempty(FA)
            Raster_FA=0;
        elseif isempty(CR)
            Raster_CR=0;
        end
    
        Results = {'Analysis', 'Behavioral categorization';...
            'Analyzed file', ResultsFilename;...
            '% of Hits',(size(Hits,2)/NTrials)*100;...
            '% of Misses', (size(Miss,2)/NTrials)*100;...
            '% of False Alarms',(size(FA,2)/NTrials)*100;...
            '% of Correct Rejections', (size(CR,2)/NTrials)*100;...
            'Raster Hits', Raster_Hits;...
            'Raster Misses', Raster_Miss;...
            'Raster False Alarms', Raster_FA;...
            'Raster Correct Rejections', Raster_CR;...
            'Duration of trials (ms)',TrialDuration};

        cd(path)
        save(filename,'Results');
        H(1) = figure(1);
        H(2) = figure(2);
        savefig(H, filename(1:end-4));

        fprintf('Data was saved in:  \n')
        disp(path)
        fprintf('File name:  \n')
        disp(filename)
    end
    
    disp('-------------------------------------------')
    set(handles.text4,'String','...')
    set(handles.radiobutton1,'Value',0)

%Licking frequency
elseif get(handles.radiobutton2,'Value') == 1 
    disp('Licking frequency during decision period for each category')
    
    %   Hits = Stimulus 1 + Lick
    %   Miss = Stimulus 1 + No-Lick
    %   False Alarm (FA) = Stimulus 2 + Lick
    %   Correct Response (CR) = Stimulus 2 + No-Lick
    
    Raster_VR = Raster(:, timeVector>=PreStimDuration+StimDuration & ...
        timeVector<= PreStimDuration+StimDuration+DecPerDuration);
    
    ContadorHits = 1;
    ContadorMiss = 1;
    ContadorFA = 1;
    ContadorCR = 1;
    Hits=[];
    Miss=[];
    FA=[];
    CR=[];
    Lick_Frec_Raw=0;
    Lick_Frec_Hits=0;
    Lick_Frec_Miss=0;
    Lick_Frec_FA=0;
    Lick_Frec_CR=0;
    
    % Number of trials for each behavioral category
    for t=1:NTrials
        
        Lick_Frec_Raw (t) = ...
                sum(Raster_VR(t,:))/(StimDuration/1000);
        
        if Stimulus(t) == 1 && any(Raster_VR(t,:))
            Hits(ContadorHits) = t;
            Lick_Frec_Hits (ContadorHits) = ...
                sum(Raster_VR(t,:))/(StimDuration/1000);
            ContadorHits = ContadorHits +1;
            
        elseif Stimulus(t) == 1 && ~any(Raster_VR(t,:))
            Miss(ContadorMiss) = t;
            Lick_Frec_Miss (ContadorMiss) = ...
                sum(Raster_VR(t,:))/(StimDuration/1000);
            ContadorMiss = ContadorMiss +1;

        elseif Stimulus(t) == 2 && any(Raster_VR(t,:))
            FA(ContadorFA) = t;
            Lick_Frec_FA (ContadorFA) = ...
                sum(Raster_VR(t,:))/(StimDuration/1000);
            ContadorFA = ContadorFA +1;

        elseif Stimulus(t) == 2 && ~any(Raster_VR(t,:))
            CR(ContadorCR) = t;
            Lick_Frec_CR (ContadorCR) = ...
                sum(Raster_VR(t,:))/(StimDuration/1000);
            ContadorCR = ContadorCR +1;
        end
    end

    % Display values
    disp('Mean licking frequency during decision period for each behavioral category:')
    formatSpec = 'Raw = %2.1f Hz\n';
    fprintf(formatSpec,(mean(Lick_Frec_Raw)))
    formatSpec = 'Hits = %2.1f Hz\n';
    fprintf(formatSpec,(mean(Lick_Frec_Hits)))
    formatSpec = 'Miss = %2.1f Hz\n';
    fprintf(formatSpec,(mean(Lick_Frec_Miss)))
    formatSpec = 'False Alarms = %2.1f Hz\n';
    fprintf(formatSpec,(mean(Lick_Frec_FA)))
    formatSpec = 'Correct Rejections = %2.1f Hz\n';
    fprintf(formatSpec,(mean(Lick_Frec_CR)))

    % Mean licking frequency
    figure(1), clf
    set(gcf, 'Name', 'Mean licking frequency during decision period for each behavioral category',...
        'Units','Normalized','Position',[0.0022    0.2552    0.7167    0.6289])
    xtitles=categorical({'1.Raw','2.Hits','3.Misses', '4.False Alarms','5.Correct Rejections'});
    bar(xtitles,[mean(Lick_Frec_Raw); mean(Lick_Frec_Hits);...
        mean(Lick_Frec_Miss); mean(Lick_Frec_FA); mean(Lick_Frec_CR)])
    title('Licking frequency during decision period')
    ylabel('Licking frequency (Hz)')
    ylim([0 mean(Lick_Frec_Raw)+10])
    
    % Saving results
    set(handles.text4,'String','Saving results')
    disp('--------------------------------')
    disp('Saving results')

    [filename,path] = uiputfile('*.mat','Save results');
    
    if isequal(filename,0) || isequal(filename,0)
       disp('Results were not saved by the user')
    else  
        Results = {'Analysis', 'Licking frequency (Hz)';...
            'Analyzed file', ResultsFilename;...
            'Raw', mean(Lick_Frec_Raw);...
            'Hits', mean(Lick_Frec_Hits);...
            'Miss',mean(Lick_Frec_Miss);...
            'False Alarms', mean(Lick_Frec_FA);...
            'Correct Rejections', mean(Lick_Frec_CR)};


        cd(path)
        save(filename,'Results');
        H = figure(1);
        savefig(H, filename(1:end-4));

        fprintf('Data was saved in:  \n')
        disp(path)
        fprintf('File name:  \n')
        disp(filename)
    end
    
    disp('-------------------------------------------')
    set(handles.text4,'String','...')
    set(handles.radiobutton2,'Value',0)
    
% Licking frequency through trial
elseif get(handles.radiobutton3,'Value') == 1
    disp('Licking frequency through trial')
    
    %   Hits = Aroma 1 + Lick
    %   Miss = Aroma 1 + No-Lick
    %   False Alarm (FA) = Aroma 2 + Lick
    %   Correct Response (CR) = Aroma 2 + No-Lick
    
    answer = inputdlg('Type the time bin (ms) to calculate licking frequency through trial','Time bin');
    timeBin = str2num(answer{1});
    
    if timeBin <= ceil(TrialDuration/size(Raster,2))*2
        errordlg('Time bin must be at least 2 times higher than Arduino Uno sampling interval','Error')
        disp('Error: Time bin must be at least 2 times higher than Arduino sampling interval')
        formatSpec = 'Arduino sampling interval = %2.1f ms\n';
        fprintf(formatSpec,ceil(TrialDuration/size(Raster,2)))
        set(handles.text4,'String','Error')
        disp('--------------------------------------------------------')
        return
    end
    
    TrialDuration_sec = TrialDuration/1000;
%     timeVector_sec = linspace(0,TrialDuration_sec,size(timeVector,2)); % Time vector (s)
    time_bin=0:timeBin/1000:TrialDuration_sec; % Bined time vector (s)
    Raster_VR = Raster(:, timeVector>=PreStimDuration+StimDuration & ...
        timeVector<= PreStimDuration+StimDuration+DecPerDuration);
    
    ContadorHits = 1;
    ContadorMiss = 1;
    ContadorFA = 1;
    ContadorCR = 1;
    Hits=[];
    Miss=[];
    FA=[];
    CR=[];
    raster_bin_Raw=[];
    raster_bin_Hits=[];
    raster_bin_Miss=[];
    raster_bin_FA=[];
    raster_bin_CR=[];
    
    % Behavioral categories
    for t=1:NTrials
        if Stimulus(t) == 1 && any(Raster_VR(t,:))
            Hits(ContadorHits) = t;
            ContadorHits = ContadorHits +1;

        elseif Stimulus(t) == 1 && ~any(Raster_VR(t,:))
            Miss(ContadorMiss) = t;
            ContadorMiss = ContadorMiss +1;

        elseif Stimulus(t) == 2 && any(Raster_VR(t,:))
            FA(ContadorFA) = t;
            ContadorFA = ContadorFA +1;

        elseif Stimulus(t) == 2 && ~any(Raster_VR(t,:))
            CR(ContadorCR) = t;
            ContadorCR = ContadorCR +1;
        end
    end
    
    % Raster of licks for behavioral category
    if any(Hits)
        for t=1:size(Hits,2)
            Raster_Hits(t,:) = Raster(Hits(t),:);
        end
    end
    if any(Miss)
        for t=1:size(Miss,2)
            Raster_Miss(t,:) = Raster(Miss(t),:);
        end
    end
    if any(FA)
        for t=1:size(FA,2)
            Raster_FA(t,:) = Raster(FA(t),:);
        end
    end
    if any(CR)
        for t=1:size(CR,2)
            Raster_CR(t,:) = Raster(CR(t),:);
        end
    end
    
    % Bin of Rasters
    for t=1:size(Raster,1)
        bin=1;
        count=0;
        while bin<=size(time_bin,2)
                raster_bin_Raw(t,bin) = sum(Raster(t,timeVector >=count & timeVector <=count+timeBin))/timeBin;
                bin=bin+1;
                count=count+timeBin;
        end
    end

    if any(Hits)
        for t=1:size(Raster_Hits,1)
            bin=1;
            count=0;
            while bin<=size(time_bin,2)
                    raster_bin_Hits(t,bin) = sum(Raster_Hits(t,timeVector >=count & timeVector <=count+timeBin))/timeBin;
                    bin=bin+1;
                    count=count+timeBin;
            end
        end
    end
    if any(Miss)
        for t=1:size(Raster_Miss,1)
            bin=1;
            count=0;
            while bin<=size(time_bin,2)
                    raster_bin_Miss(t,bin) = sum(Raster_Miss(t,timeVector >=count & timeVector <=count+timeBin))/timeBin;
                    bin=bin+1;
                    count=count+timeBin;
            end
        end
    end

    if any(FA)
        for t=1:size(Raster_FA,1)
            bin=1;
            count=0;
            while bin<=size(time_bin,2)
                    raster_bin_FA(t,bin) = sum(Raster_FA(t,timeVector >=count & timeVector <=count+timeBin))/timeBin;
                    bin=bin+1;
                    count=count+timeBin;
            end
        end
    end

    if any(CR)
        for t=1:size(Raster_CR,1)
            bin=1;
            count=0;
            while bin<=size(time_bin,2)
                    raster_bin_CR(t,bin) = sum(Raster_CR(t,timeVector >=count & timeVector <=count+timeBin))/timeBin;
                    bin=bin+1;
                    count=count+timeBin;
            end
        end
    end

    % Graphication of Bined Rasters 
    figure(1), clf
    set(gcf, 'Name', 'Bined licking frequency',...
        'Units','Normalized','Position',[0.0022    0.2552    0.7167    0.6289])

    % Raw raster
    subplot(5,2,1:2)
    imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Raw,2)),...
        linspace(1,size(raster_bin_Raw,1),size(raster_bin_Raw,1)),...
        raster_bin_Raw)
    colorbar
    hold on
    plot(PreStimDuration/1000,...
        linspace(1,size(raster_bin_Raw,1),size(raster_bin_Raw,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration)/1000,...
        linspace(1,size(raster_bin_Raw,1),size(raster_bin_Raw,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
        linspace(1,size(raster_bin_Raw,1),size(raster_bin_Raw,1)*10),'.b','MarkerSize',6)
    hold off
    title('Raw')
    ylabel('Trial')

    % Hits raster
    if any(Hits)
        subplot(5,2,3:4)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Hits,2)),...
            linspace(1,size(raster_bin_Hits,1),size(raster_bin_Hits,1)),...
            raster_bin_Hits)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_Hits,1),size(raster_bin_Hits,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_Hits,1),size(raster_bin_Hits,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_Hits,1),size(raster_bin_Hits,1)*10),'.b','MarkerSize',6)
        hold off
        title('Hits')
        ylabel('Trial')
    end

    % Miss raster
    if any(Miss)
        subplot(5,2,5:6)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Miss,2)),...
            linspace(1,size(raster_bin_Miss,1),size(raster_bin_Miss,1)),...
            raster_bin_Miss)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_Miss,1),size(raster_bin_Miss,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_Miss,1),size(raster_bin_Miss,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_Miss,1),size(raster_bin_Miss,1)*10),'.b','MarkerSize',6)
        hold off
        title('Misses')
        ylabel('Trial')
    end

    % FA raster
    if any(FA)
        subplot(5,2,7:8)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_FA,2)),...
            linspace(1,size(raster_bin_FA,1),size(raster_bin_FA,1)),...
            raster_bin_FA)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_FA,1),size(raster_bin_FA,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_FA,1),size(raster_bin_FA,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_FA,1),size(raster_bin_FA,1)*10),'.b','MarkerSize',6)
        hold off
        title('False Alarms')
        ylabel('Trial')
    end

    % CR raster
    if any(CR)
        subplot(5,2,9:10)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_CR,2)),...
            linspace(1,size(raster_bin_CR,1),size(raster_bin_CR,1)),...
            raster_bin_CR)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_CR,1),size(raster_bin_CR,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_CR,1),size(raster_bin_CR,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_CR,1),size(raster_bin_CR,1)*10),'.b','MarkerSize',6)
        hold off
        title('Correct Rejections')
        ylabel('Trial')
    end
    xlabel('Time (s)')

    % Z-scored licking frequency
    raster_bin_Raw_zscore = zscore(raster_bin_Raw')';

    if any(Hits)
        raster_bin_Hits_zscore = zscore(raster_bin_Hits')';
    else
        raster_bin_Hits_zscore = [];
    end
    if any(Miss)
        raster_bin_Miss_zscore = zscore(raster_bin_Miss')';
    else
        raster_bin_Miss_zscore = [];
    end
    if any(FA)
        raster_bin_FA_zscore = zscore(raster_bin_FA')';
    else 
        raster_bin_FA_zscore = [];
    end
    if any(CR)
        raster_bin_CR_zscore = zscore(raster_bin_CR')';
    else
        raster_bin_CR_zscore = [];
    end

    % Graficación Z-score
    figure(2), clf
    set(gcf, 'Name', 'Z-scored licking frequency',...
        'Units','Normalized','Position',[0.0388    0.2174    0.7167    0.6289])

    % Z-scored Raw raster
    subplot(5,2,1:2)
    imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Raw_zscore,2)),...
        linspace(1,size(raster_bin_Raw_zscore,1),size(raster_bin_Raw_zscore,1)),...
        raster_bin_Raw_zscore)
    colorbar
    hold on
    plot(PreStimDuration/1000,...
        linspace(1,size(raster_bin_Raw_zscore,1),size(raster_bin_Raw_zscore,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration)/1000,...
        linspace(1,size(raster_bin_Raw_zscore,1),size(raster_bin_Raw_zscore,1)*10),'.g','MarkerSize',6)
    plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
        linspace(1,size(raster_bin_Raw_zscore,1),size(raster_bin_Raw_zscore,1)*10),'.b','MarkerSize',6)
    hold off
    title('Raw')
    ylabel('Trial')

    % Z-scored Hits raster
    if any(Hits)
        subplot(5,2,3:4)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Hits_zscore,2)),...
            linspace(1,size(raster_bin_Hits_zscore,1),size(raster_bin_Hits_zscore,1)),...
            raster_bin_Hits_zscore)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_Hits_zscore,1),size(raster_bin_Hits_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_Hits_zscore,1),size(raster_bin_Hits_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_Hits_zscore,1),size(raster_bin_Hits_zscore,1)*10),'.b','MarkerSize',6)
        hold off
        title('Hits')
        ylabel('Trial')
    end

    % Z-scored Miss raster
    if any(Miss)
        subplot(5,2,5:6)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_Miss_zscore,2)),...
            linspace(1,size(raster_bin_Miss_zscore,1),size(raster_bin_Miss_zscore,1)),...
            raster_bin_Miss_zscore)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_Miss_zscore,1),size(raster_bin_Miss_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_Miss_zscore,1),size(raster_bin_Miss_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_Miss_zscore,1),size(raster_bin_Miss_zscore,1)*10),'.b','MarkerSize',6)
        hold off
        title('Misses')
        ylabel('Trial')
    end

    % Z-scored FA raster
    if any(FA)
        subplot(5,2,7:8)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_FA_zscore,2)),...
            linspace(1,size(raster_bin_FA_zscore,1),size(raster_bin_FA_zscore,1)),...
            raster_bin_FA_zscore)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_FA_zscore,1),size(raster_bin_FA_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_FA_zscore,1),size(raster_bin_FA_zscore,1)),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_FA_zscore,1),size(raster_bin_FA_zscore,1)),'.b','MarkerSize',6)
        hold off
        title('False Alarms')
        ylabel('Trial')
    end

    % Z-scored CR raster
    if any(CR)
        subplot(5,2,9:10)
        imagesc(linspace(0,TrialDuration/1000,size(raster_bin_CR_zscore,2)),...
            linspace(1,size(raster_bin_CR_zscore,1),size(raster_bin_CR_zscore,1)),...
            raster_bin_CR_zscore)
        colorbar
        hold on
        plot(PreStimDuration/1000,...
            linspace(1,size(raster_bin_CR_zscore,1),size(raster_bin_CR_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration)/1000,...
            linspace(1,size(raster_bin_CR_zscore,1),size(raster_bin_CR_zscore,1)*10),'.g','MarkerSize',6)
        plot((PreStimDuration + StimDuration + DecPerDuration)/1000,...
            linspace(1,size(raster_bin_CR_zscore,1),size(raster_bin_CR_zscore,1)*10),'.b','MarkerSize',6)
        hold off
        title('Correct Rejections')
        ylabel('Trial')
    end

    xlabel('Time (s)')
    
    % Saving results
    set(handles.text4,'String','Saving results')
    disp('--------------------------------')
    disp('Saving results')

    [filename,path] = uiputfile('*.mat','Save results');

    if isequal(filename,0) || isequal(filename,0)
       disp('Results were not saved by the user')
    else
        Results = {'Analysis', 'Licking frequency through trial';...
            'Analyzed file', ResultsFilename;...
            'Bined Raw Raster', raster_bin_Raw;...
            'Bined Hits Raster', raster_bin_Hits;...
            'Bined Misses Raster', raster_bin_Miss;...
            'Bined False Alarms Raster', raster_bin_FA;...
            'Bined Correct Rejections Raster', raster_bin_CR; ...
            'Bined Z-scored Raw Raster', raster_bin_Raw_zscore;...
            'Bined Z-scored Hits Raster', raster_bin_Hits_zscore;...
            'Bined Z-scored Misses Raster', raster_bin_Miss_zscore;...
            'Bined Z-scored False Alarms Raster', raster_bin_FA_zscore;...
            'Bined Z-scored Correct Rejections Raster', raster_bin_CR_zscore};

        cd(path)
        save(filename,'Results');
        H(1) = figure(1);
        H(2) = figure(2);
        savefig(H, filename(1:end-4));

        fprintf('Data was saved in:  \n')
        disp(path)
        fprintf('File name:  \n')
        disp(filename)
    end
    
    disp('-------------------------------------------')
    set(handles.text4,'String','...')
    set(handles.radiobutton3,'Value',0)
    
elseif get(handles.radiobutton1,'Value') == 0 && get(handles.radiobutton2,'Value') == 0 &&...
        get(handles.radiobutton3,'Value') == 0
    errordlg('Select an analysis','Error')
    disp('Error: Select an analysis')
    set(handles.text4,'String','Error')
    disp('--------------------------------------------------------')
    
end

% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton2
