function fitness=jFitnessFunction(feat,label,X,HO)
if sum(X==1)==0
  fitness=inf;
else
  fitness=jwrapperKNN(feat(:,X==1),label,HO);
end
end


function ER=jwrapperKNN(sFeat,label,HO)
%---// Parameter setting for k-value of KNN //
k=5; 
xtrain=sFeat(HO.training==1,:); ytrain=label(HO.training==1); 
xvalid=sFeat(HO.test==1,:); yvalid=label(HO.test==1); 
Model=fitcknn(xtrain,ytrain,'NumNeighbors',k); 
pred=predict(Model,xvalid);
N=length(yvalid); correct=0;
for i=1:N
  if isequal(yvalid(i),pred(i))
    correct=correct+1;
  end
end
Acc=correct/N; 
ER=1-Acc;
end

