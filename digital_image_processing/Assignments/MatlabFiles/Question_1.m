close all;
eye_img = imread('eye_gray.png');
hand_img = imread('hand_gray.png');

% eye_img is an 8 bit image so subtracting 255 from it to obtain negative
nega_eye = 255 - eye_img;
nega_hand = 255 - hand_img;

%Creating Figures and Montage
figure(1)
montage({eye_img,nega_eye});

figure(2)
montage({hand_img,nega_hand});

%Save image
imwrite(nega_eye, 'nega_eye.png');
imwrite(nega_hand, 'nega_hand.png');