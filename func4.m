function f = func4(x, n)
% Diagonal 1 function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n
        f = f + exp(x(i)) - i * x(i);
    end
end