function f = func1(x, n)
% Perturbed Quadratic function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    temp = zeros(1,2);
    for i = 1:n
        temp(1,1) = temp(1,1) + i * x(i)^2;
        temp(1,2) = temp(1,2) + 0.1 * x(i)^2;
    end
    f = sum(temp);
end
