function  [y,x] =function3(n)
x=sym('x%d',[n 1]);%���ñ���xΪn��1�е�������
y=0;%���ú�����ʼֵΪ0
for i=1:n
     y=y+(x(i)^2-10*cos(2*pi*x(i))+10);%forѭ��ʵ�ֺ����Ķ���
end
return ;