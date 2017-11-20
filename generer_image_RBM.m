function [ X ] = generer_image_RBM(RBM,nb_iter_gibbs,nb_images )

p=size(RBM.w,1);
q=size(RBM.w,2);
Init(:,:)=zeros(1,p);
V(:,:,1)=zeros(1,p);
H(:,:,1)=zeros(1,q);

for i=1:nb_images
    V(:,:,1)=Init;
    for j=1:nb_iter_gibbs
        H(:,:,j)=entree_sortie_RBM(V(:,:,j),RBM);
        aux1=rand(1,q);
        H(:,:,j)=1*(aux1 < H(:,:,j)) + 0*(aux1 > H(:,:,j));
        V(:,:,j+1)=sortie_entree_RBM(H(:,:,j),RBM);
        aux2=rand(1,p);
        V(:,:,j+1)=1*(aux2 < V(:,:,j+1)) + 0*(aux2 > V(:,:,j+1));
    end
    X{i}=V(:,:,nb_iter_gibbs+1);
end

end

