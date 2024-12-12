function [x_opt, f_val, iter, f_vals, x_traj] = AGD(func, x0, n, tol, max_iter, lambda0)
% 自适应梯度下降算法
% func: 目标函数句柄
% x0: 初始点
% n: 输入向量长度
% tol: 收敛精度
% max_iter: 最大迭代次数
% 返回值:
%   x_opt: 最优解
%   f_val: 最优解对应的函数值
%   iter: 迭代次数
%   f_vals: 每次迭代的函数值
%   x_traj: 参数的轨迹

    % 初始化变量
    x_prev = x0; % 前一迭代点
    x_curr = x0 - lambda0 * num_grad(func, x0, n); % 当前迭代点
    theta_prev = Inf; % 辅助变量初始化
    lambda_prev = lambda0; % 初始学习率
    f_vals = [func(x0, n)]; % 记录函数值
    x_traj = x0; % 记录路径

    for k = 2:max_iter
        % 计算梯度
        grad_prev = num_grad(func, x_prev, n);
        grad_curr = num_grad(func, x_curr, n);

        % 更新学习率
        numerator = norm(x_curr - x_prev);
        denominator = 2 * norm(grad_curr - grad_prev);
        lambda_curr = min(sqrt(1 + theta_prev * lambda_prev), numerator / denominator);

        % 更新辅助变量
        theta_curr = lambda_curr / lambda_prev;

        % 更新点位置
        x_next = x_curr - lambda_curr * grad_curr;

        % 记录函数值和路径
        f_vals = [f_vals; func(x_next, n)];
        x_traj = [x_traj; x_next];

        % 检查收敛条件
        if norm(grad_curr) < tol
            break;
        end

        % 更新变量
        x_prev = x_curr;
        x_curr = x_next;
        lambda_prev = lambda_curr;
        theta_prev = theta_curr;
    end

    x_opt = x_curr; % 返回最优点
    iter = k; % 返回实际迭代次数
    f_val = func(x_curr, n); % 返回最优函数值
end