
u= [0.01 0.05 0.1 0.2 0.3]; %for different step sizes

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

    %initializing adaptive filter wights, filter output and error
    W=zeros(M,1);  
    y=zeros(N,1);
    e=zeros(N,1);

    x=x(:);
    d=d(:);
    
    %lms algorithm for adaptive filter weights
    for n=M:N
        xvec=x(n:-1:n-M+1); 
        y(n)=W'*xvec;
        e(n)=d(n)-y(n); 
        W=W+uOG*xvec*e(n);
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


