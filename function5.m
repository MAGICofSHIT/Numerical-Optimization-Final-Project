function  [y,x] =function5(n)
x=sym('x%d',[n 1]);%���ñ���xΪn��1�е�������
y1=0;
y=0;%���ú�����ʼֵΪ0
for i=1:n
     y1=y1+(x(i)^2);
     y=0.5+(((sin(y1^0.5))^2-0.5)/(1+0.001*y1)^2);%forѭ��ʵ�ֺ����Ķ���
end
return ;