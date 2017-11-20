clear all
close all 
clc

nb_iter_grad=100;
taillebatch=100;
epsilon=0.1;
steps=1;
nb_classes=10;
iterations=100;
StepRatio=0.1;
BatchSize=100;
taille_cut=1000;
nb_neurcouche=150;
nb_couche=2;

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


tn1=test_DNN(DBNpre,TestImages,TestLabels);
tn2=test_DNN(DBN,TestImages,TestLabels);





