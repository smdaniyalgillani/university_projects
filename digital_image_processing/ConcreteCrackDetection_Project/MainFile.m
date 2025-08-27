%Dataset read directory
inputDir = 'D:\SystemFiles\Desktop\Digital Image Processing Project\Concrete Crack Images';

%Dataset write directory
outputDir = 'D:\SystemFiles\Desktop\Digital Image Processing Project\Results';
imageFiles = dir(fullfile(inputDir, '*.jpg'));

%Reference image
refImage = imread("00001.jpg");

%----------------------------For Loop--------------------------------------
for i = 1:length(imageFiles)

%Read target images
tarImage = imread(fullfile(inputDir, imageFiles(i).name));

%figure(1)
%figure, imshowpair(refImage, tarImage, "montage")
%title("Reference Image vs Target Image");

%--------------------------Preprocessing-----------------------------------

%Apply Contrast Stretching to both images
refStretch = imadjust(refImage,stretchlim(refImage));
tarStretch = imadjust(tarImage,stretchlim(tarImage));

%figure(2)
%figure, imshowpair(refStretch, tarStretch, "montage")
%title('Contrast stretched image comparison')

%Convert both images to grayScale
refGray = rgb2gray(refStretch);
tarGray = rgb2gray(tarStretch);

%figure(3)
%figure, imshowpair(refGray, tarGray, "montage")
%title('RGB to Gray Conversion')

%Perform Histogram Matching on target image
tarMatch = imhistmatch(tarGray, refGray);

%figure(4)
%figure, montage({tarGray, tarMatch})
%title('Image comparison after histogramMatching')

%-------------------Post Processing -> Target Image------------------------

%Convert Processed target image to binary
tarBW = imbinarize(tarMatch);
%figure(5)
%figure, imshow(tarBW)

%Remove noise from final Result
%define structuring element
se = strel('sphere',5);

%perform opening operation to remove Salt noise
tarOpen = imopen(tarBW,se);
%figure(6)
%figure, imshow(tarOpen,[]);

%Apply Mask on original image - Final Result
MaskedResult = imoverlay(tarImage, ~tarOpen, 'red');
%figure(7)
%figure, imshow(MaskedResult)

 % Save the masked result to the output directory
    [~, name, ~] = fileparts(imageFiles(i).name);
    outputFileName = fullfile(outputDir, strcat(name, '_MaskedResult.jpg'));
    imwrite(MaskedResult, outputFileName);
end



