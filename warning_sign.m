

% stop sign detection
%detect warning sign
%this detection is based on the fact the warning sign is always of red
%color
function warning_sign(filename, pathname)
%detector  = vision.CascadeObjectDetector('stopSignDetector.xml');
%img = imread(strcat(pathname,filename));
%BB = step(detector,img);
%detectedImg = insertObjectAnnotation(img,'rectangle',BB,'stop sign');
%figure; imshow(detectedImg);
    data = imread(strcat(pathname,filename));
    diff_im = imsubtract(data(:,:,1), rgb2gray(data));
    %Use a median filter to filter out noise
    diff_im = medfilt2(diff_im, [3 3]);
    diff_im = im2bw(diff_im,0.21); 
    
    diff_im = bwareaopen(diff_im,300);
    
    bw = bwlabel(diff_im, 8);
    
    stats = regionprops(bw, 'BoundingBox', 'Centroid');
    
    % Display the image
    figure, imshow(data)
    title('Warning sign');
    %disp(length(stats));
    hold on
 
    for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        %disp(stats(object).BoundingBox);
        %disp(bb);
        disp(bb(:,3));
         if bb(:,3)<150
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2);  
        end
        %figure, imshow(data);
        
        %use to crop the detected image
        %img = imcrop(data,bb);
        %img = imresize(img,2,'nearest');
        %figure,imshow(img);
        
        %figure,imshow(im2bw(img));
        %ocrresult= ocr(im2bw(img),'TextLayout','Block');
        %disp(ocrresult.Text);
       
    end
    
    hold off