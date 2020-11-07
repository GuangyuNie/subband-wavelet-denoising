clc;
close all;
% get noisy image
I1 = imread('lena512noisy.bmp');
I0 = imread('lena512.bmp');
I1 = mat2gray(I1); % change from uint8 to double
[rows,columns] = size(I1);
%get filter value
% Forward filtering
h = [ 0.026749, -0.016864, -0.078223, 0.266864, 0.602949, ... 
          0.266864, -0.078223, -0.016864, 0.026749]; 
g = [0, -0.045636, 0.028772, 0.295636, -0.557543, 0.295636, ...
          0.028772, -0.045636, 0];

% Reconstruction filtering
h_tilda = [0, -0.045636, -0.028772, 0.295636, 0.557543, ...
                0.295636, -0.028772, -0.045636, 0];
      
g_tilda = -[0.026749, 0.016864, -0.078223, -0.266864,  0.602949, ...
                -0.266864, -0.078223, 0.016864, 0.026749];
                       
for i = 1:size(h)
    h(i) = h(i)*sqrt(2);
    g(i) = g(i)*sqrt(2);
    h_tilda(i) = h_tilda(i)*sqrt(2);
    g_tilda(i) = g_tilda(i)*sqrt(2);
end

%%%%%%%%%%%%%% get 16 band dyadic %%%%%%%%%%%%%
Y = dyadic16band(I1,h,g);
figure()
imshow(Y)

% denoise & reconstruct

% 1. get rid of 1 highest freq
% Y(17:32,17:32) = 0;
Y(257:512,257:512) = 0;
denoised_1 = dyadic_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_1)
title('16 band dyadic reconstruction with 1 highest frequency removed')
figure()
fftOriginal = fft2(denoised_1);
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 16 band dyadic reconstruction with 1 highest frequency removed')

% 2. get rid of 3 highest freq
Y(257:512,1:512) = 0;
Y(1:512,257:512) = 0;
% Y(1:16,17:32) = 0;
% Y(17:32,1:16) = 0;

% Y(33:64,33:64) = 0;
% Y(65:128,65:128) = 0;

denoised_3 = dyadic_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_3)
title('16 band dyadic reconstruction with 3 highest frequency removed')
figure()
fftOriginal = fft2(denoised_3);
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 16 band dyadic reconstruction with 3 highest frequency removed')
% 3. get rid of 6 highest freq
% Y(17:32,33:64) = 0;
% Y(33:64,17:32) = 0;
% Y(33:64,33:64) = 0;
% Y(129:256,129:256) = 0;
% Y(257:512,257:512) = 0;
% Y(1:16,17:32) = 0;
Y(129:512,1:512) = 0;
Y(1:512,129:512) = 0;

denoised_6 = dyadic_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_6)
title('16 band dyadic reconstruction with 6 highest frequency removed')
fftOriginal = fft2(denoised_6);
figure()
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 16 band dyadic reconstruction with 6 highest frequency removed')

%%%%%%%%% get 22 band modified pyramid %%%%%%%%%%
Y = pyramid22band(I1,h,g);
figure()
imshow(Y)

% denoise & reconstruct

% 1. get rid of 3 highest freq
Y(257:512,385:512) = 0;
Y(385:512,257:512) = 0;

denoised_3 = pyramid_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_3)
title('22 band pyramid reconstruction with 3 highest frequency removed')
fftOriginal = fft2(denoised_3);
figure()
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 22 band pyramid reconstruction with 3 highest frequency removed')

% 2. get rid of 10 highest freq
Y(257:512,257:512) = 0;
Y(1:256,385:512) = 0
Y(385:512,1:256) = 0
Y(129:256,257:385) = 0
Y(257:385,129:256) = 0

denoised_10 = pyramid_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_10)
title('22 band pyramid reconstruction with 10 highest frequency removed')
fftOriginal = fft2(denoised_10);
figure()
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 22 band pyramid reconstruction with 10 highest frequency removed')

% 2. get rid of 15 highest freq

Y(1:512,65:512) = 0
Y(65:512,1:512) = 0

denoised_15 = pyramid_reconstruct(Y,h_tilda,g_tilda)
figure()
imshow(denoised_15)
title('22 band pyramid reconstruction with 15 highest frequency removed')
fftOriginal = fft2(denoised_15);
figure()
imshow(log(abs(fftOriginal)),[]);
title('DFT magnitude spectrum for 22 band pyramid reconstruction with 15 highest frequency removed')
