function f = func3(x, n)
% Diagonal 8 function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n
        f = f + x(i) * exp(x(i)) - 2 * x(i) - x(i)^2;
    end
end