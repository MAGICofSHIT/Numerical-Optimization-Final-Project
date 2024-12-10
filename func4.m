function f = func4(x, n)
% Hager Function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n-1
        f = f + exp(x(i)) - sqrt(i) * x(i);
    end
end