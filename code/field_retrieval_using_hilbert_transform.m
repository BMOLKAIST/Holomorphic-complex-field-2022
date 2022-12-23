% This code shows the field retrieval results of the two methods (Hilbert microscopy and KK holography) according to deviations from the required conditions

clear; close all; clc

%% set of the total field

temp = double(imread('cameraman.tif'));
temp = fftshift(fft2(ifftshift(temp)));
temp = crop_center(temp, [1, 1]*200);
phase0 = fftshift(ifft2(ifftshift(temp)));
phase = (abs(phase0) ./ max(abs(phase0(:))) - 0.5)*pi/4;
imagesc(phase), colormap("turbo"), axis image

deviation = 0; % number of deviated pixels from k <= -C
temp = exp(1i*phase);
temp = fftshift(fft2(ifftshift(temp)));
temp = circshift(~make_ellipse(50, 50, size(temp, 1), size(temp, 1)), [0, 50 - deviation]) .* temp;
temp(end/2 + 1, end/2 + 1) = 0;
imagesc(log10(abs(temp))), colormap("jet"), axis image
scattered_field = fftshift(ifft2(ifftshift(temp)));
imagesc(abs(scattered_field)), colormap("parula"), axis image

a = 1; % a is (maximum of the amplitude of S) / (amplitude of R); a = 1 for R > S
unscattered_field = max(abs(scattered_field(:)))/a;
imagesc(abs(unscattered_field)), colormap("parula"), axis image
total_field = scattered_field + unscattered_field; % ground truth
imagesc(angle(total_field), [-0.4, 0.4]), colormap("turbo"), axis image

%% phase retrieval using Hilbert microscopy

interferogram = abs(total_field).^2;
F_interferogram = fftshift(fft2(ifftshift(interferogram)));
imagesc(log10(abs(F_interferogram))), colormap("jet"), axis image
F_interferogram(end/2 + 1, end/2 + 1) = 0;
interferogram = fftshift(ifft2(ifftshift(F_interferogram)));
imagesc(interferogram), colormap("gray"), axis image

Hilbert_real_part = interferogram/2;
Hilbert_imaginary_part = imag(hilbert(real(Hilbert_real_part).')).';
recon_field0 = Hilbert_real_part + 1i*Hilbert_imaginary_part;
imagesc(log10(abs(fftshift(fft2(ifftshift(recon_field0)))))), colormap("jet"), axis image

temp = fftshift(fft2(ifftshift(recon_field0))) .* circshift(~make_ellipse(50, 50, size(scattered_field, 1), size(scattered_field, 1)), [0, 50]);
recon_field = fftshift(ifft2(ifftshift(temp))); % recon_field is conjugate(R)*S
imagesc(angle(recon_field ./ conj(unscattered_field) + unscattered_field), [-0.4, 0.4]), colormap("turbo"), axis image % R+S
corr_c(exp(1i*angle(recon_field ./ conj(unscattered_field) + unscattered_field)), exp(1i*angle(total_field))) % correlation calculation of two arrays

%% phase retrieval using KK holography

interferogram0 = abs(total_field).^2;
temp = fftshift(fft2(ifftshift(interferogram0)));
temp = mpad(temp, [size(temp, 1), size(temp, 2)*2]);
imagesc(log10(abs(temp))), colormap("jet"), axis image
interferogram = abs(fftshift(ifft2(ifftshift(temp))));
imagesc(interferogram), colormap("gray"), axis image

kk_real_part = log(interferogram)/2;
kk_imaginary_part = imag(hilbert(real(kk_real_part).')).';
recon_field0 = sqrt(interferogram) .* exp(1i .* kk_imaginary_part);

Frecon_field0 = fftshift(fft2(ifftshift(recon_field0)));
imagesc(log10(abs(Frecon_field0))), colormap jet, axis image
Frecon_field0 = circshift(Frecon_field0(:, end/2 + 1:end), [0, size(interferogram, 2)/4]);
Frecon_field0 = Frecon_field0 .* circshift(~make_ellipse(50, 50, size(interferogram, 1), size(interferogram, 2)/2), [0, 50]);
imagesc(log10(abs(Frecon_field0))), colormap jet, axis image
recon_field = fftshift(ifft2(ifftshift(Frecon_field0))); % recon_field is R+S
imagesc(angle(recon_field), [-0.4, 0.4]), colormap("turbo"), axis image
corr_c(exp(1i .* angle(total_field)), exp(1i .* angle(recon_field)))
