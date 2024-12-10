function grad = num_grad(func, x, n)
% 中心差分法计算梯度
% func: 目标函数句柄
% x: 当前点
% n: 输入向量长度
% 返回值:
%   grad: 梯度向量

    h = 1e-10; % 差分步长
    grad = zeros(size(x)); % 初始化梯度向量

    for i = 1:n
        % 构造单位基向量
        e = zeros(size(x));
        e(i) = h;
        % 中心差分公式计算梯度分量
        grad(i) = (func(x + e, n) - func(x - e, n)) / (2 * h);
    end
end