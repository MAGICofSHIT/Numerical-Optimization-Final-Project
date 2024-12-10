function f = func3(x, n)
% Generalized Rosenbrock Function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n-1
        f = f + 100 * (x(i+1) - x(i)^2)^2 + (x(i) - 1)^2;
    end
end