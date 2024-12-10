function f = func5(x, n)
% Full Hessian FH2 function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    f = (x(1) - 5)^2;
    for i = 2:n
        f = f + (sum(x(1:i)) - 1)^2;
    end
end