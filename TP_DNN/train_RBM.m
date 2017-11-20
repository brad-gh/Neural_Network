function [RBM] = train_RBM(Y,RBM,nb_iter_grad,taillebatch,epsilon,steps)


V(:,:,1)=Y;
n=size(V,1);

for l=1:nb_iter_grad
    
    V(:,:,1)=V(randperm(size(V,1)),:,1);

for batch=1:taillebatch:n
    

    for t=1:steps
        H(batch:min(n,batch+taillebatch-1),:,t)=entree_sortie_RBM(V(batch:min(n,batch+taillebatch-1),:,t),RBM);
        aux1=rand(min(n,batch+taillebatch-1)-batch+1,size(H,2));
        sampleH(batch:min(n,batch+taillebatch-1),:,t)=1*(aux1 <= H(batch:min(n,batch+taillebatch-1),:,t)) + 0*(aux1 > H(batch:min(n,batch+taillebatch-1),:,t));
        V(batch:min(n,batch+taillebatch-1),:,t+1)=sortie_entree_RBM(sampleH(batch:min(n,batch+taillebatch-1),:,t),RBM);
        aux2=rand(min(n,batch+taillebatch-1)-batch+1,size(V,2));
        sampleV(batch:min(n,batch+taillebatch-1),:,t+1)=1*(aux2 <= V(batch:min(n,batch+taillebatch-1),:,t+1)) + 0*(aux2 > V(batch:min(n,batch+taillebatch-1),:,t+1));
        H(batch:min(n,batch+taillebatch-1),:,t+1)=entree_sortie_RBM(V(batch:min(n,batch+taillebatch-1),:,t+1),RBM);
    end
    
    pos=(H(batch:min(n,batch+taillebatch-1),:,1))'*V(batch:min(n,batch+taillebatch-1),:,1);
    neg=(H(batch:min(n,batch+taillebatch-1),:,2))'*sampleV(batch:min(n,batch+taillebatch-1),:,2);
    dw=(pos-neg)';
    da=sum(V(batch:min(n,batch+taillebatch-1),:,1) - sampleV(batch:min(n,batch+taillebatch-1),:,2),1);
    db=sum(H(batch:min(n,batch+taillebatch-1),:,1) - H(batch:min(n,batch+taillebatch-1),:,2),1);
    
    RBM.w=RBM.w+(epsilon/taillebatch)*dw;
    RBM.a=RBM.a+(epsilon/taillebatch)*da;
    RBM.b=RBM.b+(epsilon/taillebatch)*db;
    
  
    
   

    



end


Hid=entree_sortie_RBM(Y,RBM);
Y_reconstruct=sortie_entree_RBM(Hid,RBM);
t =sqrt(sum(sum((Y-Y_reconstruct).^2))/numel(Y));

fprintf('itération gradient = %d,erreur = %d \n',l,t);

end

end