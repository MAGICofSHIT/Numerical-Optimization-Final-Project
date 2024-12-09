function f = func1(x, n)
% Generalized Schaffer Function
% x: 输入向量
% n: 向量长度
% 返回值:
%   f: 标量函数值

    % 计算函数值
    sum_sqr = sum(x.^2); % x_i^2 的和
    f = 0.5 + (sin(sqrt(sum_sqr)).^2 - 0.5) / (1 + 0.001 * sum_sqr).^2;
end
