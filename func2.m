function f = func2(x, n)
% Generalized Griewank Function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    % 计算函数值
    sum_sqr = sum(x.^2); % x_i^2 的和
    prod_cos = prod(cos(x ./ sqrt(1:n))); % cos(x_i / sqrt(i)) 的乘积
    f = sum_sqr / 4000 - prod_cos + 1;
end
