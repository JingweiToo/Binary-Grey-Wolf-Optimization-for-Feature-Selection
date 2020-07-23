%-------------------------------------------------------------------------%
%  Binary Grey Wolf Optimization (BGWO) source codes demo version         %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling
% N:     Number of wolves
% T:     Maximum number of iterations
% *Note: k-value of KNN & hold-out setting can be modified in jFitnessFunction.m
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------

%% Binary Grey Wolf Optimization (Version 1)
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
N=10; T=100;
% Binary Grey Wolf Optimization 
[sFeat,Sf,Nf,curve]=jBGWO1(feat,label,N,T); 
% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('BGWO'); grid on;


%% Binary Grey Wolf Optimization (Version 2)
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
N=10; T=100;
% Binary Grey Wolf Optimization
[sFeat,Sf,Nf,curve]=jBGWO2(feat,label,N,T); 
% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('BGWO'); grid on;




