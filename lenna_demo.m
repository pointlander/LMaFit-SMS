clear;

function [R, S] = split(block_size, image)
	SIZE = 512;
	opts.tol = 1e-3;
	beta = 1:10;
	R = zeros(SIZE, SIZE);
	S = zeros(SIZE, SIZE);
	for i = 0:SIZE/block_size - 1
		for j = 0:SIZE/block_size - 1
			il = i * block_size + 1;
			iu = (i + 1) * block_size;
			jl = j * block_size + 1;
			ju = (j + 1) * block_size;
			[X, Y, Z, out] = lmafit_sms_v1(image(il:iu, jl:ju), 16, opts, beta);
			R(il:iu, jl:ju) = X*Y;
			S(il:iu, jl:ju) = Z;
		end
	end
end

image = double(imread('lenna.png')) / 256;
image = mean(image, 3);
[R1, S1] = split(8, image);
