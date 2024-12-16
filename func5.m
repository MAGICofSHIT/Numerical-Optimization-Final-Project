function f = func5(x, n)
% Generalized Griewank function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    % f = x(1)^2;
    % for i = 1:n
    %     f = f + i * x(i)^2 + 0.01 * sum(x)^2;
    % end
    f1 = 1;
    f2 = 1;
    for i = 1:n
        f1 = f1 + 1/4000 * x(i)^2;
        f2 = f2 * cos(x(i) / sqrt(i));
    end
    f = f1 + f2;
end