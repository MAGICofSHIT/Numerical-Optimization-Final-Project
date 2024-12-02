function  [y,x] =function3(n)
x=sym('x%d',[n 1]);%设置变量x为n行1列的列向量
y=0;%设置函数初始值为0
for i=1:n
     y=y+(x(i)^2-10*cos(2*pi*x(i))+10);%for循环实现函数的定义
end
return ;