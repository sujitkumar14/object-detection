

% detect cars 

function car_detector(filename, pathname)
detector  = vision.CascadeObjectDetector('carDetector.xml');
detector.MergeThreshold = 30;
img = imread(strcat(pathname,filename));
BB = step(detector,img);
detectedImg = insertObjectAnnotation(img,'rectangle',BB,'car');
figure; imshow(detectedImg);
title('car Detection')