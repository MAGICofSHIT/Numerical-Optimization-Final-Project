function  [y,x] =function2(n)
x=sym('x%d',[n 1]);%���ñ���xΪn��1�е�������
y=0;%���ú�����ʼֵΪ0
y1=0;
for i=1:n
     y1=y1+x(i);
     y2=y2+i*x(i)^2;
     y=y2+0.01*y1^2;%forѭ��ʵ�ֺ����Ķ���
end
return ;