clear;clc;
%δ��ɣ��ڱ߽��϶��׵����ķֶκ���û�г��֣���δ���������
n = input('Input the N...\n')
%subsectional bases
syms x;
g = 1 + 4*x^2;
fa = 5/6*x -1/2*x^2 -1/3*x^4;   %ʵ�ʽ�
for i = 1:n
    %������Ϊ�����κ��������麯��Ϊ���庯��
    xm = i * 1/(n+1);
    fn(i) = piecewise( abs(x) < 1/(n+1),1-abs(x)*(n+1),abs(x) >= 1/(n+1),0);
    fn(i) = subs(fn(i),x,x-xm);
    lfn(i) = -diff(diff(fn(i)));
    wn(i) = piecewise( abs(x) <= 1/(2*(n+1)),1,0);
    wn(i) = subs(wn(i),x,x-xm);
end
for i = 1:n
    for j = 1:n
        lmn(i,j) = int(wn(i)*lfn(j),0,1); 
    end
    gm(i) = int(wn(i)*g,0,1);
end
a = lmn\gm';
val = 0:0.01:1;
f = fn * a;
plot(val,eval(subs(f,x,val)));
hold
plot(val,subs(fa,x,val));
