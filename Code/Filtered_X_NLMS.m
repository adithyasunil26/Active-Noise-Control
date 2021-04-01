
u= [0.001 0.0025 0.005 0.01 0.1]; %for different step sizes

for j = 1:length(u)

    M=128;      %number of filter weights

    %generating a random signal for noise
    N=20000; 
    x=randn(N,1);
    x=x/max(x); 

    uOG = u(j);  %selecting step size

    %defining a transfer function for the acoustic path taken by the
    %noise
    P=0.5*[0:127]; 
    d=conv(P,x); 

    %defining secondary path effect
    S = P/2;
    yp=conv(S,x);
    Sh=zeros(M,1);

    %adaptive filter S hat that adapts to match S
    for n=M:N
        yvec=x(n:-1:n-M+1); 
        u(n) = uOG/(yvec'*yvec);
        e1(n)=yp(n)-Sh'*yvec; 
        Sh=Sh+u(n)*yvec*(e1(n));
    end
    
    Sh = abs(ifft(1./abs(fft(Sh))));  
    xp = conv(Sh,x);
    
    %initializing adaptive filter wights and error values 
    Wz=zeros(M,1);  
    y=zeros(N,1);
    e=zeros(N,1);
    
    x=x(:);
    d=d(:);
    xp=xp(:);
    
    %lms algorithm for adaptive filter weights
    for n=M:N
        xvec=x(n:-1:n-M+1); 
        xpvec=xp(n:-1:n-M+1);
        u(n) = uOG/(xvec'*xvec);
        for k=1:length(Sh)
            y(n)=y(n)+S(k)*Wz(k)*xvec(k);
        end
        e(n)=d(n)-y(n); 
        Wz=Wz+u(n)*xpvec*(e(n));
    end
    
    %for generating plots
    figure;
    subplot(2,1,1)
    plot(e(M:N));
    title('Error');
    ylabel('Error');
    xlabel('Cycles');
    subplot(2,1,2)
    plot(d(M:N));
    xlabel('n');
    ylabel('Signal');
    title('d(n) vs y(n)');
    hold on
    plot(y(M:N));
    legend('d(n)','y(n)')
end

