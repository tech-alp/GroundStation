classdef GaziGroundStation < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        GAZMODELUYDUTAKIMIUIFigure  matlab.ui.Figure
        Image                       matlab.ui.control.Image
        UIAxes_2                    matlab.ui.control.UIAxes
        YukseklikGauge              matlab.ui.control.LinearGauge
        btnVideoGonder              matlab.ui.control.Button
        btnCalibration              matlab.ui.control.Button
        btnSaveTelemtry             matlab.ui.control.Button
        Panel                       matlab.ui.container.Panel
        VoltajAxes                  matlab.ui.control.UIAxes
        GpsAxes                     matlab.ui.control.UIAxes
        SicaklikAxes                matlab.ui.control.UIAxes
        BasincAxes                  matlab.ui.control.UIAxes
        TakmNoEditField_4Label_18   matlab.ui.control.Label
        TakmNoEditField_4Label_19   matlab.ui.control.Label
        TakmNoEditField_4Label_20   matlab.ui.control.Label
        TakmNoEditField_4Label_21   matlab.ui.control.Label
        TakmNoEditField_4Label_22   matlab.ui.control.Label
        TakmNoEditField_4Label_23   matlab.ui.control.Label
        TakmNoEditField_4Label_24   matlab.ui.control.Label
        TakmNoEditField_4Label_25   matlab.ui.control.Label
        TakmNoEditField_4Label_26   matlab.ui.control.Label
        TakmNoEditField_4Label_27   matlab.ui.control.Label
        TakmNoEditField_4Label_28   matlab.ui.control.Label
        TakmNoEditField_4Label_29   matlab.ui.control.Label
        TakmNoEditField_4Label_30   matlab.ui.control.Label
        TakmNoEditField_4Label_31   matlab.ui.control.Label
        TakmNoEditField_4Label_32   matlab.ui.control.Label
        TakmNoEditField_4Label_33   matlab.ui.control.Label
        TakmNoEditField_4Label_34   matlab.ui.control.Label
        GonderimSaatiEditField      matlab.ui.control.EditField
        ComportLabel                matlab.ui.control.Label
        ComportDropDown             matlab.ui.control.DropDown
        BaudrateDropDownLabel       matlab.ui.control.Label
        BaudrateDropDown            matlab.ui.control.DropDown
        btnDisconnect               matlab.ui.control.Button
        btnConnect                  matlab.ui.control.Button
        Label                       matlab.ui.control.Label
        TakmNoEditField_4Label_35   matlab.ui.control.Label
        TakmNoEditField_4Label_36   matlab.ui.control.Label
        TakmNoEditField_4Label_37   matlab.ui.control.Label
        TakmNoEditField_4Label_38   matlab.ui.control.Label
        TakmNoEditField_4Label_39   matlab.ui.control.Label
        TakmNoEditField_4Label_40   matlab.ui.control.Label
        TakmNoEditField_4Label_41   matlab.ui.control.Label
        Lamp_3                      matlab.ui.control.Lamp
        Lamp_4                      matlab.ui.control.Lamp
        Lamp_5                      matlab.ui.control.Lamp
        Lamp_6                      matlab.ui.control.Lamp
        Lamp_7                      matlab.ui.control.Lamp
        Lamp_8                      matlab.ui.control.Lamp
        btnFligth                   matlab.ui.control.StateButton
        BtnGps                      matlab.ui.control.Button
        BtnSeperation               matlab.ui.control.Button
        PortEditFieldLabel          matlab.ui.control.Label
        PortEditField               matlab.ui.control.EditField
        IPEditFieldLabel            matlab.ui.control.Label
        IPEditField                 matlab.ui.control.EditField
        UserShowlbl                 matlab.ui.control.Label
        TakimNoEditField            matlab.ui.control.NumericEditField
        PaketNoEditField            matlab.ui.control.NumericEditField
        BasincEditField             matlab.ui.control.NumericEditField
        YukseklikEditField          matlab.ui.control.NumericEditField
        InisHiziEditField           matlab.ui.control.NumericEditField
        SicaklikEditField           matlab.ui.control.NumericEditField
        PilGerilimiEditField        matlab.ui.control.NumericEditField
        GpsLatEditField             matlab.ui.control.NumericEditField
        GpsLonEditField             matlab.ui.control.NumericEditField
        GpsAltEditField             matlab.ui.control.NumericEditField
        UyduStatusEditField         matlab.ui.control.NumericEditField
        PitchEditField              matlab.ui.control.NumericEditField
        RollEditField               matlab.ui.control.NumericEditField
        YawEditField                matlab.ui.control.NumericEditField
        DonusSayisiEditField        matlab.ui.control.NumericEditField
        VideoAktarimEditField       matlab.ui.control.NumericEditField
        UIAxes                      matlab.ui.control.UIAxes
        BtnImpellent                matlab.ui.control.Button
        ImageCamera                 matlab.ui.control.Image
        Image3D                     matlab.ui.control.Image
        CameraDropDownLabel         matlab.ui.control.Label
        CameraDropDown              matlab.ui.control.DropDown
    end

    
    properties (Access = public)
        hax4; 
        hax;
        cam;
        State;
        xbee;
        tcp;
        
        file; %for 2MB video
        path; %for 2MB video
        transmitingData;
        lastTransmitingData; 
        fisrtPacketSize;
        lastPacketSize;
        Stop = true;
        
        ledState = -1;
        command = -1;                % 0 -> Calibration, 1-> telemtry, 2-> video
        numTransmitingVideo = 1;
        seperationCount = 0;
        sn = 0;                      % second for transmiting video data
        port;
        t;
        impellentCount = 0;
        
        fileID; % using for writing the telemetry file
        
        %Animated line axes variables
        hV;                     %  --> Voltaj Axes
        hB;                     %  --> Basinc Axes
        hS;                     %  --> Sicaklik Axes
        hG;                     %  --> Gps Axes
        
        % Telemtry Variables
        TakimNo;                %  --> 1
        PaketNumarasi;          %  --> 2
        GondermeSaati;          %  --> 3
        Basinc;                 %  --> 4
        Yukseklik;              %  --> 5
        InisHizi;               %  --> 6
        Sicaklik;               %  --> 7
        PilGerilimi;            %  --> 8
        GpsLat;                 %  --> 9
        GpsLon;                 %  --> 10
        GpsAlt;                 %  --> 11
        UyduStatus;             %  --> 12
        Pitch;                  %  --> 13
        Roll;                   %  --> 14
        Yaw;                    %  --> 15
        DonusSayisi;            %  --> 16
        VideoAktarimBilgisi;    %  --> 17
        
        GondermeYili;
        vidObj;
    end
    
    methods (Access = public)
        
%***************************************************************************************************%
        function vidData = Web_Cam(app)
            %app.cam = webcam;
            %frame = snapshot(app.cam);
            %image(app.UIAxes,frame);
            vidData = getsnapshot(app.cam);
            image(app.UIAxes,vidData);
            drawnow
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function openVideoFile(app)
             app.vidObj = VideoWriter('TMUY2020_52714_VID.avi');
             open(app.vidObj);
        end
%***************************************************************************************************%

%***************************************************************************************************%     
        function res = make8b(~,num)
            val = uint16(num);
            res = flip(typecast(val,'uint8'));
            res(end) = res(end) + 3;
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function initCam(app)
            try
                app.cam  = videoinput('winvideo',2);
            catch
                objects = imaqfind; %find video input objects in memory
                delete(objects)     %delete a video input object from memory
                app.cam  = videoinput('winvideo',2);
            end
            set(app.cam, 'FramesPerTrigger', Inf);   %Inf
            set(app.cam, 'ReturnedColorspace', 'rgb');
            app.cam.FrameGrabInterval = 5;
            start(app.cam);
            %set(vid, 'FramesPerTrigger',1);
            %vid.ReturnedColorspace = 'rgb';
            %vid.Timeout = 6;
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function closeCam(app)
            stop(app.cam);
            flushdata(app.cam);
            app.cam.TimerFcn = {'stop'};
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %Set the communicationn parameters with TCP/IP
        function StartTcpip(app)
            ip   = app.IPEditField.Value;
            remotePort = str2double(app.PortEditField.Value);
            app.xbee = tcpip(ip,remotePort,"InputBufferSize",512,"OutputBufferSize",50000,"Timeout",5);
            set(app.xbee,'Terminator','CR/LF');
            %set(app.xbee,'ReadAsyncMode','continuous');
        end
