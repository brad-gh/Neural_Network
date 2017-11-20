function [ A ] = entree_sortie_reseau( DBN,Y )

nb_DBN=size(DBN,2);

A{1}=entree_sortie_RBM(Y,DBN{1});

for k=1:nb_DBN - 2
    
    A{k+1}=entree_sortie_RBM(A{k},DBN{k+1});

end

A{nb_DBN}=calcul_softmax(A{nb_DBN-1},DBN{nb_DBN});

end
