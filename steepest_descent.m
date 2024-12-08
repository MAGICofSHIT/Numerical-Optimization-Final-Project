function [x_min, f_min, iter] = steepest_descent(f, x0, tol)
    % 最速下降法
    % 输入：
    %   f        - 目标函数的句柄，形式如 f(x)
    %   x0       - 初始点
    %   tol      - 收敛阈值（梯度的范数小于 tol 时停止）
    %
    % 输出：
    %   x_min    - 最优解
    %   f_min    - 最优解对应的目标函数值
    %   iter     - 迭代次数
    
    % 初始化
    x = x0;        % 当前解
    iter = 0;      % 迭代次数
    
    while true
        iter = iter + 1;
        
        % 计算梯度
        grad = num_grad(f, x);
        
        % 计算步长（采用线性搜索找到最优步长）
        alpha = linear_search(f, x, grad);
        
        % 更新解
        x = x - alpha * grad;
        
        % 计算目标函数值
        f_val = f(x);
        
        % 检查收敛条件（梯度的范数小于 tol）
        if norm(grad) < tol
            break;
        end
    end
    
    % 最优解和目标函数值
    x_min = x;
    f_min = f_val;
end