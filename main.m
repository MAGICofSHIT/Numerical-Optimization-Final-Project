clc; clear; close all;

%% 通用参数设置
tol = 1e-6; % 收敛精度
max_iter = 10000000000; % 最大迭代次数
sigma1 = 0.1; % Armijo条件参数
rho = 0.5; % 步长缩减因子
alpha_init = 1.0; % 初始步长

%% 函数测试以及结果打印
% Perturbed Quadratic function 测试
disp('测试 Perturbed Quadratic function (func1):');
x0_1 = [0.5, 0.5]; % 初始点
n1 = length(x0_1); % 输入向量长度
[x_opt_1, f_val_1, iter_1, f_vals_1] = steepest_descent(@func1, x0_1, n1, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_1)]);
disp(['目标函数最优值: ', num2str(f_val_1)]);
disp(['迭代次数: ', num2str(iter_1)]);
fprintf('\n');

% Raydan 1 function 测试
disp('测试 Raydan 1 function (func2):');
x0_2 = [1, 1]; % 初始点
n2 = length(x0_2); % 输入向量长度
[x_opt_2, f_val_2, iter_2, f_vals_2] = steepest_descent(@func2, x0_2, n2, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_2)]);
disp(['目标函数最优值: ', num2str(f_val_2)]);
disp(['迭代次数: ', num2str(iter_2)]);
fprintf('\n');

% Generalized Rosenbrock Function 测试
disp('测试 Generalized Rosenbrock Function (func3):');
x0_3 = [-1.2, 1]; % 初始点
n3 = length(x0_3); % 输入向量长度
[x_opt_3, f_val_3, iter_3, f_vals_3] = steepest_descent(@func3, x0_3, n3, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_3)]);
disp(['目标函数最优值: ', num2str(f_val_3)]);
disp(['迭代次数: ', num2str(iter_3)]);
fprintf('\n');

% Hager Function 测试
disp('测试 Hager Function (func4):');
x0_4 = [1, 1]; % 初始点
n4 = length(x0_4); % 输入向量长度
[x_opt_4, f_val_4, iter_4, f_vals_4] = steepest_descent(@func4, x0_4, n4, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_4)]);
disp(['目标函数最优值: ', num2str(f_val_4)]);
disp(['迭代次数: ', num2str(iter_4)]);
fprintf('\n');

% Full Hessian FH2 function 测试
disp('测试 Full Hessian FH2 function (func5):');
x0_5 = [1, 1]; % 初始点
n5 = length(x0_5); % 输入向量长度
[x_opt_5, f_val_5, iter_5, f_vals_5] = steepest_descent(@func5, x0_5, n5, tol, max_iter, sigma1, rho, alpha_init);
disp(['最优解: ', num2str(x_opt_5)]);
disp(['目标函数最优值: ', num2str(f_val_5)]);
disp(['迭代次数: ', num2str(iter_5)]);
fprintf('\n');

%% 图像绘制
% 绘制 Perturbed Quadratic function 函数值-迭代次数曲线
figure;
plot(0:iter_1, f_vals_1, '-o'); % 横坐标从 0 开始
xlim([0 iter_1]);
title('Perturbed Quadratic function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Raydan 1 function 函数值-迭代次数曲线
figure;
plot(0:iter_2, f_vals_2, '-o'); % 横坐标从 0 开始
xlim([0 iter_2]);
title('Raydan 1 function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Generalized Rosenbrock Function 函数值-迭代次数曲线
figure;
plot(0:iter_3, f_vals_3, '-o'); % 横坐标从 0 开始
xlim([0 iter_3]);
title('Generalized Rosenbrock Function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Hager Function 函数值-迭代次数曲线
figure;
plot(0:iter_4, f_vals_4, '-o'); % 横坐标从 0 开始
xlim([0 iter_4]);
title('Hager Function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Full Hessian FH2 function 函数值-迭代次数曲线
figure;
plot(0:iter_5, f_vals_5, '-o'); % 横坐标从 0 开始
xlim([0 iter_5]);
title('Quadratic QF1 function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;