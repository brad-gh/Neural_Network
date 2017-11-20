function [ DBN ] = init_DBN( config )
nb_couches=length(config)-1;

for k=1:nb_couches
   DBN{k}=init_RBM(config(k),config(k+1));
end

end
