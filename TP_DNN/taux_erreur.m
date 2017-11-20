function t =taux_erreur(A,B)
v =(A - B).^2;
t=sqrt(sum(sum(v))/numel(v));

end

