clear;clc
n = input('Input the number of delta C\n');
e = 2.7183;          %��Ȼ����
gamma = 1.78107;     %ŷ������
eta = 120*pi;         %����еĲ��迹
lambda = 1;           %����
k = 2*pi / lambda;    %����

position_i = zeros(n:1);
position_i_plus = zeros(n:1);
position_i_minuts = zeros(n:1);
