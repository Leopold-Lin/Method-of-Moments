function value = my_psi_neq(m,n,delta_ln,k,a)
    r = abs( m - n );
    if r ~= 0
        value = exp(-j*k*r)/(4*pi*r);
    else    %�����������ص����������my_psi_eq
        value = my_psi_eq(delta_ln,k,a);
    end
end