% This code shows the field retrieval results via KK holography with the experimental data

clear; close all; clc

%% measurement [1]

save_name = 'bead intensity_1.5868 [1].tif'; % load the data for the measurement [1] of the bead immersed in the medium of a specific refractive index
intensity0 = double(imread(save_name));

F_intensity = fftshift(fft2(ifftshift(intensity0)));
F_intensity = pad_center(F_intensity, size(F_intensity)*2);
intensity = fftshift(ifft2(ifftshift(F_intensity)));

real_part = log(intensity)/2;
signum_func = zeros(size(intensity));
signum_func(:, 1:end/2) = -1;
signum_func(:, end/2 + 1) = 0;
signum_func(:, end/2 + 2:end) = 1;

temp = fftshift(fft2(ifftshift(real_part)));
temp = -1i*signum_func .* temp;
imag_part = real(fftshift(ifft2(ifftshift(temp))));

kk_field0 = sqrt(intensity) .* exp(1i .* imag_part);
F_kk_field0 = fftshift(fft2(ifftshift(kk_field0)));
F_kk_field0 = crop_center(F_kk_field0, size(F_kk_field0)/2);
imagesc(log10(abs(F_kk_field0))), colormap("jet"), axis image
kk_field = fftshift(ifft2(ifftshift(F_kk_field0)));
imagesc(angle(kk_field), [-0.6, 1]), colormap("turbo"), axis image

%% measurement [2]

save_name = 'bead intensity_1.5868 [2].tif'; % load the data for the measurement [2] of the bead immersed in the medium of a specific refractive index
intensity0 = double(imread(save_name));

F_intensity = fftshift(fft2(ifftshift(intensity0)));
F_intensity = pad_center(F_intensity, size(F_intensity)*2);
intensity = fftshift(ifft2(ifftshift(F_intensity)));

real_part = log(intensity)/2;
signum_func = zeros(size(intensity));
signum_func(1:end/2, :) = -1;
signum_func(end/2 + 1, :) = 0;
signum_func(end/2 + 2:end, :) = 1;

temp = fftshift(fft2(ifftshift(real_part)));
temp = -1i*signum_func .* temp;
imag_part = real(fftshift(ifft2(ifftshift(temp))));

kk_field0 = sqrt(intensity) .* exp(1i .* imag_part);
F_kk_field0 = fftshift(fft2(ifftshift(kk_field0)));
F_kk_field0 = crop_center(F_kk_field0, size(F_kk_field0)/2);
imagesc(log10(abs(F_kk_field0))), colormap("jet"), axis image
kk_field = fftshift(ifft2(ifftshift(F_kk_field0)));
imagesc(angle(kk_field), [-0.6, 1]), colormap("turbo"), axis image

%% measurement [3]

save_name = 'bead intensity_1.5868 [3].tif'; % load the data for the measurement [3] of the bead immersed in the medium of a specific refractive index
intensity0 = double(imread(save_name));

F_intensity = fftshift(fft2(ifftshift(intensity0)));
F_intensity = pad_center(F_intensity, size(F_intensity)*2);
intensity = fftshift(ifft2(ifftshift(F_intensity)));

real_part = log(intensity)/2;
signum_func = zeros(size(intensity));
signum_func(:, 1:end/2) = 1;
signum_func(:, end/2 + 1) = 0;
signum_func(:, end/2 + 2:end) = -1;

temp = fftshift(fft2(ifftshift(real_part)));
temp = -1i*signum_func .* temp;
imag_part = real(fftshift(ifft2(ifftshift(temp))));

kk_field0 = sqrt(intensity) .* exp(1i .* imag_part);
F_kk_field0 = fftshift(fft2(ifftshift(kk_field0)));
F_kk_field0 = crop_center(F_kk_field0, size(F_kk_field0)/2);
imagesc(log10(abs(F_kk_field0))), colormap("jet"), axis image
kk_field = fftshift(ifft2(ifftshift(F_kk_field0)));
imagesc(angle(kk_field), [-0.6, 1]), colormap("turbo"), axis image

%% measurement [4]

save_name = 'bead intensity_1.5868 [4].tif'; % load the data for the measurement [4] of the bead immersed in the medium of a specific refractive index
intensity0 = double(imread(save_name));

F_intensity = fftshift(fft2(ifftshift(intensity0)));
F_intensity = pad_center(F_intensity, size(F_intensity)*2);
intensity = fftshift(ifft2(ifftshift(F_intensity)));

real_part = log(intensity)/2;
signum_func = zeros(size(intensity));
signum_func(1:end/2, :) = 1;
signum_func(end/2 + 1, :) = 0;
signum_func(end/2 + 2:end, :) = -1;

temp = fftshift(fft2(ifftshift(real_part)));
temp = -1i*signum_func .* temp;
imag_part = real(fftshift(ifft2(ifftshift(temp))));

kk_field0 = sqrt(intensity) .* exp(1i .* imag_part);
F_kk_field0 = fftshift(fft2(ifftshift(kk_field0)));
F_kk_field0 = crop_center(F_kk_field0, size(F_kk_field0)/2);
imagesc(log10(abs(F_kk_field0))), colormap("jet"), axis image
kk_field = fftshift(ifft2(ifftshift(F_kk_field0)));
imagesc(angle(kk_field), [-0.6, 1]), colormap("turbo"), axis image
