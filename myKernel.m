function [kernel]=myKernel(T,WindowSize,t)
    [x,y]=meshgrid(floor(WindowSize/2):-1:-floor(WindowSize/2),floor(WindowSize/2):-1:-floor(WindowSize/2));    
    T_inverse=pinv(T);        
    kernel=exp(-(x.^2*T_inverse(1,1)+y.^2*T_inverse(2,2)+x.*y*(T_inverse(1,2)+T_inverse(2,1)))/(4*t))/(4*pi*t);
    kernel = kernel./sum(sum(kernel));
end