clear;clc
n = input('Input the N of 2N')
syms x y
%����ƽ�н�����ĵ��ݵ�l�����Ϊltt��ltb��lbb��lbt������t��ʾtop��b��ʾbottom��Ϊһ��2N�׷���
%ltt = lbb = lmn��lmn����㵥��������lmn��ͬ
%���ݶԳ�ԭ��ltb = lbt
%ƽ��Ϊ��λ���ƽ��
num = n^0.5;
v = 1;
a = 1 / 2;
b = a / num;
d = 1;
epsilon = 8.854187817e-12;   %����еĽ�糣��
if mod(num,1) ~= 0
    error('the N is a wrong number ! It must be a square number')
end
syms x y;         
%lmn��delta_Sn�ϵ�λ����ľ��ȵ���ܶ���delta_Sm�����Ĵ������ĵ�λ
for i = 1:n
    for j = 1:n
        if i == j   % m=n�����
            lmn(i,j) = 2*b/(pi*epsilon) *0.8814;
            ltb(i,j) = 0.282/epsilon*2*b*((1+pi/4*(d/b)^2)^0.5-pi^0.5*d/(2*b));
        else        % m~=n�����
            if mod(i,num) == 0
                xm = fix(i/num);
                ym = num;
            else
                xm = fix(i/num) +1;
                ym = mod(i,num);
            end
            if mod(j,num) == 0
                xn = j/num;
                yn = num;
            else
                xn = fix(j/num) + 1;
                yn = mod(j,num);
            end
            deltax = 2*b*(xm-xn);   %Xm��Xn֮��ľ���
            deltay = 2*b*(ym-yn);   %Ym��Yn֮��ľ���
            %disp(['i=',num2str(i),'j=',num2str(j),' ',num2str([xm,ym,xn,yn])])
            %��֤������⣬�ɹ�
            lmn(i,j) = b^2 / (pi*epsilon* (deltax^2 + deltay^2)^0.5 );
            ltb(i,j) = b^2/( pi*epsilon* (deltax^2+deltay^2+d^2)^0.5 );
        end
    end
end
gm = ones(n,1);
a = (lmn-ltb)\gm;
a_reshape = reshape(a,num,num);
c = 4*b*b*sum(a);
surf(a_reshape);