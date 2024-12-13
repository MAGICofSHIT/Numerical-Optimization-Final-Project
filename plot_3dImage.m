clc,clear,close all

% 定义函数的取值范围
x1_range = [-1, 1];
y1_range = [-1, 1];

x2_range = [-2, 2];
y2_range = [-2, 2];

x3_range = [0, 1.5];
y3_range = [-0.5, 1.5];

x4_range = [-2, 2];
y4_range = [-1, 2];

x5_range = [-1, 10];
y5_range = [-10, 2];

resolution = 100; % 分辨率

% 绘制 func1 的三维图像
figure;
plot_3d(@func1, x1_range, y1_range, resolution, 'Perturbed Quadratic function');

% 绘制 func2 的三维图像
figure;
plot_3d(@func2, x2_range, y2_range, resolution, 'Raydan 1 function');

% 绘制 func3 的三维图像
figure;
plot_3d(@func3, x3_range, y3_range, resolution, 'Diagonal 8 function');

% 绘制 func4 的三维图像
figure;
plot_3d(@func4, x4_range, y4_range, resolution, 'Quadratic QF1 function');

% 绘制 func3 的三维图像
figure;
plot_3d(@func5, x5_range, y5_range, resolution, 'Full Hessian FH2 function');

function plot_3d(func, x_range, y_range, resolution, title_str)
    % 生成网格点
    x = linspace(x_range(1), x_range(2), resolution);
    y = linspace(y_range(1), y_range(2), resolution);
    [X, Y] = meshgrid(x, y);
    
    % 计算函数值
    Z = arrayfun(@(x, y) func([x; y], 2), X, Y);
    
    % 绘制三维图像
    surf(X, Y, Z, 'EdgeColor', 'none');
    colormap(jet);
    colorbar;
    title(title_str);
    xlabel('x1'); ylabel('x2'); zlabel('f(x)');
    view(45, 30); % 设置视角
end