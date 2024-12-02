function grad = num_grad(f, x)
    % 数值梯度计算
    % 使用中心差分法计算梯度
    
    epsilon = 1e-6;  % 小的扰动值
    grad = zeros(size(x));  % 初始化梯度
    
    for i = 1:length(x)
        x1 = x;
        x2 = x;
        x1(i) = x1(i) + epsilon;
        x2(i) = x2(i) - epsilon;
        grad(i) = (f(x1) - f(x2)) / (2 * epsilon);  % 中心差分
    end
end