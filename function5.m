function  [y,x] =function5(n)
x=sym('x%d',[n 1]);%设置变量x为n行1列的列向量
y1=0;
y=0;%设置函数初始值为0
for i=1:n
     y1=y1+(x(i)^2);
     y=0.5+(((sin(y1^0.5))^2-0.5)/(1+0.001*y1)^2);%for循环实现函数的定义
end
return ;