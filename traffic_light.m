

%function to detect traffic light

function traffic_light(filename,pathname)
data = imread(strcat(pathname,filename));
img_red = data(:,:,1); %red image
img_green = data(:,:,2); %green image
%img_blue = data(:,:,3); %blue image
img_gray = rgb2gray(data);
diff_red = imsubtract(img_red,img_gray); 
diff_green = imsubtract(img_green,img_gray);
%diff_blue = imsubtract(img_blue,img_gray);
diff_red_noise = medfilt2(diff_red,[3,3]); % remove noise
diff_green_noise = medfilt2(diff_green,[3,3]); 
%diff_blue_noise = medfilt2(diff_blue,[3,3]);
diff_red_binary = im2bw(diff_red_noise,0.28); %convert image to binary
diff_green_binary = im2bw(diff_green_noise,0.28); 
%diff_blue_binary = im2bw(diff_blue_noise,0.28);

count_red = sum(sum(diff_red_binary));
count_green = sum(sum(diff_green_binary));
%count_blue = sum(sum(diff_blue_binary));
disp(count_red);
disp(count_green);
%disp(count_blue);
if count_red>count_green
    real_img = diff_red_binary;
end
if count_green>count_red
    real_img = diff_green_binary;
end
  diff_im = bwareaopen(real_img,300);
    
    bw = bwlabel(diff_im, 8);
    
    stats = regionprops(logical(bw), 'BoundingBox', 'Centroid');
    
    % Display the image
    figure, imshow(data)
    title('traffic light detection');
    %disp(length(stats));
    hold on
 
    for object = 1:length(stats)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
       % disp(bb(:,3));
        if bb(:,3)<125
            rectangle('Position',bb,'EdgeColor','r','LineWidth',2);  
        end
    end
    hold off