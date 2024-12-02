function  [y,x] =function4(n)
x=sym('x%d',[n 1]);
y=0;
y1=0;
y2=1;
for i=1:n
    y1=y1+0.00025*x(i)^2;
    y2=y2*cos(x(i)/i^0.5);
    y=y1-y2+1;
end
return ;