function alpha = line_search(func, x, grad, n, sigma1, rho, alpha)
% Armijo型线性搜索
% func: 目标函数句柄
% x: 当前点
% grad: 当前点的梯度
% n: 输入向量长度
% sigma1: Armijo条件参数
% rho: 步长缩减因子
% alpha: 初始步长
% 返回值:
%   alpha: 确定的步长

    f = func(x, n); % 当前点的函数值
    d = -grad;      % 搜索方向（负梯度方向）

    while true
        % 计算更新点的函数值
        new_f = func(x + alpha * d, n);
        % 检查Armijo条件
        if new_f <= f + sigma1 * alpha * grad' * d
            break; % 满足条件，退出循环
        end
        % 缩小步长
        alpha = rho * alpha;
    end
end
