clc
close all
clearvars
digits(32)%���㾫�����ã�Ĭ��ֵΪ32

% ���Ժ���
%x=sym('x',[20,1]);
 [f1,x]= function1(5);
% [f2,x]= function2(3);
% [f2,x]= function2(30);
% [f3,x]= function3(3);
% [f4,x]= function4(3);
% [f5,x]= function4(3);


 x01=[-1.2,1,-1.2,1,-1.2]';
% x02=[0.5,0.5,0.5]';
% x02=[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3]';
% x03=[2,2,2]';
% x04=[50,50]';

ftt=f1;%���Ժ���ѡ��


e=10^-5;%����
k=0;%����
gama = 0.2;
dt=sym('dt',[5,1]);%�½�������ű���
syms at;%��ȷ���������������ű���
f_value=0;
s=0;
beta1 = 0.9;
beta2 = 0.999;
epsilon = 1e-8;
    
m = 0;
v = 0;

Armijo_o=0.5;
Armijo_b=0.8;

%��δ�ﵽ�����趨ʱ��������
 xs(:,1)=x01;
% xs(:,1)=x02;
% xs(:,1)=x03;
% xs(:,1)=x04;
d=double(subs(-gradient(ftt, x),x,xs(:,1)));%��ʼ�½�����
e_now(1,1)=vpa(norm(subs(gradient(ftt, x),x,xs(:,1))));
f_value(1,1)=vpa(subs(ftt,x,xs(:,1)));
% Yit=num2str(double(f_value(1,1)))
Yit=double(f_value(1,1));
num=k;
disp(['��0�㣬�õ㾫�ȣ��ݶ�ģֵ��Ϊ��',num2str(double(e_now(1,1))), ...
    '���õ㺯��ֵΪ��',num2str(double(f_value(1,1)))]);
while(e_now(k+1,1)>e)   
        
        %Armijo�������������㲽��a
        a=1;
        Armijo_x=xs(:,k+1)+a*d;
        ftta=vpa(subs(ftt,x,Armijo_x));
        if(ftta>vpa(subs(ftt+0.4*a*gradient(ftt, x)'*d,x,xs(:,k+1))))
            a=Armijo_b;
            while(1)
                if(ftta<=vpa(subs(ftt+0.4*a*gradient(ftt, x)'*d,x,xs(:,k+1))))
                    break
                else
                    a=a*Armijo_o;
                    Armijo_x=xs(:,k+1)+a*d;
                    ftta=vpa(subs(ftt,x,Armijo_x));
                end
            end
        end

        m = beta1*m + (1-beta1).*d;  % ����ƽ��
        v = beta2*v + (1-beta2).*(d.*d); % �ݶ�ƽ����ƽ��
        
        % ����ƫ��У��
%         beta1_t = 1/9;
%         beta2_t = 1/999;
        beta1_t = (beta1)^(k+1);
        beta2_t = (beta2)^(k+1);
        m_ = m./(1 - beta1_t);
        v_ = v./(1 - beta2_t);
        s=a./sqrt((v_).^0.5 + epsilon).*m_;
%         xs(:,k+2)=xs(:,k+1)+s;%������һ�������
%         s=a./((v_).^0.5 + epsilon).*m_;
        xs(:,k+2)=xs(:,k+1)+s;%������һ�������
        y=vpa(subs(gradient(ftt, x),x,xs(:,k+2))-subs(gradient(ftt, x),x,xs(:,k+1)));
        d=double(subs(-gradient(ftt, x),x,xs(:,k+2)));
        e_now(k+2,1)=norm(vpa(subs(gradient(ftt, x),x,xs(:,k+2))));
        f_value(k+2,1)=vpa(subs(ftt,x,xs(:,k+2)));

        disp(['��',num2str(k+1),'�㣬�õ㾫�ȣ��ݶ�ģֵ��Ϊ��',num2str(double(e_now(k+2,1))), ...
            '���õ㺯��ֵΪ��',num2str(double(f_value(k+2,1)))]);
        Yit=[Yit;double(f_value(k+2,1))];
        k=k+1;
        num=[num;k];
end
%         num=[num;k+1];
e_end=norm(double(subs(gradient(ftt, x),x,xs(:,end))));
x_best=xs(:,end);
f_value(end+1,1)=vpa(subs(ftt,x,xs(:,end)));
plot(num,Yit);
xlabel('��������');
ylabel('����ֵ');
title('Adam�㷨');
% figure(1);plot(f_value);title('����ֵ�仯');
% figure(2);plot(e_now);title('�ݶ�ģֵ�仯');
disp(['��',num2str(k+1),'�ε�����',num2str(k+2),'���㣬���ս�����ȣ��ݶ�ģֵ��Ϊ��',num2str(double(e_now(end,1))), ...
    '������ȡ�õĺ���ֵΪ��',num2str(double(f_value(end,1)))]);
disp('����ȡ�õļ�Сֵ��Ϊ��');
disp(['Adam�㷨'])
disp(x_best);