function alpha = linear_search(f, x, grad)
    % 线性搜索，用于找到合适的步长 alpha
    % 使用回溯线搜索法
    
    alpha = 1; % 初始步长
    rho = 0.5; % 步长缩小因子
    c = 1e-4;  % Wolfe条件的常数
    
    % 计算当前点的目标函数值
    f_x = f(x);
    
    % 回溯线搜索
    while f(x - alpha * grad) > f_x - c * alpha * norm(grad)^2
        alpha = rho * alpha; % 缩小步长
    end
end
