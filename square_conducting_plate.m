clear;clc
n = input('Input the number of square:N \n')
%ƽ��Ϊ��λ���ƽ��
num = n^0.5;
v = 1;
a = 1 / 2;
b = a / num;
epsilon = 8.854187817e-12;   %����еĽ�糣��
if mod(num,1) ~= 0
    error('the N is a wrong number ! It must be a square number')
end
syms x y;
for i = 1:n
    if mod(num,2) == 1  %ÿ�зֿ�Ϊ���������ԭ���������ķֿ�����ģ��Դ�Ϊ�ο�ϵ
        ref = [fix(num/2)+1,fix(num/2)+1];
        %��i���ֿ�ı��
        if mod(i,num) == 0  
            position_i = [i/num + 1,num];
        else
            position_i = [i/num + 1,mod(i,num)];
        end
        %��i���ֿ����ĵ�����
        posx(i) = (position_i(1) - ref(1))*2*b;
        posy(i) = (position_i(2) - ref(2))*2*b;
    else    %ÿ�зֿ�Ϊ˫���������ԭ�����ĸ��ֿ�Ķ����ϣ��Ե��������ϵķֿ�Ϊ�ο�ϵ
        ref = [num/2,num/2];
        %��i���ֿ�ı��
        if mod(i,num) == 0
            position_i = [i/num + 1,num];
        else
            position_i = [i/num + 1,mod(i,num)];
        end
        %��i���ֿ����ĵ�����
        posx(i) = (position_i(1) - ref(1))*2*b-b;
        posy(i) = (position_i(2) - ref(2))*2*b+b;
    end
    %����������
    fn(i) = piecewise(abs(x-posx(i))<=b & abs(y-posy(i))<=b,1,0);
end        
        
%lmn��delta_Sn�ϵ�λ����ľ��ȵ���ܶ���delta_Sm�����Ĵ������ĵ�λ
for i = 1:n
    for j = 1:n
        if i == j
            lmn(i,i) = 2*b/(pi*epsilon)*0.8814;
        else
            xm = mod(i,n);
            xn = mod(j,n);
            ym = i/n + 1;
            yn = j/n + 1;
            deltax = 2*b*(xm-xn);   %Xm��Xn֮��ľ���
            deltay = 2*b*(ym-yn);   %Ym��Yn֮��ľ���
            lmn(i,j) = b^2 / (pi*epsilon* ( deltax^2 + deltay^2)^0.5 );
        end
    end
    gm(i) = v;
end
a = lmn\gm';
val = 0:0.01:1;