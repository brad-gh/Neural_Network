function [H] = entree_sortie_RBM(donnee,RBM)
l=donnee*RBM.w + repmat(RBM.b,size(donnee,1),1);
H=sigmoid(l);
end