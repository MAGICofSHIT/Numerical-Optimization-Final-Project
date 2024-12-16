clc; clear; close all;

%% 通用参数设置
tol = 1e-6; % 收敛精度
max_iter = 100000; % 最大迭代次数
lambda0 = 1e-5;

%% 初始点设置 
x0_1 = [0.5 0.5];
x0_2 = [1 1];
x0_3 = [1 1];
x0_4 = [1 1];
x0_5 = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5];

%% 函数测试以及结果打印
% Perturbed Quadratic function 测试
disp('测试 Perturbed Quadratic function (func1):');
n1 = length(x0_1); % 输入向量长度
[x_opt_1, f_val_1, iter_1, f_vals_1, x_traj_1] = AGD(@func1, x0_1, n1, tol, max_iter, lambda0);
disp(['最优解: ', num2str(x_opt_1)]);
disp(['目标函数最优值: ', num2str(f_val_1)]);
disp(['迭代次数: ', num2str(iter_1)]);
fprintf('\n');

% Raydan 1 function 测试
disp('测试 Raydan 1 function (func2):');
n2 = length(x0_2); % 输入向量长度
[x_opt_2, f_val_2, iter_2, f_vals_2, x_traj_2] = AGD(@func2, x0_2, n2, tol, max_iter, lambda0);
disp(['最优解: ', num2str(x_opt_2)]);
disp(['目标函数最优值: ', num2str(f_val_2)]);
disp(['迭代次数: ', num2str(iter_2)]);
fprintf('\n');

% Diagonal 8 function 测试
disp('测试 Diagonal 8 function (func3):');
n3 = length(x0_3); % 输入向量长度
[x_opt_3, f_val_3, iter_3, f_vals_3, x_traj_3] = AGD(@func3, x0_3, n3, tol, max_iter, lambda0);
disp(['最优解: ', num2str(x_opt_3)]);
disp(['目标函数最优值: ', num2str(f_val_3)]);
disp(['迭代次数: ', num2str(iter_3)]);
fprintf('\n');

% Quadratic QF1 function 测试
disp('测试 Quadratic QF1 function (func4):');
n4 = length(x0_4); % 输入向量长度
[x_opt_4, f_val_4, iter_4, f_vals_4, x_traj_4] = AGD(@func4, x0_4, n4, tol, max_iter, lambda0);
disp(['最优解: ', num2str(x_opt_4)]);
disp(['目标函数最优值: ', num2str(f_val_4)]);
disp(['迭代次数: ', num2str(iter_4)]);
fprintf('\n');

% Partial Perturbed Quadratic function 测试
disp('测试 Partial Perturbed Quadratic function (func5):');
n5 = length(x0_5); % 输入向量长度
[x_opt_5, f_val_5, iter_5, f_vals_5, x_traj_5] = AGD(@func5, x0_5, n5, tol, max_iter, lambda0);
disp(['最优解: ', num2str(x_opt_5)]);
disp(['目标函数最优值: ', num2str(f_val_5)]);
disp(['迭代次数: ', num2str(iter_5)]);
fprintf('\n');

%% 函数值-迭代次数曲线图绘制
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

