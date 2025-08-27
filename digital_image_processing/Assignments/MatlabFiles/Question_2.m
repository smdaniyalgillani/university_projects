clc
close all

im_land = imread('landscape_gray.png');

[im_r,im_c] = size(im_land); %find number of rows and columns.
land_res = im_r*im_c; % resolution/total no. of pixels.

eq_land = uint8(zeros(im_r, im_c)); %resulting empty image.

%Creating Table parameters for Histogram Equalization
%Number of rows = 256, number of columns = 1 each
f = zeros(256,1); %frequency
pdf = zeros(256,1); %Probability Distribution function
cdf = zeros(256,1); %Cummulative Distribution function
cum = zeros(256,1);
output = zeros(256,1);

%Inputting values and performing operations on table.

for i = 1:im_r;
    for j=1:im_c;
        % value+1 used due to 0-255 values
        value = im_land(i,j);
        f(value+1)=f(value+1)+1; %incrementing frequency column
        pdf(value+1) = f(value+1)/land_res; % freqeuncy/total_pixels
    end
end

sum = 0; L = 255;
for i =1:size(pdf)
    sum = sum+f(i);
    cum(i)=sum;
    cdf(i) = cum(i)/land_res;
    output(i)=round(cdf(i)*L); %Quantizing/Removing decimal point of resulting values by rounding off
end
for i = 1:im_r
    for j = 1:im_c
        eq_land(i,j)=output(im_land(i,j)+1); %Inputting equalized values to resulting image matrix
    end
end

%Output result of image
figure(1),
montage({im_land, eq_land});

% Plot the histogram.
figure(2),
subplot(121)
%figure(1)
imshow(im_land);
title('OriginalImage');

subplot(122)
%figure(2),histogram(im_land);
histogram(im_land);
title('Histogram of Original image');

figure(3),
subplot(121)
%figure(1)
imshow(eq_land);
title('Enhanced Image');

subplot(122)
%figure(2),histogram(im_land);
histogram(eq_land);
title('Histogram of Enhanced Image');

%Save image
imwrite(eq_land, 'Equalized_Image.png');