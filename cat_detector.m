
%cat Detector

function cat_detector(filename, pathname)
detector  = vision.CascadeObjectDetector('cat.xml');
detector.MergeThreshold = 15;
img = imread(strcat(pathname,filename));
BB = step(detector,img);
detectedImg = insertObjectAnnotation(img,'rectangle',BB,'cat');
figure; imshow(detectedImg);
title('cat detection');