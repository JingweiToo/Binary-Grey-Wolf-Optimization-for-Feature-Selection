%-------------------------------------------------------------------%
%  Binary Grey Wolf Optimization (BGWO) demo version                %
%-------------------------------------------------------------------%


%---Input------------------------------------------------------------
% feat     : feature vector (instances x features)
% label    : label vector (instances x 1)
% N        : Number of wolves
% max_Iter : Maximum number of iterations

%---Output-----------------------------------------------------------
% sFeat    : Selected features (instances x features)
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Binary Grey Wolf Optimization (Version 1)
clc, clear, close
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

% Parameter setting
N        = 10; 
max_Iter = 100;
% Binary Grey Wolf Optimization 
[sFeat,Sf,Nf,curve] = jBGWO1(feat,label,N,max_Iter,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of Iterations');
ylabel('Fitness Value');
title('BGWO1'); grid on;


%% Binary Grey Wolf Optimization (Version 2)
clc, clear, close;
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

% Parameter setting
N        = 10; 
max_Iter = 100;
% Binary Grey Wolf Optimization
[sFeat,Sf,Nf,curve] = jBGWO2(feat,label,N,max_Iter,HO); 

% Plot convergence curve
plot(1:max_Iter,curve); 
xlabel('Number of Iterations');
ylabel('Fitness Value');
title('BGWO2'); grid on;




