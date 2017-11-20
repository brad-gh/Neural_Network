clear all
close all 
clc

nb_iter_grad=100;
taillebatch=10;
epsilon=0.1;
steps=1;
nb_iter_gibbs=100;
nb_images=20;
nb_classes=10;

load('binaryalphadigs.mat');
X=lire_alpha_digit(dat,[11 12 13 14]);

config=[size(X,2),150,150,nb_classes];


DBN=init_DBN(config);
DBN=train_DBN( X,DBN,nb_iter_grad,taillebatch,epsilon,steps );
Y=generer_image_DBN(DBN,nb_iter_gibbs,nb_images);

for i=1:nb_images
    Y_seg{i}=reshape(Y{i},20,16);
    figure
    imshow(Y_seg{i})
end    