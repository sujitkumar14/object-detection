

% face Detection 
function face_detection(filename,pathname)
    faceDetect = vision.CascadeObjectDetector;
    I = imread(strcat(pathname,filename));
    BB = step(faceDetect,I);
    figure,
    imshow(I); 
    hold on
    for i=1:size(BB,1)
        rectangle('Position',BB(i,:),'LineWidth',5,'LineStyle','-','EdgeColor','r');
    end
    title('Face Detection');
    hold off; 
    


