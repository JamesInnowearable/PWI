function SCENARIO2_FEAT(rootDir, foldername, scenario, activity, testperson)
   plot_on = 1
    % Initialize data structures for each scenario
    B41E30 = [];
    B41E32 = [];
    B41E39 = [];
    B41E3D = [];
    B41E50 = [];
    B41E51 = [];

    % Call the main function to extract data
    [B41E30, B41E32, B41E39, B41E3D, B41E50, B41E51] = extractQuaternions(rootDir);

    numTF = ones(1, 10000)/10000;
    % - Numerator coefficients of rational transfer function vector
    denomTF = 1;

    %- Denominator coefficients of rational transfer function vector

    % If needed, use filter(numTF,denomTF,X) on every signals

% read size of files and use file with least number of rows to decide size
[a1,a2]=size(B41E30)
[b1,b2]=size(B41E32)

N = min(a1,b1)


[c1,c2]=size(B41E50)
[d1,d2]=size(B41E51)

N2 = min(c1,d1)
% extract data and convert to roll oitch and yaw

    upperBackLeftROLL = transpose(B41E30{1:N,1});
    upperBackLeftPITCH = transpose(B41E30{1:N,2});
    upperBackLeftYAW = transpose(B41E30{1:N,3});
    
    upperBackRightROLL = transpose(B41E32{1:N,1});
    upperBackRightPITCH = transpose(B41E32{1:N,2});
    upperBackRightYAW = transpose(B41E32{1:N,3});
    
    lowerBackROLL = transpose(B41E39{1:end,1});
    lowerBackPITCH = transpose(B41E39{1:end,2});
    lowerBackYAW = transpose(B41E39{1:end,3});
    
    
    LegLeftROLL = transpose(B41E3D{1:end,1});
    LegLeftPITCH = transpose(B41E3D{1:end,2});
    LegLeftYAW = transpose(B41E3D{1:end,3});
    
    UpperArmLeftROLL = transpose(B41E50{1:N2,1});
    UpperArmLeftPITCH = transpose(B41E50{1:N2,2});
    UpperArmLeftYAW = transpose(B41E50{1:N2,3});
    
    UpperArmRightROLL = transpose(B41E51{1:N2,1});
    UpperArmRightPITCH = transpose(B41E51{1:N2,2});
    UpperArmRightYAW = transpose(B41E51{1:N2,3});

    if upperBackLeftROLL(1) ~= 0
        upperBackLeftROLL = upperBackLeftROLL - upperBackLeftROLL(1);
    end
    if upperBackLeftPITCH(1) ~= 0
        upperBackLeftPITCH = upperBackLeftPITCH - upperBackLeftPITCH(1);
    end
    if upperBackLeftYAW(1) ~= 0
        upperBackLeftYAW = upperBackLeftYAW - upperBackLeftYAW(1);
    end


    if upperBackRightROLL(1) ~= 0
        upperBackRightROLL = upperBackRightROLL - upperBackRightROLL(1);
    end
    if upperBackRightPITCH(1) ~= 0
        upperBackRightPITCH = upperBackRightPITCH - upperBackRightPITCH(1);
    end
    if upperBackRightYAW(1) ~= 0
        upperBackRightYAW = upperBackRightYAW - upperBackRightYAW(1);
    end


    if lowerBackROLL(1) ~= 0
        lowerBackROLL = lowerBackROLL - lowerBackROLL(1);
    end
    if lowerBackPITCH(1) ~= 0
        lowerBackPITCH = lowerBackPITCH - lowerBackPITCH(1);
    end
    if lowerBackYAW(1) ~= 0
        lowerBackYAW = lowerBackYAW - lowerBackYAW(1);
    end


    if LegLeftROLL(1) ~= 0
        LegLeftROLL = LegLeftROLL - LegLeftROLL(1);
    end
    if LegLeftPITCH(1) ~= 0
        LegLeftPITCH = LegLeftPITCH - LegLeftPITCH(1);
    end
    if LegLeftYAW(1) ~= 0
        LegLeftYAW = LegLeftYAW - LegLeftYAW(1);
    end

    if UpperArmLeftROLL(1) ~= 0
        UpperArmLeftROLL = UpperArmLeftROLL - UpperArmLeftROLL(1);  
    end
    if UpperArmLeftPITCH(1) ~= 0
        UpperArmLeftPITCH = UpperArmLeftPITCH - UpperArmLeftPITCH(1);
    end
    if UpperArmLeftYAW(1) ~= 0
        UpperArmLeftYAW = UpperArmLeftYAW - UpperArmLeftYAW(1);
    end


    if UpperArmRightROLL(1) ~= 0
        UpperArmRightROLL = UpperArmRightROLL - UpperArmRightROLL(1);
    end
    if UpperArmRightPITCH(1) ~= 0
        UpperArmRightPITCH = UpperArmRightPITCH - UpperArmRightPITCH(1);
    end
    if UpperArmRightYAW(1) ~= 0
        UpperArmRightYAW = UpperArmRightYAW - UpperArmRightYAW(1);
    end
    %% Filter



