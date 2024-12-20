function f = func4(x, n)
% Quadratic QF1 function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n
        f = f + 0.5 * (i * x(i)^2 - x(n));
    end
end