
%importing audio files
%[orig,Fs]=audioread('moonlight_sonata_bethoven.wav');   
[orig,Fs]=audioread('anc.wav');

u= [1]; %for different step sizes

for j = 1:length(u)      
    M=128;      %number of filter weights
    
    %generating a random signal for noise
    N=196475;                   %noise length selected according to audio clip length
    x=randn(N,1);
    x=x/max(x); 
    
    uOG = u(j);  %selecting step size
    
    %defining a transfer function for the acoustic path taken by the
    %noise
    P=0.5*[0:127]; 
    d=conv(P,x); 
    d=d/max(d);
    noisysignal=orig+d(1:N);
    audiowrite('noisysignal1.wav',noisysignal,Fs);
    clean=conv(P,orig);
    
    %initializing adaptive filter wights
    W=zeros(M,1);  
    
    x=x(:);
    d=d(:);

    %lms algorithm for adaptive filter weights
    for n=M:N
        xvec=x(n:-1:n-M+1); 
        u(n) = uOG /(xvec'*xvec);
        y(n)=W'*xvec;
        e(n)=d(n)-y(n); 
        W=W+u(n)*xvec*(e(n));
    end

    %soundsc(noisysignal-y,Fs);
    for k=M:N
        filtered(k-M+1)=noisysignal(k)-y(k);
    end
    audiowrite('filtered signal1.wav',filtered,Fs);
end