XmR = [upperBackLeftROLL;upperBackRightROLL];
YmR = [upperBackLeftPITCH;upperBackRightPITCH];
ZmR = [upperBackLeftYAW;upperBackRightYAW];

% [M,N] = size(XmR)

for i = 1:N

    averageUpperBackROLL(i) = mean(XmR(:,i));
    averageUpperBackPITCH(i) = mean(YmR(:,i));
    averageUpperBackYAW(i) = mean(ZmR(:,i));
    
end

%% Flexion

%% Flexion exceeds 45°
testFlexion45 (averageUpperBackPITCH >= 45) = 1;

dTest45 = gradient(testFlexion45);

nmbFlexionSup45 = sum(abs(dTest45), "all")/2;
nmbFlexionSup45 = round(nmbFlexionSup45);

%% Flexion between 20° & 45°
testFlexion20_45 (averageUpperBackPITCH >= 20) = 1;
testFlexion20_45 (averageUpperBackPITCH >= 45) = 0;

dTest20_45 = gradient(testFlexion20_45);

nmbFlexionSup20Below45 = sum(abs(dTest20_45), "all")/2;
nmbFlexionSup20Below45 = round(nmbFlexionSup20Below45);


%% Flexion below 20°

testFlexionBelow20(averageUpperBackPITCH <= 20) = 1;

dtestFlexionBelow20 = gradient(testFlexionBelow20);

nmbFlexioneBlow20 = sum(abs(dtestFlexionBelow20), "all")/2;
nmbFlexioneBlow20 = round(nmbFlexioneBlow20);
%% Twist

for i = 1:N
    if abs(averageUpperBackPITCH(i)) < 20
        testTwistFlexion (averageUpperBackYAW >= 30) = 1;
        testTwistFlexion (averageUpperBackYAW < 30) = 0;
    else
        testTwistFlexion (averageUpperBackROLL >= 30) = 1;
        testTwistFlexion (averageUpperBackROLL < 30) = 0;
    end
end

dTestTwist = gradient(testTwistFlexion);

nmbTwistFlexion = sum(abs(dTestTwist), "all")/2;
nmbTwistFlexion = round(nmbTwistFlexion);

%% Lateral bent/Twistd and no trunk flexion

for i = 1:N
    if abs(lowerBackROLL(i)) < 20
        testTwistNeutral (averageUpperBackROLL >= 30) = 1;
        testTwistNeutral (averageUpperBackROLL < 30) = 0;
    end
end

dtestLateralTwist = gradient(testTwistNeutral);

nmbTwistNeutral = sum(abs(dtestLateralTwist), "all")/2;
nmbTwistNeutral = round(nmbTwistNeutral);

%% Squat

