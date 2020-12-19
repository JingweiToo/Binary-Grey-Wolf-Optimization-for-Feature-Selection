function [sFeat,Sf,Nf,curve] = jBGWO2(feat,label,N,max_Iter,HO)

fun = @jFitnessFunction; 
dim = size(feat,2); 
X   = zeros(N,dim); 
for i = 1:N
  for d = 1:dim
    if rand() > 0.5
      X(i,d) = 1;
    end
  end
end
fit = zeros(1,N);
for i = 1:N
  fit(i) = fun(feat,label,X(i,:),HO);
end
[~, idx] = sort(fit,'ascend');  
Xalpha   = X(idx(1),:); 
Xbeta    = X(idx(2),:); 
Xdelta   = X(idx(3),:);
Falpha   = fit(idx(1)); 
Fbeta    = fit(idx(2)); 
Fdelta   = fit(idx(3));

curve = inf;
t = 1;
%---Iterations start-------------------------------------------------
while t <= max_Iter
  a = 2 - 2 * (t / max_Iter); 
  for i = 1:N
    for d = 1:dim
      C1 = 2 * rand();
      C2 = 2 * rand();
      C3 = 2 * rand();
      Dalpha = abs(C1 * Xalpha(d) - X(i,d));
      Dbeta  = abs(C2 * Xbeta(d) - X(i,d));
      Ddelta = abs(C3 * Xdelta(d) - X(i,d));
      A1 = 2 * a * rand() - a; 
      A2 = 2 * a * rand() - a;
      A3 = 2 * a * rand() - a;
      X1 = Xalpha(d) - A1 * Dalpha;
      X2 = Xbeta(d) - A2 * Dbeta; 
      X3 = Xdelta(d) - A3 * Ddelta;
      Xn = (X1 + X2 + X3) / 3; 
      TF = 1 / (1 + exp(-10 * (Xn - 0.5)));
      if TF >= rand()
        X(i,d) = 1; 
      else
        X(i,d) = 0; 
      end
    end
  end
  for i = 1:N
    fit(i) = fun(feat,label,X(i,:),HO); 
    if fit(i) < Falpha
      Falpha = fit(i);
      Xalpha = X(i,:);
    end
    if fit(i) < Fbeta  &&  fit(i) > Falpha
      Fbeta = fit(i); 
      Xbeta = X(i,:);
    end
    if fit(i) < Fdelta  &&  fit(i) > Falpha  &&  fit(i) > Fbeta
      Fdelta = fit(i); 
      Xdelta = X(i,:);
    end
  end
  curve(t) = Falpha;
  fprintf('\nIteration %d Best (BGWO2)= %f',t,curve(t))
  t = t + 1;
end
Pos   = 1:dim;
Sf    = Pos(Xalpha == 1);
Nf    = length(Sf); 
sFeat = feat(:,Sf);
end



