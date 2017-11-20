function [ X ] = generer_image_DBN(DBN,nb_iter_gibbs,nb_images )

nb_DBN=size(DBN,2);

X  = generer_image_RBM(DBN{nb_DBN-1},nb_iter_gibbs,nb_images );

for k=(nb_DBN-2):-1:1
    
    for i=1:nb_images
        
     X{i}=sortie_entree_RBM(X{i},DBN{k});
     
    end
end

end