%shallow Squat
testShallowSquat (and(abs(LegLeftPITCH) >= 30,abs(LegLeftPITCH) <= 80)) = 1;
dtestShallowSquat = gradient(testShallowSquat);
nmbShallowSquat = sum(abs(dtestShallowSquat), "all")/2;
nmbShallowSquat = round(nmbShallowSquat);

%Normal Squat
testSquatSupp80 (abs(LegLeftPITCH) > 80) = 1;
dtestSquatSupp80 = gradient(testSquatSupp80);
nmbSquatSupp80 = sum(abs(dtestSquatSupp80), "all")/2;
nmbSquatSupp80 = round(nmbSquatSupp80);


%% Arms Movements 
testArmLeft (and(UpperArmLeftROLL > 60, UpperArmRightROLL < 60)) = 1;
testArmLeft (and(UpperArmLeftPITCH > 60, UpperArmRightROLL < 60)) = 1;
dtestArmLeft = gradient(testArmLeft);
nmbArmLeftMovement = sum(abs(dtestArmLeft), "all")/2;
nmbArmLeftMovement = round(nmbArmLeftMovement);
testArmLRight (and(UpperArmRightROLL > 60, UpperArmLeftROLL < 60)) = 1;
testArmLRight (and(UpperArmRightPITCH > 60, UpperArmLeftROLL < 60)) = 1;
dtestArmLRight = gradient(testArmLRight);
nmbArmRightMovement = sum(abs(dtestArmLRight), "all")/2;
nmbArmRightMovement = round(nmbArmRightMovement);

%% Detection initialization arms movement
initializationArmsMove (and(abs(UpperArmRightROLL) > 60, abs(UpperArmLeftROLL) > 60)) = 1;
initializationArmsMove (and(abs(UpperArmRightROLL) > 60, abs(UpperArmLeftPITCH) > 60)) = 1;
initializationArmsMove (and(abs(UpperArmRightPITCH) > 60, abs(UpperArmLeftPITCH) > 60)) = 1;
initializationArmsMove (and(abs(UpperArmRightPITCH) > 60, abs(UpperArmLeftROLL) > 60)) = 1;
dInitializationArmsMove = gradient(initializationArmsMove);
nmbInitializationArmMovement = sum(abs(dInitializationArmsMove), "all")/2;
nmbInitializationArmMovement = round(nmbInitializationArmMovement); 


%% Variance

VARUpperBackROLL = sqrt(var(averageUpperBackROLL));
VARUpperBackPITCH = sqrt(var(averageUpperBackPITCH));
VARUpperBackYAW = sqrt(var(averageUpperBackYAW));

VARLowerBackROLL = sqrt(var(lowerBackROLL));
VARLowerBackPITCH = sqrt(var(lowerBackPITCH));
VARLowerBackYAW = sqrt(var(lowerBackYAW));


VARLegLeftROLL = sqrt(var(LegLeftROLL));
VARLegLeftPITCH = sqrt(var(LegLeftPITCH));
VARLegLeftYAW = sqrt(var(LegLeftYAW));

VARUpperArmLeftROLL = sqrt(var(UpperArmLeftROLL));
VARUpperArmLeftPITCH = sqrt(var(UpperArmLeftPITCH));
VARUpperArmLeftYAW = sqrt(var(UpperArmLeftYAW));

VARUpperArmRightROLL = sqrt(var(UpperArmRightROLL));
VARUpperArmRightPITCH = sqrt(var(UpperArmRightPITCH)); 
VARUpperArmRightYAW = sqrt(var(UpperArmRightYAW));

%% plot varaince of features

matrixBAR = [
    VARUpperBackROLL, VARUpperBackPITCH, VARUpperBackYAW,
    VARLowerBackROLL, VARLowerBackPITCH, VARLowerBackYAW,
    VARLegLeftROLL, VARLegLeftPITCH, VARLegLeftYAW,
    VARUpperArmLeftROLL, VARUpperArmLeftPITCH, VARUpperArmLeftYAW,
    VARUpperArmRightROLL, VARUpperArmRightPITCH, VARUpperArmRightYAW
];

