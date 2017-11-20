clear all
close all 
clc

donneefix=[1000 3000 7000 10000 30000 60000];
neurfix=[200 500];
couchesfix=[2 4];

for t=1:size(donneefix,2)
for s=1:size(neurfix,2)
for v=1:size(couchesfix,2)
nb_iter_grad=100;
taillebatch=100;
epsilon=0.1;
steps=1;
nb_classes=10;
iterations=100;
StepRatio=0.1;
BatchSize=100;
taille_cut=donneefix(t);
nb_neurcouche=neurfix(s);
nb_couche=couchesfix(v);

mnistfilenames{1} = 'train-images-idx3-ubyte';
mnistfilenames{2} = 'train-labels-idx1-ubyte';
mnistfilenames{3} = 't10k-images-idx3-ubyte';
mnistfilenames{4} = 't10k-labels-idx1-ubyte';

[ TrainImages, TrainLabels, TestImages, TestLabels ] = mnistread( mnistfilenames );
[ TrainImages, TrainLabels ] = cut_it( TrainImages, TrainLabels , taille_cut);


preconfig=[size(TrainImages,2)];

for i=1:nb_couche
preconfig=[preconfig,nb_neurcouche];
end

config=[preconfig,nb_classes];

DBNpre=init_DBN(config);

DBN=init_DBN(config);


DBNpre=train_DBN( TrainImages,DBNpre,nb_iter_grad,taillebatch,epsilon,steps );

[DBNpre, cross_entropy1] = retropropagation(DBNpre, TrainImages, TrainLabels, iterations,StepRatio,BatchSize);

[DBN, cross_entropy2] = retropropagation(DBN, TrainImages, TrainLabels, iterations,StepRatio,BatchSize);


tnpreApp(t,s,v)=test_DNN(DBNpre,TrainImages,TrainLabels);
tnpre(t,s,v)=test_DNN(DBNpre,TestImages,TestLabels);
tnApp(t,s,v)=test_DNN(DBN,TrainImages,TrainLabels);
tn(t,s,v)=test_DNN(DBN,TestImages,TestLabels);
end
end
end

csvwrite('nb_couches',couchesfix)

csvwrite('tauxErrApp_pre-11.csv',tnpreApp(:,1,1))
csvwrite('tauxErrApp-11.csv',tnApp(:,1,1))
csvwrite('tauxErr_pre-11.csv',tnpre(:,1,1))
csvwrite('tauxErr-11.csv',tn(:,1,1))

csvwrite('tauxErrApp_pre-12.csv',tnpreApp(:,1,2))
csvwrite('tauxErrApp-12.csv',tnApp(:,1,2))
csvwrite('tauxErr_pre-12.csv',tnpre(:,1,2))
csvwrite('tauxErr-12.csv',tn(:,1,2))

csvwrite('tauxErrApp_pre-21.csv',tnpreApp(:,2,1))
csvwrite('tauxErrApp-21.csv',tnApp(:,2,1))
csvwrite('tauxErr_pre-21.csv',tnpre(:,2,1))
csvwrite('tauxErr-21.csv',tn(:,2,1))

csvwrite('tauxErrApp_pre-22.csv',tnpreApp(:,2,2))
csvwrite('tauxErrApp-22.csv',tnApp(:,2,2))
csvwrite('tauxErr_pre-22.csv',tnpre(:,2,2))
csvwrite('tauxErr-22.csv',tn(:,2,2))