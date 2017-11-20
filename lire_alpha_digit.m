function [ X ] = lire_alpha_digit( donnee,char )
X=zeros(length(char)*size(donnee,2),size(donnee{1,1},1)*size(donnee{1,1},2));
k=0;
for i=1:length(char)   
        for j=1:size(donnee,2)
            k=k+1;
            X(k,:)=reshape(donnee{char(i),j},1,size(donnee{char(i),j},1)*size(donnee{char(i),j},2));
        end
end

end