someNames = {
    'UpperBack Rotation Variance';
    'LowerBack Rotation Variance';
    'LegLeft Rotation Variance';
    'UpperArmLeft Rotation Variance';
    'UpperArmRight Rotation Variance'
};

figure
bar(matrixBAR);
set(gca, 'xticklabel', someNames)
title("Variance of Angle Position")

%% time spend in every position


% IN SECOND
detaTimeinPosition_InisializationArms = sum(initializationArmsMove, "all")/100
detaTimeinPosition_ArmLRight = sum(testArmLRight, "all")/100
detaTimeinPosition_ArmLeft = sum(testArmLeft, "all")/100
detaTimeinPositionSinlgeArm = detaTimeinPosition_ArmLRight + detaTimeinPosition_ArmLeft

detaTimeinPosition_SquatSupp80 = sum(testSquatSupp80, "all")/100
detaTimeinPosition_ShallowSquat = sum(testShallowSquat, "all")/100

detaTimeinPosition_TwistNeutral = sum(testTwistNeutral, "all")/100
detaTimeinPosition_TwistFlexion = sum(testTwistFlexion, "all")/100

detaTimeinPosition_FlexionBelow20 = sum(testFlexionBelow20, "all")/100
detaTimeinPosition_Flexion20_45 = sum(testFlexion20_45, "all")/100
detaTimeinPosition_Flexion45 = sum(testFlexion45, "all")/100

t = N/100

% IN PERCENTAGE
PercentageDetaTimeinPosition_InisializationArms = detaTimeinPosition_InisializationArms/t
PercentagedetaTimeinPosition_ArmLRight = detaTimeinPosition_ArmLRight/t
PercentagedetaTimeinPosition_ArmLeft = detaTimeinPosition_ArmLeft/t
PercentagedetaTimeinPositionSinlgeArm = PercentagedetaTimeinPosition_ArmLRight + PercentagedetaTimeinPosition_ArmLeft

PercentagedetaTimeinPosition_SquatSupp80 = detaTimeinPosition_SquatSupp80/t
PercentagedetaTimeinPosition_ShallowSquat = detaTimeinPosition_ShallowSquat/t

PercentagedetaTimeinPosition_TwistNeutral = detaTimeinPosition_TwistNeutral/t
PercentagedetaTimeinPosition_TwistFlexion = detaTimeinPosition_TwistFlexion/t

% We can seen that the sum of those three is equal to 100 as excpected
PercentagedetaTimeinPosition_FlexionBelow20 = detaTimeinPosition_FlexionBelow20/t
PercentagedetaTimeinPosition_Flexion20_45 = detaTimeinPosition_Flexion20_45/t
PercentagedetaTimeinPosition_Flexion45 = detaTimeinPosition_Flexion45/t

%% Physical Worklaod Index (PWI) Kurowski et al 2014 DOI: 10.1177/0018720813509268

%weighting factors
T2_wt = 1.16; % Moderate flexion
T3_wt = 1.73; % Severe flexion
T4_wt = 0.40; % lateral bent/twist-neutral
T5_wt1 = 1.72; % lateral bent/twist-flexed

A2_wt = 0.16; % 1 arm >60 deg
A3_wt = 0.31; % 2 arms >60 deg

L3_wt = 0.01; % shallow squat 35-80 deg
L6_wt = 0.11; % deep squat >80 deg

%Calculation Change counts to percent of total time as ascore bewtween 0-1 (eg 15% = 0,15)
Trunk_PWI = (T2_wt * PercentagedetaTimeinPosition_Flexion20_45) + (T3_wt * PercentagedetaTimeinPosition_Flexion45) + (T4_wt * PercentagedetaTimeinPosition_TwistNeutral) + (T5_wt1 * PercentagedetaTimeinPosition_TwistFlexion); 
Arm_PWI = (A2_wt * PercentagedetaTimeinPositionSinlgeArm) + (A3_wt * PercentageDetaTimeinPosition_InisializationArms); 
Leg_PWI = (L6_wt * PercentagedetaTimeinPosition_SquatSupp80) + (L3_wt * PercentagedetaTimeinPosition_ShallowSquat);

