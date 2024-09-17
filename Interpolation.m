load handel
N =20000;
x = y(1:N);
x2 = x(1:2:N);
x3 = x(1:3:N);
x4 = x(1:4:N);

X2 = fft(x2);
X2_z_pdd = zeros(2*length(X2),1);
X2_z_pdd(1:5000) = X2(1:5000);
X2_z_pdd(10001:15000) = X2(5001:10000);

int_x2 = ifft(X2_z_pdd);

diff = x - int_x2;
 n = norm(diff);
