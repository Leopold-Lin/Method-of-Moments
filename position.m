function delta_x,delta_y = postion(n,i,j,length)   %����Ϊ�ֿ����n�����Ϊ��ǰLij��delta_x,deltay
    n = n^0.5
    %���������index
    if mod(i,n) == 0
        xm = n;
        ym = i/n;
    else
        xm = mod(i,n);
        ym = i/n +1;
    end
    if mod(j,n) == 0
        xn = n;
        yn = j/n;
    else
        xn = mod(j,n);
        yn = j/n + 1;
    end
    deltax = 2*length*(xm-xn);   %Xm��Xn֮��ľ���
    deltay = 2*length*(ym-yn);   %Ym��Yn֮��ľ���
end