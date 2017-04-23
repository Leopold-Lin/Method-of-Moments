clear;clc
n = input('Input the number of delta C\n');
e = 2.7183;          %��Ȼ����
gamma = 1.78107;     %ŷ������
eta = 120*pi;         %����еĲ��迹
lambda = 1;           %����
k = 2*pi / lambda;    %����
phi_i = 0;            %����Ƕ�
phi_s = pi;           %ɢ��Ƕ�
%ɢ�����sigma����Ϊ��ȣ���ά��Ϊ�������ɢ��糡ǿ��������糡ǿ�ȱ�ֵƽ���ĳ˻�
%ÿ��lmn��ʾ���ڣ�xn��yn����ĺ���fn���ڣ�xm��ym��������ĳ�E
%lmn�������ã�3-24������
%��m��Զ��n��ʱ�������ã�3-12�����棨3-24������̫Ӱ�쾫ȷ��

%�����ѡ�������,y��Ϊ���ᣬ2*lambda��x��Ϊ���ᣬlambda/2
a = 2*lambda;
b = lambda/2;
pos = zeros(n+1,2);
pos(:,1) = b*cos(0:2*pi/n:2*pi);
pos(:,2) = a*sin(0:2*pi/n:2*pi);
for i = 1:n
    %ȷ��ÿ�ε��е������
    xm(i) = (pos(i,1) + pos(i+1,1))/2;
    ym(i) = (pos(i,2) + pos(i+1,2))/2;
    delta_c(i) = sqrt((pos(i,1) - pos(i+1,1))^2 + (pos(i,2) - pos(i+1,2))^2);
end
%Ĭ��i��j���Ǳ�ʾ�������鲿������ֻ�ܰ����±�ĳ�index_i��index_j��
lmn = zeros(n);
zmn = zeros(n);
gm = zeros(1,n);
vim = zeros(1,n);
vsn = zeros(1,n);
for index_i = 1:n
    for index_j = 1:n
        if index_i == index_j
            lmn(index_i,index_j) = eta/4*k*(1 - j*2/pi*log(gamma*k*delta_c(index_j)/(4*e)));
        else
            lmn(index_i,index_j) = eta/4*k*delta_c(index_j)*besselh(0,2,k*sqrt((xm(index_j)-xm(index_i))^2 + (ym(index_j)-ym(index_i))^2));
        end
        zmn(index_i,index_j) = delta_c(index_j) * lmn(index_i,index_j);
    end
    gm(index_i) = exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
    vim(index_i) = delta_c(index_i) * exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
    vsn(index_i) = delta_c(index_i) * exp(j*k*(xm(index_i)*cos(phi_i)+ym(index_i)*sin(phi_i)));
end

alpha = lmn\gm';
sigma = k*eta^2/4 * ( vsn*inv(zmn)*vim' )^2;