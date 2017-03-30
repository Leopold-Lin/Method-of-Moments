clear;clc;
n = input('Input the N...\n')
%subsectional bases
syms x;
g = 1 + 4*x^2;
fa = 5/6*x -1/2*x^2 -1/3*x^4;   %ʵ�ʽ�
for i = 1:n
    %������Ϊ�����κ��������麯��Ϊ���庯��
    xm = i * 1/(n+1);
    fn(i) = (1-abs(x-xm)*(n+1)) .* ( x - xm < (1/(n+1)) &  x - xm > -(1/(n+1)));     
end
%for i = 1:n
%    for j = 1:n
%         %�ڻ����ϳ����˴���Ӧ���ǲ��ܴ��߼�ֵ��ȥ���������function���о����ǲ�����
%        lmn(i,j) = int(wn(i)*fn(j),x,0,1); 
%    end
%    gm(i) = int(wn(i)*g,x,0,1);
%end
lmn = ones(n,n);
gm = ones(n,1);
for i = 1:n
    for j = 1:n
        if i == j
            lmn(i,j) = 2*(n+1);
        elseif i - j == 1 | j - i == 1
            lmn(i,j) = - (n+1);
        else
            lmn(i,j) = 0;
        end
    end
    gm(i) = 1/(n+1) * (1+(4*i^2+1/3)/(n+1)^2);
end
a = lmn\gm;
val = 0:0.01:1;
f = fn * a;
plot(val,eval(subs(f,x,val)));
hold
plot(val,subs(fa,x,val));
