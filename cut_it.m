function [ TrainImages, TrainLabels ] = cut_it( TrainImages, TrainLabels , taille_cut);

TrainImages=TrainImages(1:taille_cut, :);
TrainLabels=TrainLabels(1:taille_cut, :);

end

