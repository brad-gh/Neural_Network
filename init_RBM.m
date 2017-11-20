function [ RBM ] = init_RBM (nb_neur1,nb_neur2 )
RBM.a=zeros(1,nb_neur1);
RBM.b=zeros(1,nb_neur2);
RBM.w=randn(nb_neur1,nb_neur2)*0.1;
end

