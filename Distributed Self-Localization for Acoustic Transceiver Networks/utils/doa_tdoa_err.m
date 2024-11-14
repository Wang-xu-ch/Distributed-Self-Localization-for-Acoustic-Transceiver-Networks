function [D,T] = doa_tdoa_err(D_real,T_real,DOA_err,TDOA_err)
I = size(D_real,1);
D_real = deg2rad(D_real);


% DOA error
D_e =0.0175*randn(I,I)*sqrt(DOA_err);% 1deg = 0.0175

D = wrapToPi(D_real+D_e); 
for i=1:I
    D(i,i) = 0;
end
D = rad2deg(D);

for i=1:I
    for j=1:I
        T(i,j) = T_real(i,j,i);
    end
end




%tdoa error
T_err = sqrt(TDOA_err/10)*randn(1,I*I*(I-1)/2)/1e3;         %% ms

num = 1;
for k = 1:I
    for i = 1:I
        for j = i+1:I
            T(i,j,k) = T_real(i,j,k) +T_err(num);
            T(j,i,k) = -T(i,j,k);
            num = num+1;
        end
    end
end

end