%***************************************************************************************************%


%         % Open serial communacation with device
%         function openTcp(app)
%             app.Stop = false;
%             if(strcmp(app.tcp.Status,'closed'))
%                 fopen(app.tcp);
%             end
%         end
%         
%         % Close tcp communacation
%         function closeTcp(app)
%             app.Stop = true;
%             pause(1);
%             if(strcmp(app.tcp,'open'))
%                 fclose(app.tcp);
%             end
%         end


%***************************************************************************************************%
        % Open serial communacation with device
        function openCom(app)
            app.Stop = false;
            if(strcmp(app.xbee.Status,'closed'))
                fopen(app.xbee);
            end
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %Set the communicationn parameters
        function StartCom(app)
            app.xbee = serial(app.ComportDropDown.Value,"BaudRate",...
                    str2double(app.BaudrateDropDown.Value));
            set(app.xbee,'Parity','None');
            set(app.xbee,'FlowControl','None');
            set(app.xbee,'Terminator','CR/LF');
            set(app.xbee,'ReadAsyncMode','continuous');
            set(app.xbee,'InputBufferSize',512);
            set(app.xbee,'OutputBufferSize',46000);
            set(app.xbee,'TimeOut',10);
        end
%***************************************************************************************************%

%***************************************************************************************************%
        % Close serial communacation
        function close(app)
            app.Stop = true;
            pause(0.5);
            if(strcmp(app.xbee,'open'))
                fclose(app.xbee);
            end
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %if there are not serial comport name in port combobox, then add the comport
        function Add_DropDown_Items(~,h,new)
            if ~any(ismember(h.Items, new))
                h.Items = [h.Items new];
            end
            h.Value = new;
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %proper led must be open, when statellite communication with pc
        function setLedState(app)
            if(app.ledState ~= app.UyduStatus)
                app.ledState = app.UyduStatus;
                switch(app.UyduStatus)
                    %UÇUŞ HAZIRLIK
                    case 1
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_4.Color = [0.64,0.08,0.18];
                        app.Lamp_5.Color = [0.64,0.08,0.18];
                        app.Lamp_6.Color = [0.64,0.08,0.18];
                        app.Lamp_7.Color = [0.64,0.08,0.18];
                        app.Lamp_8.Color = [0.64,0.08,0.18];
                    %YÜKSELİŞ
                    case 2
                        app.Lamp_4.Color = [0.00,1.00,0.00];
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_5.Color = [0.64,0.08,0.18];
                        app.Lamp_6.Color = [0.64,0.08,0.18];
                        app.Lamp_7.Color = [0.64,0.08,0.18];
                        app.Lamp_8.Color = [0.64,0.08,0.18];    
                    %APOAPSİS
                    case 3
                        app.Lamp_5.Color = [0.00,1.00,0.00];
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_4.Color = [0.00,1.00,0.00];
                        app.Lamp_6.Color = [0.64,0.08,0.18];
                        app.Lamp_7.Color = [0.64,0.08,0.18];
                        app.Lamp_8.Color = [0.64,0.08,0.18];
                    %ALÇALIŞ
                    case 4
                        app.Lamp_6.Color = [0.00,1.00,0.00];
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_4.Color = [0.00,1.00,0.00];
                        app.Lamp_5.Color = [0.00,1.00,0.00];
                        app.Lamp_7.Color = [0.64,0.08,0.18];
                        app.Lamp_8.Color = [0.64,0.08,0.18];
                    %ALÇALIŞ VE AYRILMA
                    case 5
                        app.Lamp_7.Color = [0.00,1.00,0.00];
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_4.Color = [0.00,1.00,0.00];
                        app.Lamp_5.Color = [0.00,1.00,0.00];
                        app.Lamp_6.Color = [0.00,1.00,0.00];
                        app.Lamp_8.Color = [0.64,0.08,0.18];
                    %İNİŞ
                    case 6
                        app.Lamp_8.Color = [0.00,1.00,0.00];
                        app.Lamp_3.Color = [0.00,1.00,0.00];
                        app.Lamp_4.Color = [0.00,1.00,0.00];
                        app.Lamp_5.Color = [0.00,1.00,0.00];
                        app.Lamp_6.Color = [0.00,1.00,0.00];
                        app.Lamp_7.Color = [0.00,1.00,0.00];
                    
                    %All color will be red if there are any state cases
                    otherwise
                        app.Lamp_3.Color = [0.64,0.08,0.18];
                        app.Lamp_4.Color = [0.64,0.08,0.18];
                        app.Lamp_5.Color = [0.64,0.08,0.18];
                        app.Lamp_6.Color = [0.64,0.08,0.18];
                        app.Lamp_7.Color = [0.64,0.08,0.18];
                        app.Lamp_8.Color = [0.64,0.08,0.18];                                
                end
            end
        end
%***************************************************************************************************%

%***************************************************************************************************%
        % Select the document from Desktop
        function selectFile(app)
            [app.file,app.path] = uigetfile('*.mp4;*.avi');  %open a mat file
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function parseVideoData(app,second)
            %fileName = '2MB';
            pathFile = fullfile(app.path,app.file);
            videofile = fopen(pathFile,'r');
            videoData = fread(videofile,'uint8=>uint8');
            
            videoData = videoData';
            % Select the minute for transmit the video data
            app.sn = second;
            % Get the len data
            lenData = length(videoData);
            % total of first transmiting Data
            totalPacket = lenData/app.sn;
            % select the packet size
            app.fisrtPacketSize = floor(totalPacket);
            % Last packet size
            app.lastPacketSize = lenData - app.fisrtPacketSize*app.sn;
            % Create the transmiting Data
            app.transmitingData = uint8(zeros(app.sn,app.fisrtPacketSize));
            %Add the last packet size data
            app.lastTransmitingData = uint8(zeros(1,app.lastPacketSize));
            
            % First transmiting Data
            for i = 0:app.sn-1
                for j = 1:app.fisrtPacketSize
                    app.transmitingData(i+1,j) = videoData(j + i*app.fisrtPacketSize);
                end
            end
            
            % Second transmiting Data
            for i=1:app.lastPacketSize
               app.lastTransmitingData(1,i) = videoData(app.sn*app.fisrtPacketSize + i);
            end
            
            fclose(videofile);
        end
%***************************************************************************************************%

