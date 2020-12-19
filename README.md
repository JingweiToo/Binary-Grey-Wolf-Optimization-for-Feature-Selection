# Binary Grey Wolf Optimization for Feature Selection

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/e0c2396e-8ae3-40e9-8d3c-13ad79541a55/6d73ddc1-3841-4004-9769-6a83a9e15196/images/screenshot.PNG)


## Introduction

* This toolbox offers two types of binary grey wolf optimization methods 
  + BGWO1 
  + BGWO2  
* The < Main.m file > demos the examples of how BGWO solves the feature selection problem using benchmark data-set 


## Input
* *feat*     : feature vector ( Instances *x* Features )
* *label*    : label vector ( Instances *x* 1 )
* *N*        : number of wolves
* *max_Iter* : maximum number of iterations


## Output
* *sFeat*    : selected features
* *Sf*       : selected feature index
* *Nf*       : number of selected features
* *curve*    : convergence curve


### Example
```code
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

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
```


## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox


## Cite As
```code
@article{too2018new,
  title={A new competitive binary Grey Wolf Optimizer to solve the feature selection problem in EMG signals classification},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah and Mohd Ali, Nursabillilah and Tee, Weihown},
  journal={Computers},
  volume={7},
  number={4},
  pages={58},
  year={2018},
  publisher={Multidisciplinary Digital Publishing Institute}
}


@article{too2020opposition,
  title={Opposition based competitive grey wolf optimizer for EMG feature selection},
  author={Too, Jingwei and Abdullah, Abdul Rahim},
  journal={Evolutionary Intelligence},
  pages={1--15},
  year={2020},
  publisher={Springer}
}

```

