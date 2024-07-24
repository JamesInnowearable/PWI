% Statistical caluclations of IMU data for Essity

%% import data

activity1data = extractData("M:\IMU\matlab\feat\combined_activity1_data.csv");
activity2data = extractData("M:\IMU\matlab\feat\combined_activity2_data.csv");
activity3data = extractData("M:\IMU\matlab\feat\combined_activity3_data.csv");

%% add single arm raise column to data
activity1data.nmbSingleArm = activity1data.nmbArmRightMovement + activity1data.nmbArmLeftMovement; 
activity2data.nmbSingleArm = activity2data.nmbArmRightMovement + activity2data.nmbArmLeftMovement;
activity3data.nmbSingleArm = activity3data.nmbArmRightMovement + activity3data.nmbArmLeftMovement;
%% Descriptive statistics
disp("Descriptive statistics activity1, Caregiver; Change")
%grpstats(activity1data, "product",["mean","std","max","sem","meanci"],"DataVars",["nmbArmRightMovement", "nmbArmLeftMovement", "nmbSingleArm", "nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPosition_ArmLRight", "detaTimeinPosition_ArmLeft", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms", "PercentagedetaTimeinPosition_ArmLRight", "PercentagedetaTimeinPosition_ArmLeft", "PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45", "PWI", "Trunk_PWI", "Arm_PWI", "Leg_PWI"])
StatsAct1 = grpstats(activity1data, "product",["mean","std"],"DataVars",["nmbSingleArm","nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms","PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45"])
% save to table to csv file
writetable(StatsAct1, './feat/Stats_act1.csv')

disp("Descriptive statistics activity2, Care Recipiant; Change")
%grpstats(activity2data, "product",["mean","min","max","sem","meanci"],"DataVars",["nmbArmRightMovement", "nmbArmLeftMovement", "nmbSingleArm", "nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPosition_ArmLRight", "detaTimeinPosition_ArmLeft", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms", "PercentagedetaTimeinPosition_ArmLRight", "PercentagedetaTimeinPosition_ArmLeft", "PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45", "PWI", "Trunk_PWI", "Arm_PWI", "Leg_PWI"])
StatsAct2 = grpstats(activity2data, "product",["mean","std"],"DataVars",["nmbSingleArm","nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms","PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45"])
writetable(StatsAct2, './feat/Stats_act2.csv')

disp("Descriptive statistics activity3, Care Recipiant; No change")
%grpstats(activity3data, "product",["mean","min","max","sem","meanci","DataVars",["nmbArmRightMovement", "nmbArmLeftMovement", "nmbSingleArm", "nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPosition_ArmLRight", "detaTimeinPosition_ArmLeft", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms", "PercentagedetaTimeinPosition_ArmLRight", "PercentagedetaTimeinPosition_ArmLeft", "PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45", "PWI", "Trunk_PWI", "Arm_PWI", "Leg_PWI"])
StatsAct3 = grpstats(activity3data, "product",["mean","std"],"DataVars",["nmbSingleArm","nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms","PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45"])
writetable(StatsAct3, './feat/Stats_act3.csv')

%% KruskalWallis
%disp("activity1data, Caregiver;No Change")
%disp(activity1data)
%performKruskalWallis(activity1data.PWI,activity1data.product)

%disp("activity2data, Care Recipiant;Change")
%disp(activity2data)
%performKruskalWallis(activity2data.PWI,activity2data.product)

%disp("activity3data, Care Recipiant;No Change")
%disp(activity3data)
%performKruskalWallis(activity3data.PWI,activity3data.product)
%% ANOVA
disp("activity1ANOVA, Caregiver; Change")
performANOVA1(activity1data.PWI,activity1data.product)

disp("activity2ANOVA, Care Recipiant; Change")
performANOVA1(activity2data.PWI,activity2data.product)

disp("activity3ANOVA, Care Recipiant;No Change")
performANOVA1(activity3data.PWI,activity3data.product)

%% Histograms for PWI split by product

performHist(activity1data.PWI,activity1data.product)
performHist(activity2data.PWI,activity2data.product)
performHist(activity3data.PWI,activity3data.product)


%% functions
% import data
function data = extractData(filePath)
    % Set up the Import Options
    opts = delimitedTextImportOptions("NumVariables", 15);
    opts.DataLines = [2, Inf];
    opts.Delimiter = ",";
    opts.VariableNames = ["foldername", "scenario", "product", "testperson", "nmbArmRightMovement", "nmbArmLeftMovement", "nmbInitializationArmMovement", "nmbSquatSupp80", "nmbShallowSquat", "nmbTwistFlexion", "nmbTwistNeutral", "nmbFlexioneBlow20", "nmbFlexionSup20Below45", "nmbFlexionSup45", "detaTimeinPosition_InisializationArms", "detaTimeinPosition_ArmLRight", "detaTimeinPosition_ArmLeft", "detaTimeinPositionSinlgeArm", "detaTimeinPosition_SquatSupp80", "detaTimeinPosition_ShallowSquat", "detaTimeinPosition_TwistNeutral", "detaTimeinPosition_TwistFlexion", "detaTimeinPosition_FlexionBelow20", "detaTimeinPosition_Flexion20_45", "detaTimeinPosition_Flexion45", "PercentageDetaTimeinPosition_InisializationArms", "PercentagedetaTimeinPosition_ArmLRight", "PercentagedetaTimeinPosition_ArmLeft", "PercentagedetaTimeinPositinSinlgeArm", "PercentagedetaTimeinPosition_SquatSupp80", "PercentagedetaTimeinPosition_ShallowSquat", "PercentagedetaTimeinPosition_TwistNeutral", "PercentagedetaTimeinPosition_TwistFlexion", "PercentagedetaTimeinPosition_FlexionBelow20", "PercentagedetaTimeinPosition_Flexion20_45", "PercentagedetaTimeinPosition_Flexion45", "PWI", "Trunk_PWI", "Arm_PWI", "Leg_PWI"];
    opts.VariableTypes = ["string", "double", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    opts = setvaropts(opts, "foldername", "WhitespaceRule", "preserve");
    opts = setvaropts(opts, ["foldername", "product"], "EmptyFieldRule", "auto");
    opts = setvaropts(opts, ["scenario", "testperson"], "TrimNonNumeric", true);
    opts = setvaropts(opts, ["scenario", "testperson"], "ThousandsSeparator", ",");

    % Import the data
    data = readtable(filePath, opts);
end

% run KruskalWallis
function performKruskalWallis(VAR1,GRPVAR)
    PWI = VAR1;
    activityGroups = GRPVAR;

    % Kruskal-Wallis test
    [p, tbl, stats] = kruskalwallis(PWI, activityGroups, 'off');
   
    % Display results
    disp(tbl);
    disp(p);

    % Figure
    figure();
    c=multcompare(stats);
       
    tbl = array2table(c,"VariableNames", ["Group A","Group B","Lower Limit","A-B","Upper Limit","P-value"]) 
end

% run repeated Anova
function performANOVA1(VAR1,GRPVAR)
  GRPVAR = categorical(GRPVAR);
% Display unique levels of 'product'
[p, tbl, stats] = anova1(VAR1, GRPVAR, 'off');
% Display results
disp('ANOVA Results:');
disp(tbl);
disp(stats);

 figure();
 c=multcompare(stats);
end

%plot nested histograms
function performHist(VAR1, GRPVAR)
data = VAR1;
categories = categorical(GRPVAR); % Categorical variable

% Create a histogram based on the numerical variable, split by categories
figure();

set(groot, 'DefaultAxesFontSize', 10)% Set the default font size for all text in the figures to 10
edges = linspace(min(data), max(data), 20); % Adjust the number of bins as needed

subplot(3, 1, 1)
histogram(data(categories == 'pant'), edges, FaceColor="#D95319"); % Adjust 'BinWidth' as needed
xlabel('PWI');
ylabel('Frequency');
title('Pant', FontSize=12);
ylim([0, 5]); % Fixing y-axis size

subplot(3,1,2)
histogram(data(categories == 'slip'),edges, FaceColor="#EDB120");
xlabel('PWI');
ylabel('Frequency');
title('Slip', FontSize=12);
ylim([0, 5]);

subplot(3,1,3)
histogram(data(categories == 'stre'), edges, FaceColor="#A2142F");
% Labels and title
ax.FontSize = 10
xlabel('PWI');
ylabel('Frequency');
title('Stretch', FontSize=12);
ylim([0, 5]);
end
