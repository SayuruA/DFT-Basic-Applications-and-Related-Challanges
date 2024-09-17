function itpl_x = intpol(smpl_x, K)
% This function interpolates downsampled function smpl_x and produce itpl_x
% with K+1 times more samples.
% This is done by zero padding at the middle of the DFT 
    X = fft(smpl_x);
    N = length(X);
    N1 = (N+1)/2;% For odd N
    N2 = N/2;% For even N

    
    if rem(N, 2) == 0 % If even
        zpd_X = [X(1 : N2); X(N2 +1)/2; zeros(K*N -1,1); X(N2 +1)/2; X((N2 +2) : N)];
    else % If odd
        zpd_X = [X(1 : N1);zeros(K*N,1);X( (N1+1): N)];
    end
    % Take the inverse and scale 
    ifft_X = ifft(zpd_X);
    itpl_x = (K+1)*ifft_X;

end

    