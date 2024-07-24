% Specify the folder where the CSV files are located
folder = 'M:\IMU\matlab\feat'; % Replace 'your_folder_path_here' with the actual folder path

% Find all CSV files with 'scenario1' in the file name
filePattern1 = fullfile(folder, '*activity1*.csv');
csvFiles = dir(filePattern1);
 
 % Check if any CSV files were found
 if isempty(csvFiles)
     disp('No CSV files with "activity1" in the file name were found.');
 else
     % Create an empty cell array to store the data
     data = cell(length(csvFiles), 1);
 
     % Loop through the CSV files and read their data
     for i = 1:length(csvFiles)
         currentFile = fullfile(folder, csvFiles(i).name);
         data{i} = readtable(currentFile); 
 
     end
 
     % Combine all data into one matrix
     combinedData = vertcat(data{:});
 
     % Write the combined data to a new CSV file
     combinedFileName = 'combined_activity1_data.csv';
     combinedFilePath = fullfile(folder, combinedFileName);
     writetable(combinedData, combinedFilePath); 
 
     disp(['Combined data has been saved to: ' combinedFilePath]);
 end

%% Find all CSV files with 'scenario2' in the file name
filePattern2 = fullfile(folder, '*activity2*.csv');
csvFiles = dir(filePattern2);

% Check if any CSV files were found
if isempty(csvFiles)
    disp('No CSV files with "activity2" in the file name were found.');
else
    % Create an empty cell array to store the data
    data = cell(length(csvFiles), 1);

    % Loop through the CSV files and read their data
    for i = 1:length(csvFiles)
        currentFile = fullfile(folder, csvFiles(i).name);
        data{i} = readtable(currentFile); 
    
    end

    % Combine all data into one matrix
    combinedData = vertcat(data{:});

    % Write the combined data to a new CSV file
    combinedFileName = 'combined_activity2_data.csv';
    combinedFilePath = fullfile(folder, combinedFileName);
    writetable(combinedData, combinedFilePath); 
  
    disp(['Combined data has been saved to: ' combinedFilePath]);
end

%% Find all CSV files with 'scenario3' in the file name
filePattern3 = fullfile(folder, '*activity3*.csv');
csvFiles = dir(filePattern3);

% Check if any CSV files were found
if isempty(csvFiles)
    disp('No CSV files with "activity3" in the file name were found.');
else
    % Create an empty cell array to store the data
    data = cell(length(csvFiles), 1);

    % Loop through the CSV files and read their data
    for i = 1:length(csvFiles)
        currentFile = fullfile(folder, csvFiles(i).name);
        data{i} = readtable(currentFile); 
    
    end

    % Combine all data into one matrix
    combinedData = vertcat(data{:});

    % Write the combined data to a new CSV file
    combinedFileName = 'combined_activity3_data.csv';
    combinedFilePath = fullfile(folder, combinedFileName);
    writetable(combinedData, combinedFilePath); 
  
    disp(['Combined data has been saved to: ' combinedFilePath]);
end