function f = func2(x, n)
% Raydan 1 function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = 0;
    for i = 1:n
        f = f + 0.1 * i * (exp(x(i)) - x(i));
    end
end
