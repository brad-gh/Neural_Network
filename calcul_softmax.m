function sorties = calcul_softmax( entrees,RBM )

sorties = (softmax((entrees*RBM.w+repmat(RBM.b,size(entrees,1),1))'))';

end

