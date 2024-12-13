function f = func5(x, n)
% Partial Perturbed Quadratic function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    % f = 0.01 * (x(1) + x(n))^2;
    % for i = 1:n
    %     f = f + i * x(i)^2;
    % end
    f = x(1)^2;
    for i = 1:n
        f = f + i * x(i)^2 + 0.01 * sum(x)^2;
    end
end