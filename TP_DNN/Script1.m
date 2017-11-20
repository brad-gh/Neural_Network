clear all
close all 
clc

nb_iter_grad=100;
taillebatch=10;
epsilon=0.1;
steps=1;
nb_iter_gibbs=1000;
nb_images=10;


load('binaryalphadigs.mat');
X=lire_alpha_digit(dat,[11 12 13 14]);



RBM=init_RBM(size(X,2),100);
RBM=train_RBM(X,RBM,nb_iter_grad,taillebatch,epsilon,steps);
Y=generer_image_RBM(RBM,nb_iter_gibbs,nb_images);

for i=1:nb_images
    Y_seg{i}=reshape(Y{i},20,16);
    figure
    imshow(Y_seg{i})
end    
    

