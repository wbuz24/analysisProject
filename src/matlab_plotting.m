%% Info:

% Here’s a quick explanation of the columns based on the common BLE header format:

% t_a: Timestamp (the time at which the message was received).
% LLID1 and LLID0: These represent the Link Layer Identifier (LLID) field, which is part of the header and is used to identify the type of message or frame in BLE communication.
% NESN: Sequence number of the packet for the receiver.
% SN: Sequence number for the sender (used in tracking packets).
% MD: Message Type (the type of BLE frame).
% CP: Control packet indicator.
% RFU1, RFU0: Reserved For Future Use fields (generally set to 0).
% Length: The length of the data in the frame.

%% Clear workspace
clc; clear; close all;

%% Load the metadata

% Define the folder path for the dataset
hackrf_dataset_folder = '../../InSecTT_BLE_Channel_Sniff_Dataset/dataset_hackrf/set_1';
ubertooth_dataset_folder = '../../InSecTT_BLE_Channel_Sniff_Dataset/dataset_ubertooth/set_1';

% Load the metadata from the JSON file
metadata_file_hackrf = fullfile(hackrf_dataset_folder, 'metadata.json');
metadata_file_ubertooth = fullfile(ubertooth_dataset_folder, 'metadata.json');
hackrf = jsondecode(fileread(metadata_file_hackrf));
uber = jsondecode(fileread(metadata_file_ubertooth));

%% Load the data

% Initialize an empty cell array to store data from CSV files
uber_data = {};
hackrf_data = {};

% Loop through the Access Addresses in the metadata and load the CSV files
for i = 1:length(hackrf.AA)
    aa_hackrf = hackrf.AA{i};  % Access Address (AA) as a string
    csv_file_hackrf = fullfile(hackrf_dataset_folder, sprintf('%s.csv', aa_hackrf));
    
    % Load the CSV file into a table
    tbl_hackrf = readtable(csv_file_hackrf);
end

% Loop through the Access Addresses in the metadata and load the CSV files
for i = 1:length(uber.AA)
    aa_ubertooth = uber.AA{i};  % Access Address (AA) as a string
    csv_file_ubertooth = fullfile(ubertooth_dataset_folder, sprintf('%s.csv', aa_ubertooth));
    
    % Load the CSV file into a table
    tbl_ubertooth = readtable(csv_file_ubertooth);
end

%% Length of Data over Time

figure;
hold on; 

% Plot Length over Time for Ubertooth
%plot(tbl_ubertooth.t_a, tbl_ubertooth.Length, 'Color', 'b', 'DisplayName', 'ubertooth');

% Plot Length over Time for HackRF
plot(tbl_hackrf.t_a, tbl_hackrf.Length, 'Color', 'r', 'DisplayName', 'hackrf');

% Add labels and title and stuff lol
xlabel('Time');
ylabel('Length');
title('Packet Length vs Time');
legend('show');
grid on;
hold off;

%% Plot Sequence Numbers over Time

% figure;
% hold on;
% plot(tbl_hackrf.t_a, tbl_hackrf.SN, Marker='.', DisplayName='SN');
% plot(tbl_hackrf.t_a, tbl_hackrf.NESN, Marker='.', DisplayName='NESN');
% xlabel('Times');
% ylabel('Sequence Number');
% title('Sequence Number vs Time');
% legend('show')
% grid on;

%% Plot LLID1 and LLID0 over time for Ubertooth to visualize the hopping pattern
figure;
hold on;
plot(tbl_hackrf.t_a, tbl_hackrf.LLID1,'DisplayName', 'LLID1', LineWidth=0.5, Color='r');
plot(tbl_hackrf.t_a, tbl_hackrf.LLID0, 'DisplayName', 'LLID0', LineWidth=0.5, Color='b');
both0 = tbl_hackrf.LLID1 == 0 & tbl_hackrf.LLID0 == 0;
both1 = tbl_hackrf.LLID1 == 1 & tbl_hackrf.LLID0 == 1;
scatter(tbl_hackrf.t_a, both0, 'DisplayName', 'both off', LineWidth=0.1, Marker='.', Color='y');
scatter(tbl_hackrf.t_a, both1, 'DisplayName', 'both on', LineWidth=0.1, Marker='.', Color='p');
xlabel('Timestamp');
ylabel('LLID');
title('LLID1 and LLID0 Over Time');
legend('show');
grid on;
hold off;


%% Calculate gaps in sequence numbers (SN - NESN) for Ubertooth
% seq_gaps = diff(tbl_hackrf.SN);
% 
% % Plot sequence number gaps
% figure;
% plot(tbl_hackrf.t_a(2:end), seq_gaps);
% xlabel('Timestamp');
% ylabel('Sequence Number Gap');
% title('Sequence Number Gaps');
% grid on;

