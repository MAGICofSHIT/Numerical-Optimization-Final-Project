clc,clear,close all
% 定义目标函数
f = @(x) 100 * (x(2) - x(1)^2)^2 + (x(1) - 1)^2;  % 目标函数 f(x) = x1^2 + x2^2

% 设置初始值和收敛容忍度
x0 = [10; 10];       % 初始解
tol = 1e-6;        % 收敛阈值

% 调用最速下降法
[x_min, f_min, iter] = steepest_descent(f, x0, tol);

% 输出结果
fprintf('最优解: x = [%f, %f]\n', x_min(1), x_min(2));
fprintf('目标函数值: f(x) = %f\n', f_min);
fprintf('迭代次数: %d\n', iter);
