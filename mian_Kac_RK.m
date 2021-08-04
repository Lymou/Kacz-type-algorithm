clear,clc;
m = 1000; n = 50;
A = randn(m, n);
xe = randn(n, 1);
kmax = 8000;
[val_K, time_K] = Kacz(A, xe, kmax);
subplot(221)
semilogy(val_K, 'r-', 'LineWidth', 2)
grid on
xlabel('IT')
ylabel('RSE')
legend('Kaczmarz')
subplot(222)
semilogy(time_K, val_K, 'b-', 'LineWidth', 2)
grid on
xlabel('CPU(s)')
ylabel('RSE')
legend('Kaczmarz')

[val_rk, time_rk] = RK(A, xe, kmax);
subplot(223)
semilogy(val_rk, 'r-', 'LineWidth', 2)
grid on
xlabel('IT')
ylabel('RSE')
legend('RK')
subplot(224)
semilogy(time_rk, val_rk, 'b-', 'LineWidth', 2)
grid on
xlabel('CPU(s)')
ylabel('RSE')
legend('RK')
