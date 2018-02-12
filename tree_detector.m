% detect trees

function tree_detector(filename, pathname)
detector  = vision.CascadeObjectDetector('treeDetector.xml');
img = imread(strcat(pathname,filename));
BB = step(detector,img);
detectedImg = insertObjectAnnotation(img,'rectangle',BB,'tree');
figure; imshow(detectedImg); 
title('tree detection');