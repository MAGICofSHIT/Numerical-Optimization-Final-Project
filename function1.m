function  [y,x] =function1(n)
x=sym('x%d',[n 1]);%设置变量x为n�?1列的列向�?
y=0;%设置函数初始值为0
for i=1:n-1
    y=y+100*((x(i+1)-x(i)^2)^2+(x(i)-1)^2);%for循环实现函数的定�?
end
return ;