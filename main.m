clc; clear; close all;

%% 通用参数设置
tol = 1e-6; % 收敛精度
max_iter = 100000; % 最大迭代次数
sigma1 = 0.1; % Armijo条件参数
rho = 0.5; % 步长缩减因子
alpha_init = 1.0; % 初始步长

%% 函数测试以及结果打印
% Generalized Schaffer Function 测试
disp('测试 Generalized Schaffer Function (func1):');
n1 = 2; % 输入向量长度
x0_1 = [0.5, -0.5]; % 初始点
[x_opt_1, f_val_1, iter_1, f_vals_1] = steepest_descent(@func1, x0_1, n1, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_1)]);
disp(['目标函数最优值: ', num2str(f_val_1)]);
disp(['迭代次数: ', num2str(iter_1)]);
fprintf('\n');

% Generalized Griewank Function 测试
disp('测试 Generalized Griewank Function (func2):');
n2 = 2; % 输入向量长度
x0_2 = [0.5, -0.5]; % 初始点
[x_opt_2, f_val_2, iter_2, f_vals_2] = steepest_descent(@func2, x0_2, n2, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_2)]);
disp(['目标函数最优值: ', num2str(f_val_2)]);
disp(['迭代次数: ', num2str(iter_2)]);
fprintf('\n');

% Generalized Rosenbrock Function 测试
disp('测试 Generalized Rosenbrock Function (func3):');
n3 = 2; % 输入向量长度
x0_3 = [0.5, -0.5]; % 初始点
[x_opt_3, f_val_3, iter_3, f_vals_3] = steepest_descent(@func3, x0_3, n3, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_3)]);
disp(['目标函数最优值: ', num2str(f_val_3)]);
disp(['迭代次数: ', num2str(iter_3)]);
fprintf('\n');

%% 图像绘制
% 绘制 Schaffer 函数值-迭代次数曲线
figure;
plot(0:length(f_vals_1)-1, f_vals_1, '-o'); % 横坐标从 0 开始
title('Generalized Schaffer Function: Function Value vs Iterations');
xlabel('Iterations');
ylabel('Function Value');
grid on;

% 绘制 Griewank 函数值-迭代次数曲线
figure;
plot(0:length(f_vals_2)-1, f_vals_2, '-o'); % 横坐标从 0 开始
title('Generalized Griewank Function: Function Value vs Iterations');
xlabel('Iterations');
ylabel('Function Value');
grid on;

% 绘制 Rosenbrock 函数值-迭代次数曲线
figure;
plot(0:length(f_vals_3)-1, f_vals_3, '-o'); % 横坐标从 0 开始
title('Generalized Rosenbrock Function: Function Value vs Iterations');
xlabel('Iterations');
ylabel('Function Value');
grid on;