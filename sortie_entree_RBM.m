function [V] = sortie_entree_RBM(donnee,RBM)
l=donnee*(RBM.w') + repmat(RBM.a,size(donnee,1),1);
V=sigmoid(l);
end