PWI = Trunk_PWI + Arm_PWI + Leg_PWI;

%% Plot

matrixBAR = [nmbArmRightMovement, nmbArmLeftMovement,nmbInitializationArmMovement, nmbSquatSupp80, nmbShallowSquat, nmbTwistFlexion, nmbTwistNeutral, nmbFlexioneBlow20, nmbFlexionSup20Below45, nmbFlexionSup45, PWI, Trunk_PWI, Arm_PWI, Leg_PWI];
someNames = ["nmbArmRightMovement", "nmbArmLeftMovement", "nmbInitializationArmMovement", "nmbSquatSupp80","nmbShallowSquat", "nmbTwistFlexion","nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "PWI", "Trunk_PWI", "Arm_PWI", "Leg_PWI"];

figure
bar(matrixBAR);
set(gca, 'xticklabel', someNames)
title("Number of times the named positions are taken")


   %% Exporting features
%disp(foldername)% Perform Header save only the first time (creates first row in the text file)
Headers = {'foldername','scenario','product','testperson','nmbArmRightMovement', 'nmbArmLeftMovement', 'nmbInitializationArmMovement', 'nmbSquatSupp80','nmbShallowSquat', 'nmbTwistFlexion','nmbTwistNeutral', 'nmbFlexioneBlow20', 'nmbFlexionSup20Below45', 'nmbFlexionSup45', 'detaTimeinPosition_InisializationArms', 'detaTimeinPosition_ArmLRight', 'detaTimeinPosition_ArmLeft', 'detaTimeinPositionSinlgeArm', 'detaTimeinPosition_SquatSupp80', 'detaTimeinPosition_ShallowSquat' , 'detaTimeinPosition_TwistNeutral', 'detaTimeinPosition_TwistFlexion', 'detaTimeinPosition_FlexionBelow20', 'detaTimeinPosition_Flexion20_45', 'detaTimeinPosition_Flexion45', 'PercentageDetaTimeinPosition_InisializationArms', 'PercentagedetaTimeinPosition_ArmLRight', 'PercentagedetaTimeinPosition_ArmLeft','PercentagedetaTimeinPositinSinlgeArm', 'PercentagedetaTimeinPosition_SquatSupp80', 'PercentagedetaTimeinPosition_ShallowSquat', 'PercentagedetaTimeinPosition_TwistNeutral', 'PercentagedetaTimeinPosition_TwistFlexion', 'PercentagedetaTimeinPosition_FlexionBelow20', 'PercentagedetaTimeinPosition_Flexion20_45', 'PercentagedetaTimeinPosition_Flexion45','PWI', 'Trunk_PWI', 'Arm_PWI', 'Leg_PWI'};

% Create a table with all features to save (same order as above)
V = {foldername,scenario,activity,testperson,nmbArmRightMovement, nmbArmLeftMovement,nmbInitializationArmMovement, nmbSquatSupp80, nmbShallowSquat, nmbTwistFlexion, nmbTwistNeutral, nmbFlexioneBlow20, nmbFlexionSup20Below45, nmbFlexionSup45, detaTimeinPosition_InisializationArms, detaTimeinPosition_ArmLRight, detaTimeinPosition_ArmLeft, detaTimeinPositionSinlgeArm, detaTimeinPosition_SquatSupp80, detaTimeinPosition_ShallowSquat, detaTimeinPosition_TwistNeutral, detaTimeinPosition_TwistFlexion, detaTimeinPosition_FlexionBelow20, detaTimeinPosition_Flexion20_45, detaTimeinPosition_Flexion45, PercentageDetaTimeinPosition_InisializationArms, PercentagedetaTimeinPosition_ArmLRight, PercentagedetaTimeinPosition_ArmLeft, PercentagedetaTimeinPositionSinlgeArm, PercentagedetaTimeinPosition_SquatSupp80, PercentagedetaTimeinPosition_ShallowSquat, PercentagedetaTimeinPosition_TwistNeutral, PercentagedetaTimeinPosition_TwistFlexion, PercentagedetaTimeinPosition_FlexionBelow20, PercentagedetaTimeinPosition_Flexion20_45, PercentagedetaTimeinPosition_Flexion45, PWI, Trunk_PWI, Arm_PWI, Leg_PWI};
T=cell2table(V,'VariableNames',Headers);
%filename2 = fullfile('./feat/',testperson,'_',scenario,'.csv')
%writetable(T,'./feat/feat1.csv')

% Define the folder path
folderpath2 = './feat/';
filename2 = fullfile(folderpath2, strcat(testperson, '_', scenario,'_',activity, '.csv'));
writetable(T, filename2);


%save(filename,'T')
%Use this one only the first time (to include Headers)

% Append data to table 
%writetable(T,'EV_KE_Feature_Collection.txt','WriteMode','Append','WriteVariableNames'...

disp(foldername)
disp(scenario)
disp(activity)
disp(testperson)    
end

function [B41E30, B41E32, B41E39, B41E3D, B41E50, B41E51] = extractQuaternions(rootDir)
  
    % List all files and folders in the root directory
    contents = dir(rootDir);
    % Initialize data structures for each scenario
    B41E30 = [];
    B41E32 = [];
    B41E39 = [];
    B41E3D = [];
    B41E50 = [];
    B41E51 = [];

    for i = 1:length(contents)
        item = contents(i);

        % Check if the item is a file (not a directory) and exclude '.' and '..'
        if ~item.isdir && ~ismember(item.name, {'.', '..'})
            % If the item is a file
            fileName = item.name;

            % Check if the file name contains 'B41E320', 'B41E32', or 'B41E39'
            if contains(fileName, 'B41E30')
                % Extract data for LUB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E30 = [B41E30; data];
            elseif contains(fileName, 'B41E32')
                % Extract data for RUB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E32 = [B41E32; data];
            elseif contains(fileName, 'B41E39')
                % Extract data for LB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E39 = [B41E39; data];
            elseif contains(fileName, 'B41E3D')
                % Extract data for LB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E3D = [B41E3D; data];
            elseif contains(fileName, 'B41E50')
                % Extract data for LB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E50 = [B41E50; data];
            elseif contains(fileName, 'B41E51')
                % Extract data for LB scenario
                data = extractData(fullfile(rootDir, fileName));
                B41E51 = [B41E51; data];
            end
        end
    end

    % Display the extracted data for each scenario
    % disp('Data for B41E30 (LUB):');
    % disp(B41E30);
    % 
    % disp('Data for B41E32 (RUB):');
    % disp(B41E32);
    % 
    % disp('Data for B41E39 (LB):');
    % disp(B41E39);
    % 
    % disp('Data for B41E3D (?):');
    % disp(B41E3D);
    % 
    % disp('Data for B41E50  (?):');
    % disp(B41E50);
    % 
    % disp('Data for B41E50  (?):');
    % disp(B41E51);
end

function data = extractData(filePath)
    % Set up the Import Options
    opts = delimitedTextImportOptions("NumVariables", 26);
    opts.DataLines = [6, Inf];
    opts.Delimiter = "\t";
    opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17", "Roll", "Pitch", "Yaw"];
    opts.SelectedVariableNames = ["Roll", "Pitch", "Yaw"];
    opts.VariableTypes = ["string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "string", "double", "double", "double"];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17"], "WhitespaceRule", "preserve");
    opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10", "Var11", "Var12", "Var13", "Var14", "Var15", "Var16", "Var17"], "EmptyFieldRule", "auto");

    % Import the data
    data = readtable(filePath, opts);
end