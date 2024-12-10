function [x, f_val, iter, f_vals, x_traj] = steepest_descent(func, x0, n, tol, max_iter, sigma1, rho, alpha_init)
% 最速下降法求解无约束优化问题
% func: 目标函数句柄
% x0: 初始点
% n: 输入向量长度
% tol: 收敛精度
% max_iter: 最大迭代次数
% sigma1: Armijo条件参数
% rho: 步长缩减因子
% alpha_init: 初始步长
% 返回值:
%   x: 最优解
%   f_val: 最优解对应的函数值
%   iter: 迭代次数
%   f_vals: 每次迭代的函数值
%   x_traj: 参数的轨迹

    x = x0;          % 初始化变量
    iter = 0;        % 初始化迭代计数器
    f_vals = [];     % 用于存储每次迭代的函数值
    x_traj = x;      % 记录轨迹

    while iter < max_iter
        grad = num_grad(func, x, n); % 使用中心差分法计算梯度
        if norm(grad) < tol     % 如果梯度的范数小于阈值，停止迭代
            break;
        end
        % 使用Armijo型线性搜索确定步长
        alpha = line_search(func, x, grad, n, sigma1, rho, alpha_init);
        % 更新变量
        x = x - alpha * grad;   % 按负梯度方向更新变量
        f_vals = [f_vals, func(x, n)];   % 记录当前函数值
        x_traj = [x_traj; x];   % 保存轨迹
        iter = iter + 1;        % 更新迭代次数
    end

    f_val = func(x, n);         % 计算最优解对应的函数值
end