%***************************************************************************************************%
        % Read Telemtry and place the class telemtry variables.
        function readTelemtryData(app)
             %incomingData = fscanf(app.xbee,'%i,%i,%i,%i,%i,%i,%i,%i,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%i,%i,%i,%i,%i,%i',byte);
             pause(0.05);
             byte = app.xbee.BytesAvailable;
             timeOut = 0;
             while(byte < 70 && timeOut < 1000), byte = app.xbee.BytesAvailable; pause(0.005); timeOut = timeOut + 1; end
             %TODO calibration comand will be set earlier day.
             if(timeOut < 999)
                 incomingData = fscanf(app.xbee,'%f');
                 app.TakimNo             = incomingData(1);
                 app.PaketNumarasi       = incomingData(2);
                 gun                     = incomingData(3);
                 ay                      = incomingData(4);
                 yil                     = incomingData(5);
                 saat                    = incomingData(6);
                 dakika                  = incomingData(7);
                 saniye                  = incomingData(8);
                 app.Basinc              = incomingData(9);
                 app.Yukseklik           = incomingData(10);
                 app.InisHizi            = incomingData(11);
                 app.Sicaklik            = incomingData(12);
                 app.PilGerilimi         = incomingData(13);
                 app.GpsLat              = incomingData(14);
                 app.GpsLon              = incomingData(15);
                 app.GpsAlt              = incomingData(16);
                 app.UyduStatus          = incomingData(17);
                 app.Pitch               = incomingData(18);
                 app.Roll                = incomingData(19);
                 app.Yaw                 = incomingData(20);
                 app.DonusSayisi         = incomingData(21);
                 app.VideoAktarimBilgisi = incomingData(22);
                 app.GondermeSaati       = sprintf('%d:%d:%d',saat,dakika,saniye);
                 app.GondermeYili        = sprintf('%d:%d:%d',yil,ay,gun);
             end
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %all telemtry datas place matching edittext.
        function placeTelemtryData(app)
             app.TakimNoEditField.Value       = app.TakimNo;
             app.PaketNoEditField.Value       = app.PaketNumarasi;
             app.GonderimSaatiEditField.Value = app.GondermeSaati;
             app.BasincEditField.Value        = app.Basinc;
             app.YukseklikEditField.Value     = app.Yukseklik;
             app.InisHiziEditField.Value      = app.InisHizi;
             app.SicaklikEditField.Value      = app.Sicaklik;
             app.PilGerilimiEditField.Value   = app.PilGerilimi;
             app.GpsLatEditField.Value        = app.GpsLat;
             app.GpsLonEditField.Value        = app.GpsLon;
             app.GpsAltEditField.Value        = app.GpsAlt;
             app.UyduStatusEditField.Value    = app.UyduStatus;
             app.PitchEditField.Value         = app.Pitch;
             app.RollEditField.Value          = app.Roll;
             app.YawEditField.Value           = app.Yaw;
             app.DonusSayisiEditField.Value   = app.DonusSayisi;
             app.VideoAktarimEditField.Value  = app.VideoAktarimBilgisi;
             
             %Gauge
             app.YukseklikGauge.Value = app.Yukseklik;
             %app.GaugeEdit.Value      = app.Yukseklik;  % Maybe later version
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %when telemtry is chancing time, show this telemtry data
        function plotAllTelemtry(app,x)
            % TODO: Plot all telemtry data in here.
            Rz = makehgtform('xrotate',deg2rad(app.Roll),'yrotate',deg2rad(app.Pitch),'zrotate',deg2rad(app.Yaw));
            set(app.t,'Matrix',Rz);
            addpoints(app.hV,x,app.PilGerilimi);
            addpoints(app.hS,x,app.Sicaklik);
            addpoints(app.hB,x,app.Basinc);
            addpoints(app.hG,app.GpsLat,app.GpsLon,app.GpsAlt);
            drawnow
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %write telemetry to csv file
        function print(app)
            totalGonderme = [app.GondermeYili,' ',app.GondermeSaati];
            fprintf(app.fileID,'%i,%i,%s,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%i,%i,%i,%i,%i,%i',...
                app.TakimNo,app.PaketNumarasi,totalGonderme,app.Basinc,...
                app.Yukseklik,app.InisHizi,app.Sicaklik,app.PilGerilimi,app.GpsLat,...
                app.GpsLon,app.GpsAlt,app.UyduStatus,app.Pitch,app.Roll,app.Yaw,...
                app.DonusSayisi,app.VideoAktarimBilgisi);
            fprintf(app.fileID,'\n');
        end
%***************************************************************************************************%

%***************************************************************************************************%
        %send the date and time to set the clock in Teensy
        function datetime = DateTime(~)
            dt = strcat('C',datestr(now,'dd mm yyyy HH MM SS'));
            datetime = dt;
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function sendCommandOld(app)    %old version       
            if(app.command == 0)          %just telemetry
                %fprintf(app.xbee,'%f/r',[0 0]);
                fwrite(app.xbee,[0 3 0],'uint8');
            elseif(app.command == 1 && app.numTransmitingVideo ~= app.sn)
                %sendingData = sprintf('%d %d %d',app.packetSize,1,app.transmitingData(app.numTransmitingVideo,:));
                %disp(size(sendingData));
                %First package size will be big so we must send big data
                %try msb, lsb
                sendingData = [app.packetSize,1,app.transmitingData(app.numTransmitingVideo,:)];
                fprintf(app.xbee,'%f',sendingData);     %video, telemetry
                app.numTransmitingVideo = app.numTransmitingVideo + 1;
                if(app.numTransmitingVideo == app.sn)
                    fprintf(app.xbee,'%f/r',[app.lastPacketSize,1,app.lastTransmitingData]);
                    app.UserShowlbl.Text = 'Video Akatarıldı';
                    app.command = 0;
                end
            elseif(app.command == 2)                                                                            %impellent
                if(app.impellentCount < 11)
                    fwrite(app.xbee,[0 3 2],'uint8');
                    app.impellentCount = app.impellentCount +1;
                    app.UserShowlbl.Text = 'Tahrik Aktif';
                else
                    app.UserShowlbl.Text = 'Tahrik Bitti';
                    fwrite(app.xbee,[0 3 0],'uint8');
                    app.command = 0;
                end
            elseif(app.command == 3)                                                                            %seperation
                if(app.seperationCount ~= 3)
                    fwrite(app.xbee,[0 3 3],'uint8');
                    app.seperationCount = app.seperationCount +1;
                elseif(app.VideoAktarimBilgisi == 0 && app.seperationCount == 3)
                    if(app.numTransmitingVideo ~= app.sn)
                        fprintf(app.xbee,'%f/r',[app.packetSize,1,app.transmitingData(app.numTransmitingVideo,:)]);
                        app.numTransmitingVideo = app.numTransmitingVideo + 1;
                        app.command = 1;
                    elseif(app.numTransmitingVideo == app.sn)
                        fprintf(app.xbee,'%f/r',[app.lastPacketSize,1,app.lastTransmitingData]);
                        app.command = 0;
                    end
                end
            end
        end
%***************************************************************************************************%

%***************************************************************************************************%
        function sendCommand(app)
            switch app.command
                %------------------------------------------------------
                case 0
                % telemetry
                    fwrite(app.xbee,[0 3 0],'uint8');
        
                %------------------------------------------------------
                case 1
                % video
                    if(app.numTransmitingVideo ~= app.sn)
                        u8byte = app.make8b(app.fisrtPacketSize);
                        sendingData = [u8byte,1,app.transmitingData(app.numTransmitingVideo,:)];
                        fwrite(app.xbee,sendingData,'uint8');
                        app.numTransmitingVideo = app.numTransmitingVideo + 1;
                        app.UserShowlbl.Text = 'Video Aktarılıyor..';
                    else
                        u8byte = app.make8b(app.lastPacketSize);
                        sendingData = [u8byte,1,app.lastTransmitingData];
                        fwrite(app.xbee,sendingData,'uint8');
                        app.UserShowlbl.Text = 'Video Akatarıldı';
                        app.command = 0;
                    end
        
                %------------------------------------------------------
                case 2
                % impellent
                    fwrite(app.xbee,[0 3 2],'uint8');
        
                %------------------------------------------------------
                case 3
                % seperation
                    fwrite(app.xbee,[0 3 3],'uint8');
                    app.command = 0;
%                     app.seperationCount = app.seperationCount +1;
        
%                     if(app.VideoAktarimBilgisi == 1 && app.seperationCount > 3)
%                         app.command = 0;
%                     elseif(app.VideoAktarimBilgisi == 0 && app.seperationCount > 3)
%                         app.command = 1;
%                     end
        
                %------------------------------------------------------
                otherwise
                    fwrite(app.xbee,[0 3 0],'uint8');
            end
        end
%***************************************************************************************************%

    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            if ~isempty(instrfind)
                fclose(instrfind);
                delete(instrfind);
            end
            Ports = seriallist;
            info = instrhwinfo('serial');          %Find proper ports for communication
            app.port = info.AvailableSerialPorts;  %Find available serial port
            col = size(Ports,2);
            if ~isempty(Ports)
                for i=1:col
                    app.Add_DropDown_Items(app.ComportDropDown,Ports);
                end
            end
            
