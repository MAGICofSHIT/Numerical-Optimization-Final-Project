function  [y,x] =function2(n)
x=sym('x%d',[n 1]);%设置变量x为n行1列的列向量
y=0;%设置函数初始值为0
y1=0;
for i=1:n
     y1=y1+x(i);
     y2=y2+i*x(i)^2;
     y=y2+0.01*y1^2;%for循环实现函数的定义
end
return ;