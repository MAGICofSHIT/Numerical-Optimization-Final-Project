function [x_opt, f_val, iter, f_vals, x_traj] = Adam(func, x0, n, tol, max_iter, alpha, beta1, beta2, epsilon)
% Adam算法实现
% 输入：
%   func: 目标函数句柄
%   x0: 初始点
%   n: 输入向量维度
%   tol: 收敛阈值
%   max_iter: 最大迭代次数
%   alpha: 学习率
%   beta1: 一阶动量衰减系数
%   beta2: 二阶动量衰减系数
%   epsilon: 防止除零的小值
% 输出：
%   x_opt: 最优点
%   f_val: 最优值
%   iter: 迭代次数
%   f_vals: 每次迭代的函数值
%   x_traj: 参数的轨迹

    % 初始化变量
    m = zeros(1, n); % 一阶动量初始化
    v = zeros(1, n); % 二阶动量初始化
    x = x0; % 当前参数
    t = 0; % 迭代计数
    f_vals = []; % 记录函数值
    x_traj = x; % 记录轨迹
    
    while t < max_iter
        t = t + 1; % 更新迭代计数
        g = num_grad(func, x, n); % 使用中心差分法计算梯度
        m = beta1 * m + (1 - beta1) * g; % 更新一阶动量
        v = beta2 * v + (1 - beta2) * (g.^2); % 更新二阶动量
        m_hat = m / (1 - beta1^t); % 偏差修正的一阶动量
        v_hat = v / (1 - beta2^t); % 偏差修正的二阶动量
        
        % 更新参数
        x = x - alpha * m_hat ./ (sqrt(v_hat) + epsilon);
        x_traj = [x_traj; x]; % 保存轨迹
        f_vals = [f_vals; func(x, n)]; % 保存函数值
        
        % 检查收敛条件
        if norm(g) < tol
            break;
        end
    end
    
    % 输出最优值及轨迹
    x_opt = x;
    f_val = func(x, n);
    iter = t;
end
