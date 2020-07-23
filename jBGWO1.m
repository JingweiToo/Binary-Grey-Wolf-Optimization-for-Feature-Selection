%-------------------------------------------------------------------------%
%  Binary Grey Wolf Optimization (BGWO) source codes demo version         %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%

function [sFeat,Sf,Nf,curve]=jBGWO1(feat,label,N,T)
%---Inputs-----------------------------------------------------------------
% feat:  features
% label: labelling
% N:     Number of wolves
% T:     Maximum number of iterations
%---Outputs----------------------------------------------------------------
% sFeat: Selected features
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------


fun=@jFitnessFunction; 
D=size(feat,2); X=zeros(N,D);
for i=1:N
  for d=1:D
    if rand() > 0.5
      X(i,d)=1;
    end
  end
end
fit=zeros(1,N);
for i=1:N
  fit(i)=fun(feat,label,X(i,:));
end 
[~,idx]=sort(fit,'ascend');  
Xalpha=X(idx(1),:); Xbeta=X(idx(2),:); Xdelta=X(idx(3),:);
Falpha=fit(idx(1)); Fbeta=fit(idx(2)); Fdelta=fit(idx(3));
curve=inf; t=1; 
figure(1); clf; axis([1 100 0 0.2]); xlabel('Number of Iterations');
ylabel('Fitness Value'); title('Convergence Curve'); grid on;
%---Iterations start-------------------------------------------------------
while t <= T
  a=2-2*(t/T); 
  for i=1:N
    for d=1:D
      C1=2*rand(); C2=2*rand(); C3=2*rand();
      Dalpha=abs(C1*Xalpha(d)-X(i,d)); Dbeta=abs(C2*Xbeta(d)-X(i,d));
      Ddelta=abs(C3*Xdelta(d)-X(i,d));
      A1=2*a*rand()-a; 
      Bstep1=jBstepBGWO(A1*Dalpha); Bstep2=jBstepBGWO(A1*Dbeta); 
      Bstep3=jBstepBGWO(A1*Ddelta);
      X1=jBGWOupdate(Xalpha(d),Bstep1); X2=jBGWOupdate(Xbeta(d),Bstep2);
      X3=jBGWOupdate(Xdelta(d),Bstep3);
      r=rand();
      if r < 1/3
        X(i,d)=X1;
      elseif r < 2/3 && r >=1/3
        X(i,d)=X2;
      else
        X(i,d)=X3;
      end
    end
  end
  for i=1:N
    fit(i)=fun(feat,label,X(i,:));
    if fit(i) < Falpha
      Falpha=fit(i); Xalpha=X(i,:);
    end
    if fit(i) < Fbeta && fit(i) > Falpha
      Fbeta=fit(i); Xbeta=X(i,:);
    end
    if fit(i) < Fdelta && fit(i) > Falpha && fit(i) > Fbeta
      Fdelta=fit(i); Xdelta=X(i,:);
    end
  end
  curve(t)=Falpha; 
  pause(1e-20); hold on;
  CG=plot(t,Falpha,'Color','r','Marker','.'); set(CG,'MarkerSize',5);
  t=t+1;
end
Pos=1:D; Sf=Pos(Xalpha==1); Nf=length(Sf); sFeat=feat(:,Sf); 
end


function Bstep=jBstepBGWO(AD)
Cstep=1/(1+exp(-10*(AD-0.5))); 
if Cstep >= rand() 
	Bstep=1; 
else
	Bstep=0;
end
end


function Y=jBGWOupdate(X,Bstep) 
if (X+Bstep) >= 1
	Y=1;
else
  Y=0;
end
end



