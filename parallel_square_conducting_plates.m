n = input('Input the N of 2N')
syms x y
num = n^0.5;
v = 1;
a = 1 / 2;
b = a / num;
epsilon = 8.854187817e-12;   %����еĽ�糣��
%����ƽ�н�����ĵ��ݵ�l�����Ϊltt��ltb��lbb��lbt������t��ʾtop��b��ʾbottom��Ϊһ��2N�׷���
%ltt = lbb = lmn��lmn����㵥��������lmn��ͬ
%���ݶԳ�ԭ��ltb = lbt
for i = 1:n
    for j = 1:n
        if i == j   %�����°巽����ͬһxy����ʱ
            ltb(i,j) = 0.282/epsilon*2*b*((1+pi/4*(d/b)^2)^0.5-pi^0.5*d/(2*b))
        else        %�����°巽�鲻��ͬһxy����ʱ
            ltb(i,j) = b^2/( pi*epsilon*(())^0.5 );
        end
    end
end