%             cameras = imaqhwinfo('winvideo');
%             lenC = length(cameras.DeviceIDs);
%             for i=1:lenC
%                 app.Add_DropDown_Items(app.CameraDropDown,cameras.DeviceInfo(i).DeviceName);
%             end
            
            app.initCam();          % initialize usb camera
            app.openVideoFile();
            
            box(app.UIAxes,'off');
        
            % open file for writing the telemetry data
            filename = 'TMUY2020_52714_TLM.csv';
            app.fileID = fopen(filename,'w');
            header = ['TAKIM NO,','PAKET NUMARASI,','GONDERME SAATI,','BASINC,',...
                'YUKSEKLIK,','INIS HIZI,','SICAKLIK,','PIL GERILIMI,','GPS LATITUDE,',...
                'GPS LONGITUDE,','GPS ALTITUDE,','UYDU STATUSU,','PITCH,','ROLL,'...,
                'YAW,','DONUS SAYISI,','VIDEO AKTARIM BILGISI'];
            
            %write the header to file
            fprintf(app.fileID,'%s',header);
            fprintf(app.fileID,'\n');  % for new line
            
            
            % Z-label for gps axes         
            app.GpsAxes.ZLabel.String = "Altitude";
            
            %Create a 3D shape for satellite
            app.hax4 = app.UIAxes_2; 
            app.hax4.ZLim =([-1.5 1.5]);
            axis(app.hax4,"equal");
            hold(app.hax4,"on");

            app.hax4.ZLabel.String  = 'Z';
            app.hax4.Colormap = [1 0 1; 0 0 1; 1 1 0];
            patchData = stlread('GörevYükü.STL'); %THIS IS THE ONLY LINE THAT'S REALLY DIFFERENT FROM BEFORE.
            %p = patch('faces',F,'vertices',V,'FaceColor',[0.8 0.8 1.0],'FaceLighting','gouraud');
            p1 = patch(app.hax4,patchData,'FaceColor',[0.8 0.8 1.0],'FaceLighting','gouraud');
            rotate(p1, [-400 60 0], 261);
            grid(app.UIAxes_2,'on');
            view(app.hax4,[90,0]);
            
            material(p1,'metal'); %Not really needed, just makes the plane shinier.
            %camlight(app.hax4,'rigth'); %... and better lit.
            app.hax4.Visible = 'off';
            app.t = hgtransform('Parent',app.UIAxes_2);
            set(p1,'Parent',app.t);

    
            %AnimatedLine for temelmetry datas
            app.hV = animatedline(app.VoltajAxes,'LineStyle','-','Color',[0.75,0.12,0.12],'LineWidth',1);
            app.hB = animatedline(app.BasincAxes,'LineStyle','-','Color',[0.75,0.12,0.12],'LineWidth',1);
            app.hS = animatedline(app.SicaklikAxes,'LineStyle','-','Color',[0.75,0.12,0.12],'LineWidth',1);
            
            % Create a marker to show 3D position data
            app.hG = animatedline(app.GpsAxes,'Color',[0.75,0.12,0.12],'LineStyle','none','Marker','o','MarkerSize',4);
            
           
        end

        % Button pushed function: btnConnect
        function btnConnectPushed(app, event)
            app.btnConnect.Enable = 'off';
            app.btnDisconnect.Enable = 'on';
            app.StartCom();
            if(app.fileID == 0)
                app.fileID = fopen(filename,'a');
            end
            %app.StartTcpip();
        end

        % Button pushed function: btnDisconnect
        function btnDisconnectPushed(app, event)
            app.btnDisconnect.Enable = 'off';
            app.btnConnect.Enable = 'on';
            app.close();
            close(app.vidObj);
            app.closeCam();
            if(app.fileID ~= 0), fclose(app.fileID); end
        end

        % Button pushed function: btnCalibration
        function btnCalibrationPushed(app, event)
            %Claibration command are used for calibration pitch, rool, yaw,
            %and altitude.Then, you must send 'C' command.
            %fwrite(app.xbee,'C',"uchar");
            app.openCom();
            pause(1);
            flushinput(app.xbee);
            if(~app.Stop)
                fprintf(app.xbee,'%s',app.DateTime());
                pause(0.5);
                
                byte = app.xbee.BytesAvailable;
                timeout = 0;
                while(byte == 0 && timeout < 1000), byte = app.xbee.BytesAvailable; timeout = timeout +1; end
                if(timeout > 999)
                    app.UserShowlbl.Text = "Timeout";
                else
                    incomingData = fscanf(app.xbee,'%d',byte);
                    if(incomingData == 1)
                        app.UserShowlbl.Text = "Kalibrasyon Yapıldı.";
                    else
                        app.UserShowlbl.Text = "Kalibrasyon Yapılmadı.";
                    end
                end
            end
            % Show the eigth figure in window.
            
            % TODO: add communication with calibration comand in flight
            % software.
           
        end

        % Button pushed function: btnSaveTelemtry
        function btnSaveTelemtryButtonPushed(app, event)
            try
                app.selectFile();
                app.parseVideoData(50);   %video packets will be 10.
                app.UserShowlbl.Text = num2str(size(app.transmitingData));
            catch
                app.UserShowlbl.Text = "Video Error.";
            end
        end

        % Value changed function: btnFligth
        function btnFligthValueChanged(app, event)
            value = app.btnFligth.Value;

            if(value == 1)
                app.btnFligth.Icon ='i3ElT3.png';
                app.UserShowlbl.Text = "Connecting...";
                app.Panel.Visible = 'on';
                app.Image3D.Visible = 'off';
                app.ImageCamera.Visible = 'off';
                app.openCom();
                pause(1);
                app.command = 0;
                byte = app.xbee.BytesAvailable();
                if(byte > 0)
                    flushinput(app.xbee);
                end
                tic;
                i = 0; 
                while(~app.Stop)
                    elapsedTime = toc;
                    vidData = app.Web_Cam();
                    writeVideo(app.vidObj,vidData);
                    try
                        if(elapsedTime > 0.8)
                            tic;
                            app.UserShowlbl.Text = num2str(elapsedTime);
                            app.sendCommand();
                            pause(0.005);
                            app.readTelemtryData();
                            app.plotAllTelemtry(i);
                            app.placeTelemtryData();
                            app.print();
                            app.setLedState();
                            i=i+1;
                        end
                    catch
                        flushinput(app.xbee);
                        app.readTelemtryData();
                        app.plotAllTelemtry(i);
                        app.placeTelemtryData();
                        app.print();
                        app.setLedState();
                        i=i+1;
                    end
                end
            
            % Close communication satallite and the file
            else
                if(app.Stop == false), app.Stop = true; end
                if(app.fileID ~= 0)
                    app.UserShowlbl.Text = "Disconnect";
                    %app.Panel.Visible = 'off';
                    app.Image3D.Visible = 'on';
                    app.ImageCamera.Visible = 'on';
                end
                app.btnFligth.Icon ='wUUtAo.png';
            end
        end

        % Button pushed function: btnVideoGonder
        function btnVideoGonderButtonPushed(app, event)
            app.command = 1;
            app.btnVideoGonder.Enable = "off";
        end

        % Button pushed function: BtnSeperation
        function BtnSeperationPushed(app, event)
            app.command = 3;
        end

        % Button pushed function: BtnImpellent
        function BtnImpellentPushed(app, event)
            app.command = 2;
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create GAZMODELUYDUTAKIMIUIFigure and hide until all components are created
            app.GAZMODELUYDUTAKIMIUIFigure = uifigure('Visible', 'off');
            app.GAZMODELUYDUTAKIMIUIFigure.Position = [0 34 1543 802];
            app.GAZMODELUYDUTAKIMIUIFigure.Name = 'GAZİ MODEL UYDU TAKIMI';
            app.GAZMODELUYDUTAKIMIUIFigure.Resize = 'off';

            % Create Image
            app.Image = uiimage(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Image.ScaleMethod = 'stretch';
            app.Image.HorizontalAlignment = 'left';
            app.Image.VerticalAlignment = 'top';
            app.Image.Position = [1 2 1541 801];
            app.Image.ImageSource = 'eBKnm3.png';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.GAZMODELUYDUTAKIMIUIFigure);
            title(app.UIAxes_2, '')
            xlabel(app.UIAxes_2, '')
            ylabel(app.UIAxes_2, '')
            app.UIAxes_2.PlotBoxAspectRatio = [1.37394957983193 1 1];
            app.UIAxes_2.FontUnits = 'inches';
            app.UIAxes_2.FontSize = 0.125;
            app.UIAxes_2.XLim = [-2 2];
            app.UIAxes_2.YLim = [-2 2];
            app.UIAxes_2.ZLim = [-1.5 1.5];
            app.UIAxes_2.View = [42 26];
            app.UIAxes_2.CameraViewAngle = 9.43765779079212;
            app.UIAxes_2.BackgroundColor = [1 1 1];
            app.UIAxes_2.Position = [1215 552 309 233];

            % Create YukseklikGauge
            app.YukseklikGauge = uigauge(app.GAZMODELUYDUTAKIMIUIFigure, 'linear');
            app.YukseklikGauge.Limits = [0 700];
            app.YukseklikGauge.Orientation = 'vertical';
            app.YukseklikGauge.ScaleColors = [1 0.4118 0.1608;1 1 0;0.4157 1 0;0.0118 1 0.0118];
            app.YukseklikGauge.ScaleColorLimits = [600 700;400 600;150 400;0 150];
            app.YukseklikGauge.BackgroundColor = [0.149 0.149 0.149];
            app.YukseklikGauge.FontColor = [1 1 1];
            app.YukseklikGauge.Position = [1200 22 61 458];

            % Create btnVideoGonder
            app.btnVideoGonder = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.btnVideoGonder.ButtonPushedFcn = createCallbackFcn(app, @btnVideoGonderButtonPushed, true);
            app.btnVideoGonder.Icon = 'Gonderim.png';
            app.btnVideoGonder.BackgroundColor = [0.1216 0.1176 0.1176];
            app.btnVideoGonder.Position = [282 20 63 458];
            app.btnVideoGonder.Text = '';

            % Create btnCalibration
            app.btnCalibration = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.btnCalibration.ButtonPushedFcn = createCallbackFcn(app, @btnCalibrationPushed, true);
            app.btnCalibration.Icon = 'VQ9FES.png';
            app.btnCalibration.BackgroundColor = [0.1608 0.1529 0.1529];
            app.btnCalibration.Position = [570 707 77 72];
            app.btnCalibration.Text = '';

            % Create btnSaveTelemtry
            app.btnSaveTelemtry = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.btnSaveTelemtry.ButtonPushedFcn = createCallbackFcn(app, @btnSaveTelemtryButtonPushed, true);
            app.btnSaveTelemtry.Icon = 'NPAdAW.png';
            app.btnSaveTelemtry.BackgroundColor = [0.1608 0.1529 0.1529];
            app.btnSaveTelemtry.Position = [897 707 77 72];
            app.btnSaveTelemtry.Text = '';

            % Create Panel
            app.Panel = uipanel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Panel.Visible = 'off';
            app.Panel.BackgroundColor = [0.502 0.502 0.502];
            app.Panel.Position = [362 214 821 445];

            % Create VoltajAxes
            app.VoltajAxes = uiaxes(app.Panel);
            title(app.VoltajAxes, 'VOLTAJ (V)')
            xlabel(app.VoltajAxes, '')
            ylabel(app.VoltajAxes, '')
            app.VoltajAxes.PlotBoxAspectRatio = [2.37158469945355 1 1];
            app.VoltajAxes.Color = [0.149 0.149 0.149];
            app.VoltajAxes.BackgroundColor = [0.502 0.502 0.502];
            app.VoltajAxes.Position = [1 239 397 205];

            % Create GpsAxes
            app.GpsAxes = uiaxes(app.Panel);
            title(app.GpsAxes, '3D GPS')
            xlabel(app.GpsAxes, 'Longitude')
            ylabel(app.GpsAxes, 'Lattitude')
            app.GpsAxes.FontSize = 14;
            app.GpsAxes.ZLim = [0 600];
            app.GpsAxes.GridColor = [0.9412 0.9412 0.9412];
            app.GpsAxes.XColor = [0.149 0.149 0.149];
            app.GpsAxes.Color = [0.149 0.149 0.149];
            app.GpsAxes.XGrid = 'on';
            app.GpsAxes.YGrid = 'on';
            app.GpsAxes.ZGrid = 'on';
            app.GpsAxes.View = [45 30];
            app.GpsAxes.BackgroundColor = [0.502 0.502 0.502];
            app.GpsAxes.Position = [415 5 397 231];

            % Create SicaklikAxes
            app.SicaklikAxes = uiaxes(app.Panel);
            title(app.SicaklikAxes, 'SICAKLIK(° C)')
            xlabel(app.SicaklikAxes, '')
            ylabel(app.SicaklikAxes, '')
            app.SicaklikAxes.PlotBoxAspectRatio = [2.37158469945355 1 1];
            app.SicaklikAxes.Color = [0.149 0.149 0.149];
            app.SicaklikAxes.BackgroundColor = [0.502 0.502 0.502];
            app.SicaklikAxes.Position = [415 237 397 205];

            % Create BasincAxes
            app.BasincAxes = uiaxes(app.Panel);
            title(app.BasincAxes, 'BASINÇ(Pa)')
            xlabel(app.BasincAxes, '')
            ylabel(app.BasincAxes, '')
            app.BasincAxes.PlotBoxAspectRatio = [2.37158469945355 1 1];
            app.BasincAxes.Color = [0.149 0.149 0.149];
            app.BasincAxes.BackgroundColor = [0.502 0.502 0.502];
            app.BasincAxes.Position = [1 25 397 205];

            % Create TakmNoEditField_4Label_18
            app.TakmNoEditField_4Label_18 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_18.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_18.FontSize = 14;
            app.TakmNoEditField_4Label_18.FontWeight = 'bold';
            app.TakmNoEditField_4Label_18.FontAngle = 'italic';
            app.TakmNoEditField_4Label_18.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_18.Position = [82 504 72 22];
            app.TakmNoEditField_4Label_18.Text = 'Takım No:';

            % Create TakmNoEditField_4Label_19
            app.TakmNoEditField_4Label_19 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_19.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_19.FontSize = 14;
            app.TakmNoEditField_4Label_19.FontWeight = 'bold';
            app.TakmNoEditField_4Label_19.FontAngle = 'italic';
            app.TakmNoEditField_4Label_19.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_19.Position = [32 478 122 22];
            app.TakmNoEditField_4Label_19.Text = 'Paket Numarası:';

            % Create TakmNoEditField_4Label_20
            app.TakmNoEditField_4Label_20 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_20.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_20.FontSize = 14;
            app.TakmNoEditField_4Label_20.FontWeight = 'bold';
            app.TakmNoEditField_4Label_20.FontAngle = 'italic';
            app.TakmNoEditField_4Label_20.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_20.Position = [37 448 117 22];
            app.TakmNoEditField_4Label_20.Text = 'Gönderme Saati:';

            % Create TakmNoEditField_4Label_21
            app.TakmNoEditField_4Label_21 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_21.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_21.FontSize = 14;
            app.TakmNoEditField_4Label_21.FontWeight = 'bold';
            app.TakmNoEditField_4Label_21.FontAngle = 'italic';
            app.TakmNoEditField_4Label_21.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_21.Position = [98 422 56 22];
            app.TakmNoEditField_4Label_21.Text = 'Basınç:';

            % Create TakmNoEditField_4Label_22
            app.TakmNoEditField_4Label_22 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_22.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_22.FontSize = 14;
            app.TakmNoEditField_4Label_22.FontWeight = 'bold';
            app.TakmNoEditField_4Label_22.FontAngle = 'italic';
            app.TakmNoEditField_4Label_22.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_22.Position = [79 394 75 22];
            app.TakmNoEditField_4Label_22.Text = 'Yükseklik:';

            % Create TakmNoEditField_4Label_23
            app.TakmNoEditField_4Label_23 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_23.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_23.FontSize = 14;
            app.TakmNoEditField_4Label_23.FontWeight = 'bold';
            app.TakmNoEditField_4Label_23.FontAngle = 'italic';
            app.TakmNoEditField_4Label_23.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_23.Position = [91 366 63 22];
            app.TakmNoEditField_4Label_23.Text = 'İniş Hızı:';

            % Create TakmNoEditField_4Label_24
            app.TakmNoEditField_4Label_24 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_24.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_24.FontSize = 14;
            app.TakmNoEditField_4Label_24.FontWeight = 'bold';
            app.TakmNoEditField_4Label_24.FontAngle = 'italic';
            app.TakmNoEditField_4Label_24.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_24.Position = [92 338 62 22];
            app.TakmNoEditField_4Label_24.Text = 'Sıcaklık:';

            % Create TakmNoEditField_4Label_25
            app.TakmNoEditField_4Label_25 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_25.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_25.FontSize = 14;
            app.TakmNoEditField_4Label_25.FontWeight = 'bold';
            app.TakmNoEditField_4Label_25.FontAngle = 'italic';
            app.TakmNoEditField_4Label_25.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_25.Position = [71 310 83 22];
            app.TakmNoEditField_4Label_25.Text = 'Pil Gerilimi:';

            % Create TakmNoEditField_4Label_26
            app.TakmNoEditField_4Label_26 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_26.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_26.FontSize = 14;
            app.TakmNoEditField_4Label_26.FontWeight = 'bold';
            app.TakmNoEditField_4Label_26.FontAngle = 'italic';
            app.TakmNoEditField_4Label_26.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_26.Position = [56 282 98 22];
            app.TakmNoEditField_4Label_26.Text = 'GPS Latitude:';

            % Create TakmNoEditField_4Label_27
            app.TakmNoEditField_4Label_27 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_27.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_27.FontSize = 14;
            app.TakmNoEditField_4Label_27.FontWeight = 'bold';
            app.TakmNoEditField_4Label_27.FontAngle = 'italic';
            app.TakmNoEditField_4Label_27.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_27.Position = [43 254 111 22];
            app.TakmNoEditField_4Label_27.Text = 'GPS Longitude:';

            % Create TakmNoEditField_4Label_28
            app.TakmNoEditField_4Label_28 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_28.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_28.FontSize = 14;
            app.TakmNoEditField_4Label_28.FontWeight = 'bold';
            app.TakmNoEditField_4Label_28.FontAngle = 'italic';
            app.TakmNoEditField_4Label_28.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_28.Position = [59 226 95 22];
            app.TakmNoEditField_4Label_28.Text = 'GPS Altitude:';

            % Create TakmNoEditField_4Label_29
            app.TakmNoEditField_4Label_29 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_29.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_29.FontSize = 14;
            app.TakmNoEditField_4Label_29.FontWeight = 'bold';
            app.TakmNoEditField_4Label_29.FontAngle = 'italic';
            app.TakmNoEditField_4Label_29.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_29.Position = [54 199 100 22];
            app.TakmNoEditField_4Label_29.Text = 'Uydu Statüsü:';

            % Create TakmNoEditField_4Label_30
            app.TakmNoEditField_4Label_30 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_30.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_30.FontSize = 14;
            app.TakmNoEditField_4Label_30.FontWeight = 'bold';
            app.TakmNoEditField_4Label_30.FontAngle = 'italic';
            app.TakmNoEditField_4Label_30.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_30.Position = [94 171 60 22];
            app.TakmNoEditField_4Label_30.Text = 'Pitch:';

            % Create TakmNoEditField_4Label_31
            app.TakmNoEditField_4Label_31 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_31.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_31.FontSize = 14;
            app.TakmNoEditField_4Label_31.FontWeight = 'bold';
            app.TakmNoEditField_4Label_31.FontAngle = 'italic';
            app.TakmNoEditField_4Label_31.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_31.Position = [94 143 60 22];
            app.TakmNoEditField_4Label_31.Text = 'Roll:';

            % Create TakmNoEditField_4Label_32
            app.TakmNoEditField_4Label_32 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_32.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_32.FontSize = 14;
            app.TakmNoEditField_4Label_32.FontWeight = 'bold';
            app.TakmNoEditField_4Label_32.FontAngle = 'italic';
            app.TakmNoEditField_4Label_32.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_32.Position = [94 115 60 22];
            app.TakmNoEditField_4Label_32.Text = 'Yaw:';

            % Create TakmNoEditField_4Label_33
            app.TakmNoEditField_4Label_33 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_33.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_33.FontSize = 14;
            app.TakmNoEditField_4Label_33.FontWeight = 'bold';
            app.TakmNoEditField_4Label_33.FontAngle = 'italic';
            app.TakmNoEditField_4Label_33.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_33.Position = [56 87 98 22];
            app.TakmNoEditField_4Label_33.Text = 'Dönüş Sayısı:';

            % Create TakmNoEditField_4Label_34
            app.TakmNoEditField_4Label_34 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_34.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_34.FontSize = 14;
            app.TakmNoEditField_4Label_34.FontWeight = 'bold';
            app.TakmNoEditField_4Label_34.FontAngle = 'italic';
            app.TakmNoEditField_4Label_34.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_34.Position = [37 50 117 34];
            app.TakmNoEditField_4Label_34.Text = 'Video Aktarım:';

            % Create GonderimSaatiEditField
            app.GonderimSaatiEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'text');
            app.GonderimSaatiEditField.Editable = 'off';
            app.GonderimSaatiEditField.HorizontalAlignment = 'right';
            app.GonderimSaatiEditField.FontSize = 15;
            app.GonderimSaatiEditField.FontWeight = 'bold';
            app.GonderimSaatiEditField.BackgroundColor = [0.902 0.902 0.902];
            app.GonderimSaatiEditField.Position = [162 448.39999961853 100 22.6000003814697];

            % Create ComportLabel
            app.ComportLabel = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.ComportLabel.HorizontalAlignment = 'right';
            app.ComportLabel.FontSize = 15;
            app.ComportLabel.FontWeight = 'bold';
            app.ComportLabel.FontColor = [1 1 1];
            app.ComportLabel.Position = [1282 503 78 35];
            app.ComportLabel.Text = {'Comport :'; ''};

            % Create ComportDropDown
            app.ComportDropDown = uidropdown(app.GAZMODELUYDUTAKIMIUIFigure);
            app.ComportDropDown.Items = {'COM3', 'COM4', 'COM5', 'COM6'};
            app.ComportDropDown.FontSize = 15;
            app.ComportDropDown.BackgroundColor = [0.8 0.8 0.8];
            app.ComportDropDown.Position = [1368 504 147 35];
            app.ComportDropDown.Value = 'COM3';

            % Create BaudrateDropDownLabel
            app.BaudrateDropDownLabel = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.BaudrateDropDownLabel.HorizontalAlignment = 'right';
            app.BaudrateDropDownLabel.FontSize = 15;
            app.BaudrateDropDownLabel.FontWeight = 'bold';
            app.BaudrateDropDownLabel.FontColor = [1 1 1];
            app.BaudrateDropDownLabel.Position = [1277 456 80 37];
            app.BaudrateDropDownLabel.Text = {'Baudrate :'; ''};

            % Create BaudrateDropDown
            app.BaudrateDropDown = uidropdown(app.GAZMODELUYDUTAKIMIUIFigure);
            app.BaudrateDropDown.Items = {'9600', '115200', '230400', '500000'};
            app.BaudrateDropDown.FontSize = 15;
            app.BaudrateDropDown.BackgroundColor = [0.8 0.8 0.8];
            app.BaudrateDropDown.Position = [1368 458 147 35];
            app.BaudrateDropDown.Value = '115200';

            % Create btnDisconnect
            app.btnDisconnect = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.btnDisconnect.ButtonPushedFcn = createCallbackFcn(app, @btnDisconnectPushed, true);
            app.btnDisconnect.Icon = 'Disconnect.png';
            app.btnDisconnect.IconAlignment = 'center';
            app.btnDisconnect.BackgroundColor = [0.9412 0.9412 0.9412];
            app.btnDisconnect.Enable = 'off';
            app.btnDisconnect.Position = [1403 420 112 31];
            app.btnDisconnect.Text = {''; ''};

            % Create btnConnect
            app.btnConnect = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.btnConnect.ButtonPushedFcn = createCallbackFcn(app, @btnConnectPushed, true);
            app.btnConnect.Icon = 'Connect.png';
            app.btnConnect.IconAlignment = 'center';
            app.btnConnect.BackgroundColor = [0.902 0.902 0.902];
            app.btnConnect.Position = [1282 420 112 31];
            app.btnConnect.Text = '';

            % Create Label
            app.Label = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Label.FontColor = [1 1 1];
            app.Label.Position = [1350 281 25 22];
            app.Label.Text = '';

            % Create TakmNoEditField_4Label_35
            app.TakmNoEditField_4Label_35 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_35.FontSize = 14;
            app.TakmNoEditField_4Label_35.FontWeight = 'bold';
            app.TakmNoEditField_4Label_35.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_35.Position = [1306 171 63 22];
            app.TakmNoEditField_4Label_35.Text = 'Bekleme';

            % Create TakmNoEditField_4Label_36
            app.TakmNoEditField_4Label_36 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_36.FontSize = 14;
            app.TakmNoEditField_4Label_36.FontWeight = 'bold';
            app.TakmNoEditField_4Label_36.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_36.Position = [1306 144 71 22];
            app.TakmNoEditField_4Label_36.Text = 'Yükselme';

            % Create TakmNoEditField_4Label_37
            app.TakmNoEditField_4Label_37 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_37.FontSize = 14;
            app.TakmNoEditField_4Label_37.FontWeight = 'bold';
            app.TakmNoEditField_4Label_37.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_37.Position = [1306 115 68 22];
            app.TakmNoEditField_4Label_37.Text = 'Apoapsis';

            % Create TakmNoEditField_4Label_38
            app.TakmNoEditField_4Label_38 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_38.FontSize = 14;
            app.TakmNoEditField_4Label_38.FontWeight = 'bold';
            app.TakmNoEditField_4Label_38.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_38.Position = [1306 86 113 22];
            app.TakmNoEditField_4Label_38.Text = 'Model Uydu İniş';

            % Create TakmNoEditField_4Label_39
            app.TakmNoEditField_4Label_39 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_39.FontSize = 14;
            app.TakmNoEditField_4Label_39.FontWeight = 'bold';
            app.TakmNoEditField_4Label_39.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_39.Position = [1306 59 180 22];
            app.TakmNoEditField_4Label_39.Text = 'Ayrılma & Görev Yükü İniş';

            % Create TakmNoEditField_4Label_40
            app.TakmNoEditField_4Label_40 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_40.HorizontalAlignment = 'right';
            app.TakmNoEditField_4Label_40.FontSize = 14;
            app.TakmNoEditField_4Label_40.FontWeight = 'bold';
            app.TakmNoEditField_4Label_40.FontAngle = 'italic';
            app.TakmNoEditField_4Label_40.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_40.Position = [1390 114 25 22];
            app.TakmNoEditField_4Label_40.Text = '';

            % Create TakmNoEditField_4Label_41
            app.TakmNoEditField_4Label_41 = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.TakmNoEditField_4Label_41.FontSize = 14;
            app.TakmNoEditField_4Label_41.FontWeight = 'bold';
            app.TakmNoEditField_4Label_41.FontColor = [1 1 1];
            app.TakmNoEditField_4Label_41.Position = [1306 30 67 22];
            app.TakmNoEditField_4Label_41.Text = 'Kurtarma';

            % Create Lamp_3
            app.Lamp_3 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_3.Position = [1280 173 20 20];
            app.Lamp_3.Color = [0.6392 0.0784 0.1804];

            % Create Lamp_4
            app.Lamp_4 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_4.Position = [1280 145 20 20];
            app.Lamp_4.Color = [0.6392 0.0784 0.1804];

            % Create Lamp_5
            app.Lamp_5 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_5.Position = [1280 116 20 20];
            app.Lamp_5.Color = [0.6392 0.0784 0.1804];

            % Create Lamp_6
            app.Lamp_6 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_6.Position = [1280 88 20 20];
            app.Lamp_6.Color = [0.6392 0.0784 0.1804];

            % Create Lamp_7
            app.Lamp_7 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_7.Position = [1280 59 20 20];
            app.Lamp_7.Color = [0.6392 0.0784 0.1804];

            % Create Lamp_8
            app.Lamp_8 = uilamp(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Lamp_8.Position = [1280 31 20 20];
            app.Lamp_8.Color = [0.6392 0.0784 0.1804];

            % Create btnFligth
            app.btnFligth = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'state');
            app.btnFligth.ValueChangedFcn = createCallbackFcn(app, @btnFligthValueChanged, true);
            app.btnFligth.Icon = 'wUUtAo.png';
            app.btnFligth.Text = '';
            app.btnFligth.BackgroundColor = [0.149 0.149 0.149];
            app.btnFligth.Position = [722 685 100 93];

            % Create BtnGps
            app.BtnGps = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.BtnGps.Icon = 'Gps2.png';
            app.BtnGps.BackgroundColor = [0.149 0.149 0.149];
            app.BtnGps.FontSize = 18;
            app.BtnGps.FontWeight = 'bold';
            app.BtnGps.FontColor = [1 1 1];
            app.BtnGps.Position = [1277 246 246 58];
            app.BtnGps.Text = '';

            % Create BtnSeperation
            app.BtnSeperation = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.BtnSeperation.ButtonPushedFcn = createCallbackFcn(app, @BtnSeperationPushed, true);
            app.BtnSeperation.Icon = 'Ayrılma2.png';
            app.BtnSeperation.BackgroundColor = [0 0 0];
            app.BtnSeperation.FontSize = 15;
            app.BtnSeperation.FontWeight = 'bold';
            app.BtnSeperation.FontColor = [1 1 1];
            app.BtnSeperation.Position = [1277 302 246 58];
            app.BtnSeperation.Text = '';

            % Create PortEditFieldLabel
            app.PortEditFieldLabel = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.PortEditFieldLabel.HorizontalAlignment = 'right';
            app.PortEditFieldLabel.FontSize = 20;
            app.PortEditFieldLabel.FontWeight = 'bold';
            app.PortEditFieldLabel.FontColor = [1 1 1];
            app.PortEditFieldLabel.Position = [659 -181 52 24];
            app.PortEditFieldLabel.Text = 'Port:';

            % Create PortEditField
            app.PortEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'text');
            app.PortEditField.FontSize = 15;
            app.PortEditField.FontColor = [0.9412 0.9412 0.9412];
            app.PortEditField.BackgroundColor = [0.3412 0.3098 0.3098];
            app.PortEditField.Position = [724 -179 174 22.2800006866455];
            app.PortEditField.Value = '52714';

            % Create IPEditFieldLabel
            app.IPEditFieldLabel = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.IPEditFieldLabel.HorizontalAlignment = 'right';
            app.IPEditFieldLabel.FontSize = 20;
            app.IPEditFieldLabel.FontWeight = 'bold';
            app.IPEditFieldLabel.FontColor = [1 1 1];
            app.IPEditFieldLabel.Position = [680 -146 31 24];
            app.IPEditFieldLabel.Text = 'IP:';

            % Create IPEditField
            app.IPEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'text');
            app.IPEditField.FontSize = 15;
            app.IPEditField.FontColor = [0.9412 0.9412 0.9412];
            app.IPEditField.BackgroundColor = [0.3412 0.3098 0.3098];
            app.IPEditField.Position = [724 -144 174 22.2800006866455];
            app.IPEditField.Value = '192.168.4.1';

            % Create UserShowlbl
            app.UserShowlbl = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.UserShowlbl.FontSize = 15;
            app.UserShowlbl.FontColor = [1 0 0];
            app.UserShowlbl.Position = [348 22 217 35];
            app.UserShowlbl.Text = '';

            % Create TakimNoEditField
            app.TakimNoEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.TakimNoEditField.ValueDisplayFormat = '%5.0f';
            app.TakimNoEditField.Editable = 'off';
            app.TakimNoEditField.FontSize = 15;
            app.TakimNoEditField.FontWeight = 'bold';
            app.TakimNoEditField.BackgroundColor = [0.902 0.902 0.902];
            app.TakimNoEditField.Position = [162 504 100 22];

            % Create PaketNoEditField
            app.PaketNoEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.PaketNoEditField.Editable = 'off';
            app.PaketNoEditField.FontSize = 15;
            app.PaketNoEditField.FontWeight = 'bold';
            app.PaketNoEditField.BackgroundColor = [0.902 0.902 0.902];
            app.PaketNoEditField.Position = [162 477 100 22];

            % Create BasincEditField
            app.BasincEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.BasincEditField.ValueDisplayFormat = '%.2f';
            app.BasincEditField.Editable = 'off';
            app.BasincEditField.FontSize = 15;
            app.BasincEditField.FontWeight = 'bold';
            app.BasincEditField.BackgroundColor = [0.902 0.902 0.902];
            app.BasincEditField.Position = [162 422 100 22];

            % Create YukseklikEditField
            app.YukseklikEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.YukseklikEditField.Editable = 'off';
            app.YukseklikEditField.FontSize = 15;
            app.YukseklikEditField.FontWeight = 'bold';
            app.YukseklikEditField.BackgroundColor = [0.902 0.902 0.902];
            app.YukseklikEditField.Position = [162 394 100 22];

            % Create InisHiziEditField
            app.InisHiziEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.InisHiziEditField.Editable = 'off';
            app.InisHiziEditField.FontSize = 15;
            app.InisHiziEditField.FontWeight = 'bold';
            app.InisHiziEditField.BackgroundColor = [0.902 0.902 0.902];
            app.InisHiziEditField.Position = [162 366 100 22];

            % Create SicaklikEditField
            app.SicaklikEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.SicaklikEditField.Editable = 'off';
            app.SicaklikEditField.FontSize = 15;
            app.SicaklikEditField.FontWeight = 'bold';
            app.SicaklikEditField.BackgroundColor = [0.902 0.902 0.902];
            app.SicaklikEditField.Position = [162 338 100 22];

            % Create PilGerilimiEditField
            app.PilGerilimiEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.PilGerilimiEditField.Editable = 'off';
            app.PilGerilimiEditField.FontSize = 15;
            app.PilGerilimiEditField.FontWeight = 'bold';
            app.PilGerilimiEditField.BackgroundColor = [0.902 0.902 0.902];
            app.PilGerilimiEditField.Position = [162 310 100 22];

            % Create GpsLatEditField
            app.GpsLatEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.GpsLatEditField.Editable = 'off';
            app.GpsLatEditField.FontSize = 15;
            app.GpsLatEditField.FontWeight = 'bold';
            app.GpsLatEditField.BackgroundColor = [0.902 0.902 0.902];
            app.GpsLatEditField.Position = [162 282 100 22];

            % Create GpsLonEditField
            app.GpsLonEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.GpsLonEditField.Editable = 'off';
            app.GpsLonEditField.FontSize = 15;
            app.GpsLonEditField.FontWeight = 'bold';
            app.GpsLonEditField.BackgroundColor = [0.902 0.902 0.902];
            app.GpsLonEditField.Position = [162 254 100 22];

            % Create GpsAltEditField
            app.GpsAltEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.GpsAltEditField.Editable = 'off';
            app.GpsAltEditField.FontSize = 15;
            app.GpsAltEditField.FontWeight = 'bold';
            app.GpsAltEditField.BackgroundColor = [0.902 0.902 0.902];
            app.GpsAltEditField.Position = [162 226 100 22];

            % Create UyduStatusEditField
            app.UyduStatusEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.UyduStatusEditField.Editable = 'off';
            app.UyduStatusEditField.FontSize = 15;
            app.UyduStatusEditField.FontWeight = 'bold';
            app.UyduStatusEditField.BackgroundColor = [0.902 0.902 0.902];
            app.UyduStatusEditField.Position = [162 199 100 22];

            % Create PitchEditField
            app.PitchEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.PitchEditField.Editable = 'off';
            app.PitchEditField.FontSize = 15;
            app.PitchEditField.FontWeight = 'bold';
            app.PitchEditField.BackgroundColor = [0.902 0.902 0.902];
            app.PitchEditField.Position = [162 171 100 22];

            % Create RollEditField
            app.RollEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.RollEditField.Editable = 'off';
            app.RollEditField.FontSize = 15;
            app.RollEditField.FontWeight = 'bold';
            app.RollEditField.BackgroundColor = [0.902 0.902 0.902];
            app.RollEditField.Position = [162 143 100 22];

            % Create YawEditField
            app.YawEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.YawEditField.Editable = 'off';
            app.YawEditField.FontSize = 15;
            app.YawEditField.FontWeight = 'bold';
            app.YawEditField.BackgroundColor = [0.902 0.902 0.902];
            app.YawEditField.Position = [162 115 100 22];

            % Create DonusSayisiEditField
            app.DonusSayisiEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.DonusSayisiEditField.Editable = 'off';
            app.DonusSayisiEditField.FontSize = 15;
            app.DonusSayisiEditField.FontWeight = 'bold';
            app.DonusSayisiEditField.BackgroundColor = [0.902 0.902 0.902];
            app.DonusSayisiEditField.Position = [162 87 100 22];

            % Create VideoAktarimEditField
            app.VideoAktarimEditField = uieditfield(app.GAZMODELUYDUTAKIMIUIFigure, 'numeric');
            app.VideoAktarimEditField.Editable = 'off';
            app.VideoAktarimEditField.FontSize = 15;
            app.VideoAktarimEditField.FontWeight = 'bold';
            app.VideoAktarimEditField.BackgroundColor = [0.902 0.902 0.902];
            app.VideoAktarimEditField.Position = [162 56 100 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.GAZMODELUYDUTAKIMIUIFigure);
            title(app.UIAxes, '')
            xlabel(app.UIAxes, '')
            ylabel(app.UIAxes, '')
            app.UIAxes.ALim = [0.1 1];
            app.UIAxes.Box = 'on';
            app.UIAxes.BoxStyle = 'full';
            app.UIAxes.AlphaScale = 'log';
            app.UIAxes.View = [-108.4345703125 87.21484375];
            app.UIAxes.CameraPosition = [0.2 0.6 7];
            app.UIAxes.CameraViewAngle = 6.60861036031192;
            app.UIAxes.BackgroundColor = [0.149 0.149 0.149];
            app.UIAxes.Position = [16 552 310 233];

            % Create BtnImpellent
            app.BtnImpellent = uibutton(app.GAZMODELUYDUTAKIMIUIFigure, 'push');
            app.BtnImpellent.ButtonPushedFcn = createCallbackFcn(app, @BtnImpellentPushed, true);
            app.BtnImpellent.Icon = 'Tahrik2.png';
            app.BtnImpellent.BackgroundColor = [0 0 0];
            app.BtnImpellent.FontSize = 15;
            app.BtnImpellent.FontWeight = 'bold';
            app.BtnImpellent.FontColor = [1 1 1];
            app.BtnImpellent.Position = [1275 357 246 58];
            app.BtnImpellent.Text = '';

            % Create ImageCamera
            app.ImageCamera = uiimage(app.GAZMODELUYDUTAKIMIUIFigure);
            app.ImageCamera.Position = [16 552 310 233];
            app.ImageCamera.ImageSource = 'Kamera.png';

            % Create Image3D
            app.Image3D = uiimage(app.GAZMODELUYDUTAKIMIUIFigure);
            app.Image3D.Position = [1213 552 310 233];
            app.Image3D.ImageSource = '3D3.png';

            % Create CameraDropDownLabel
            app.CameraDropDownLabel = uilabel(app.GAZMODELUYDUTAKIMIUIFigure);
            app.CameraDropDownLabel.FontSize = 15;
            app.CameraDropDownLabel.FontWeight = 'bold';
            app.CameraDropDownLabel.FontColor = [0.6353 0.0784 0.1843];
            app.CameraDropDownLabel.Position = [654 -82 69 22];
            app.CameraDropDownLabel.Text = 'Camera:';

            % Create CameraDropDown
            app.CameraDropDown = uidropdown(app.GAZMODELUYDUTAKIMIUIFigure);
            app.CameraDropDown.Items = {};
            app.CameraDropDown.FontSize = 15;
            app.CameraDropDown.FontWeight = 'bold';
            app.CameraDropDown.Position = [722 -82 183 22];
            app.CameraDropDown.Value = {};

            % Show the figure after all components are created
            app.GAZMODELUYDUTAKIMIUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GaziGroundStation

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.GAZMODELUYDUTAKIMIUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.GAZMODELUYDUTAKIMIUIFigure)
        end
    end
end