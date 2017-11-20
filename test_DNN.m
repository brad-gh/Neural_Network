function [ t ] = test_DNN(DBN,X,label_test)

nb_DBN=size(DBN,2);
Y=entree_sortie_reseau(DBN,X);
res=zeros(size(Y{nb_DBN}));

for i=1:size(Y{nb_DBN})
    
    [inutile,ind]=max(Y{nb_DBN}(i,:));
    res(i,ind(1))=1;
end

t=taux_erreur(res,label_test);


end

