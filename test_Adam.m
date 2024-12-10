clc
close all
clearvars
digits(32)%计算精度设置，默认值为32

% 测试函数
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

ftt=f1;%测试函数选择


e=10^-5;%精度
k=0;%步数
gama = 0.2;
dt=sym('dt',[5,1]);%下降方向符号变量
syms at;%精确线性搜索步长符号变量
f_value=0;
s=0;
beta1 = 0.9;
beta2 = 0.999;
epsilon = 1e-8;
    
m = 0;
v = 0;

Armijo_o=0.5;
Armijo_b=0.8;

%当未达到精度设定时进行运算
 xs(:,1)=x01;
% xs(:,1)=x02;
% xs(:,1)=x03;
% xs(:,1)=x04;
d=double(subs(-gradient(ftt, x),x,xs(:,1)));%初始下降方向
e_now(1,1)=vpa(norm(subs(gradient(ftt, x),x,xs(:,1))));
f_value(1,1)=vpa(subs(ftt,x,xs(:,1)));
% Yit=num2str(double(f_value(1,1)))
Yit=double(f_value(1,1));
num=k;
disp(['第0点，该点精度（梯度模值）为：',num2str(double(e_now(1,1))), ...
    '，该点函数值为：',num2str(double(f_value(1,1)))]);
while(e_now(k+1,1)>e)   
        
        %Armijo型线性搜索计算步长a
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

        m = beta1*m + (1-beta1).*d;  % 冲量平均
        v = beta2*v + (1-beta2).*(d.*d); % 梯度平方和平均
        
        % 进行偏差校正
%         beta1_t = 1/9;
%         beta2_t = 1/999;
        beta1_t = (beta1)^(k+1);
        beta2_t = (beta2)^(k+1);
        m_ = m./(1 - beta1_t);
        v_ = v./(1 - beta2_t);
        s=a./sqrt((v_).^0.5 + epsilon).*m_;
%         xs(:,k+2)=xs(:,k+1)+s;%计算下一个计算点
%         s=a./((v_).^0.5 + epsilon).*m_;
        xs(:,k+2)=xs(:,k+1)+s;%计算下一个计算点
        y=vpa(subs(gradient(ftt, x),x,xs(:,k+2))-subs(gradient(ftt, x),x,xs(:,k+1)));
        d=double(subs(-gradient(ftt, x),x,xs(:,k+2)));
        e_now(k+2,1)=norm(vpa(subs(gradient(ftt, x),x,xs(:,k+2))));
        f_value(k+2,1)=vpa(subs(ftt,x,xs(:,k+2)));

        disp(['第',num2str(k+1),'点，该点精度（梯度模值）为：',num2str(double(e_now(k+2,1))), ...
            '，该点函数值为：',num2str(double(f_value(k+2,1)))]);
        Yit=[Yit;double(f_value(k+2,1))];
        k=k+1;
        num=[num;k];
end
%         num=[num;k+1];
e_end=norm(double(subs(gradient(ftt, x),x,xs(:,end))));
x_best=xs(:,end);
f_value(end+1,1)=vpa(subs(ftt,x,xs(:,end)));
plot(num,Yit);
xlabel('迭代次数');
ylabel('函数值');
title('Adam算法');
% figure(1);plot(f_value);title('函数值变化');
% figure(2);plot(e_now);title('梯度模值变化');
disp(['共',num2str(k+1),'次迭代，',num2str(k+2),'个点，最终结果精度（梯度模值）为：',num2str(double(e_now(end,1))), ...
    '，最终取得的函数值为：',num2str(double(f_value(end,1)))]);
disp('最终取得的极小值点为：');
disp(['Adam算法'])
disp(x_best);