% 绘制 Diagonal 8 function 函数值-迭代次数曲线
figure;
plot(0:iter_3, f_vals_3, '-o'); % 横坐标从 0 开始
xlim([0 iter_3]);
title('Diagonal 8 function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Quadratic QF1 function 函数值-迭代次数曲线
figure;
plot(0:iter_4, f_vals_4, '-o'); % 横坐标从 0 开始
xlim([0 iter_4]);
title('Quadratic QF1 function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

% 绘制 Partial Perturbed Quadratic function 函数值-迭代次数曲线
figure;
plot(0:iter_5, f_vals_5, '-o'); % 横坐标从 0 开始
xlim([0 iter_5]);
title('Partial Perturbed Quadratic function: 函数值迭代曲线图');
xlabel('迭代次数');
ylabel('函数值');
grid on;

%% 等高线路径迭代图绘制
% 绘制等高线路径迭代图 (Perturbed Quadratic function)
% figure;
% [x1_grid, y1_grid] = meshgrid(-1:0.01:1, -1:0.01:1); % 定义网格
% z1_grid = arrayfun(@(x1, y1) func1([x1, y1], n1), x1_grid, y1_grid); % 计算网格上的函数值
% contour(x1_grid, y1_grid, z1_grid, 50); % 绘制等高线
% hold on;
% scatter(x0_1(1), x0_1(2), 100, 'r', 'filled', 'DisplayName', '初始点'); % 初始点
% scatter(x_opt_1(1), x_opt_1(2), 100, 'g', 'filled', 'DisplayName', '最优点'); % 最优点
% plot(x_traj_1(:, 1), x_traj_1(:, 2), 'k-o', 'DisplayName', '路径'); % 迭代路径
% legend;
% title('Perturbed Quadratic function: 等高线路径迭代图');
% xlabel('x1'); ylabel('x2');
% grid on;
% 
% % 绘制等高线迭代图 (Raydan 1 function)
% figure;
% [x2_grid, y2_grid] = meshgrid(-2:0.01:2, -2:0.01:2); % 定义网格
% z2_grid = arrayfun(@(x2, y2) func2([x2, y2], n2), x2_grid, y2_grid); % 计算网格上的函数值
% contour(x2_grid, y2_grid, z2_grid, 50); % 绘制等高线
% hold on;
% scatter(x0_2(1), x0_2(2), 100, 'r', 'filled', 'DisplayName', '初始点'); % 初始点
% scatter(x_opt_2(1), x_opt_2(2), 100, 'g', 'filled', 'DisplayName', '最优点'); % 最优点
% plot(x_traj_2(:, 1), x_traj_2(:, 2), 'k-o', 'DisplayName', '路径'); % 迭代路径
% legend;
% title('Raydan 1 function: 等高线路径迭代图');
% xlabel('x1'); ylabel('x2');
% grid on;
% 
% % 绘制等高线迭代图 (Diagonal 8 function)
% figure;
% [x3_grid, y3_grid] = meshgrid(0:0.01:1.5, -0.5:0.01:1.5);
% z3_grid = arrayfun(@(x3, y3) func3([x3, y3], n3), x3_grid, y3_grid); % 计算网格上的函数值
% contour(x3_grid, y3_grid, z3_grid, 50); % 绘制等高线
% hold on;
% scatter(x0_3(1), x0_3(2), 100, 'r', 'filled', 'DisplayName', '初始点'); % 初始点
% scatter(x_opt_3(1), x_opt_3(2), 100, 'g', 'filled', 'DisplayName', '最优点'); % 最优点
% plot(x_traj_3(:, 1), x_traj_3(:, 2), 'k-o', 'DisplayName', '路径'); % 迭代路径
% legend;
% title('Diagonal 8 function: 等高线路径迭代图');
% xlabel('x1'); ylabel('x2');
% grid on;
% 
% % 绘制等高线迭代图 (Quadratic QF1 function)
% figure;
% [x4_grid, y4_grid] = meshgrid(-2:0.01:2, -1:0.01:2); % 定义网格
% z4_grid = arrayfun(@(x4, y4) func4([x4, y4], n4), x4_grid, y4_grid); % 计算网格上的函数值  
% contour(x4_grid, y4_grid, z4_grid, 50); % 绘制等高线
% hold on;
% scatter(x0_4(1), x0_4(2), 100, 'r', 'filled', 'DisplayName', '初始点'); % 初始点
% scatter(x_opt_4(1), x_opt_4(2), 100, 'g', 'filled', 'DisplayName', '最优点'); % 最优点
% plot(x_traj_4(:, 1), x_traj_4(:, 2), 'k-o', 'DisplayName', '路径'); % 迭代路径
% legend;
% title('Quadratic QF1 function: 等高线路径迭代图');
% xlabel('x1'); ylabel('x2');
% grid on;
% 
% % 绘制等高线迭代图 (Partial Perturbed Quadratic function)
% figure;
% [x5_grid, y5_grid] = meshgrid(-1:0.01:1, -1:0.01:1); % 定义网格
% z5_grid = arrayfun(@(x5, y5) func5([x5, y5], n5), x5_grid, y5_grid); % 计算网格上的函数值
% contour(x5_grid, y5_grid, z5_grid, 50); % 绘制等高线
% hold on;
% scatter(x0_5(1), x0_5(2), 100, 'r', 'filled', 'DisplayName', '初始点'); % 初始点
% scatter(x_opt_5(1), x_opt_5(2), 100, 'g', 'filled', 'DisplayName', '最优点'); % 最优点
% plot(x_traj_5(:, 1), x_traj_5(:, 2), 'k-o', 'DisplayName', '路径'); % 迭代路径
% legend;
% title('Partial Perturbed Quadratic function: 等高线路径迭代图');
% xlabel('x1'); ylabel('x2');
% grid on;