function [val, time] = RK(A, xe, kmax)
    [m, ~] = size(A);
    b = A * xe;
    x = zeros(size(xe));
    Ar = size(m, 1);

    for i = 1:m
        Ar(i) = norm(A(i, :))^2;
    end

    AF = norm(A, 'fro')^2;
    alphabet = 1:m;
    val = size(kmax, 1);
    time = size(kmax, 1);
    ts = tic;

    for iter = 1:kmax
        rk = b - A * x;
        prob = Ar ./ AF;
        ik = randsrc(1, 1, [alphabet; prob]);
        x = x + (rk(ik) / Ar(ik)) * A(ik, :).';
        val(iter) = norm(x - xe)^2 / norm(xe)^2;
        time(iter) = toc(ts);
    end

end
