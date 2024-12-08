function [theta, history] = adai(L, grad, theta0, eta, beta1, beta2, beta0, epsilon, max_iter)
    % ADAI优化 使用Adai算法进行优化
    % 输入:
    % L - 损失函数句柄
    % grad - 梯度函数句柄
    % theta0 - 初始参数
    % eta - 学习率
    % beta1 - 动量参数
    % beta2 - 动量平方参数
    % beta0 - 惯性调整参数
    % epsilon - 防止过大惯性的小值
    % max_iter - 最大迭代次数
    % 输出:
    % theta - 最终参数
    % history - 损失历史记录

    theta = theta0;
    v = zeros(size(theta)); % 动量估计初始化
    m = zeros(size(theta)); % 动量初始化
    history = zeros(max_iter, 1); % 损失历史记录初始化

    for t = 1:max_iter
        g = grad(theta); % 计算梯度
        v = beta2 * v + (1 - beta2) * g.^2; % 更新动量估计
        v_hat = v / (1 - beta2^t); % 归一化动量估计
        bar_v = mean(v_hat); % 计算平均动量
        beta1_t = (1 - beta0 * bar_v * v_hat); % 动态调整惯性参数
        beta1_t = clip(beta1_t, 0, 1 - epsilon); % 使用clip函数
        m = beta1_t .* m + (1 - beta1_t) .* g; % 更新动量
        m_hat = m / (1 - beta1_t); % 归一化动量
        theta = theta - eta * m_hat; % 更新参数
        history(t) = L(theta); % 记录损失
    end
end

function y = clip(y, lower, upper)
    % CLIP 限制值在给定的上下界之间
    y(y < lower) = lower;
    y(y > upper) = upper;
end

clc,clear,close all

% 定义测试函数和梯度
theta0 = [1; 1; 1]; % 初始参数，增加到三个元素以便测试
eta = 0.01; % 学习率
beta1 = 0.9; % 动量参数
beta2 = 0.999; % 动量平方参数
beta0 = 0.1; % 惯性调整参数
epsilon = 0.001; % 防止过大惯性的小值
max_iter = 1000; % 最大迭代次数

% 测试函数：Rosenbrock函数的变体
L = @(theta) sum(100 * (theta(2:end) - theta(1:end-1).^2).^2 + (theta(1:end-1) - 1).^2);
grad = @(theta) [
    -400 * (theta(1)^2 - theta(2)) - 2 * (theta(1) - 1);
    [400 * (theta(1)^2 - theta(2)) + 200 * (theta(2) - 1), -200 * (theta(2)^2 - theta(3)) - 2 * (theta(2) - 1)];
    200 * (theta(2:end) - theta(1:end-1).^2) - 2 * (theta(1:end-1) - 1)
];

% 调用Adai优化函数
[theta_opt, history] = adai(L, grad, theta0, eta, beta1, beta2, beta0, epsilon, max_iter);

% 输出结果
disp('Optimized Parameters:');
disp(theta_opt);
disp('Final Loss:');
disp(L(theta_opt));
plot(1:max_iter, history);
title('Loss History');
xlabel('Iteration');
ylabel('Loss');