function [ DBN ] = train_DBN( Y,DBN,nb_iter_grad,taillebatch,epsilon,steps )

nb_DBN=size(DBN,2);

for k=1:(nb_DBN-1)
    DBN{k}=train_RBM(Y,DBN{k},nb_iter_grad,taillebatch,epsilon,steps);
    Y=entree_sortie_RBM(Y,DBN{k});
end

end

