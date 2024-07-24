
%% process all data

% Specify the directory path where you want to extract subfolder names.
% NOTE a small adjustment to the testpåerson varaible is needed if the TP
% is a double digit number eg testperson = foldername(1:4) not testperson = foldername(1:3)
baseDir = 'M:\IMU\matlab\exported_txt\TP1';

% Use the dir function to list the contents of the directory
items = dir(baseDir);

% Loop through the items in the directory
for i = 1:numel(items)
    item = items(i);
    % Check if the item is a directory and its name contains 'scenario1'
    if item.isdir && contains(item.name, 'activity1')
        % Construct the full path to the folder
        folderPath = fullfile(baseDir, item.name);
        foldername = item.name;
        scenario = foldername(end-13:end-5);
        activity = foldername(end-3:end);
        testperson = foldername(1:3)
         % Call the function for scenario1 on the folder
         SCENARIO1_FEAT(folderPath,foldername, scenario, activity, testperson);
    elseif item.isdir && contains(item.name, 'activity2')
        % Construct the full path to the folder
        folderPath = fullfile(baseDir, item.name);
        foldername = item.name;
        scenario = foldername(end-13:end-5);
        activity = foldername(end-3:end);
        testperson = foldername(1:3)
        % Call the function for scenario2 on the folder
        SCENARIO2_FEAT(folderPath,foldername, scenario, activity, testperson);
    elseif item.isdir && contains(item.name, 'activity3')
        % Construct the full path to the folder
        folderPath = fullfile(baseDir, item.name);
        foldername = item.name;
        scenario = foldername(end-13:end-5);
        activity = foldername(end-3:end);
        testperson = foldername(1:3)
        % Call the function for scenario3 on the folder
        SCENARIO3_FEAT(folderPath,foldername, scenario, activity, testperson);
    end
end
