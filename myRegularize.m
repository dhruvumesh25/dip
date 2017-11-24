function [imgToRegularize] = myRegularize(im,imgToRegularize,WindowSize,Sigma,ShowMSE,iter,dt)
    [m,n,k]=size(imgToRegularize);
    G=fspecial('gaussian',2,Sigma);
    A=zeros(m,n,k,2,2);
    A_Smooth=zeros(m,n,k,2,2);
    temp_A=zeros(2,2);
    for i=1:iter
        I=imgToRegularize;
        [Ix,Iy]=gradient(I);
        A(:,:,:,2,2)=Iy.*Iy;
        A(:,:,:,2,1)=Ix.*Iy;
        A(:,:,:,1,2)=Ix.*Iy;
        A(:,:,:,1,1)=Ix.*Ix;
        
        A_Smooth(:,:,:)=imfilter(A(:,:,:),G);
        for x=1+floor(WindowSize/2):m-floor(WindowSize/2)
            for y=1+floor(WindowSize/2):n-floor(WindowSize/2)
                for z=1:k
                    temp_A(:,:)=A_Smooth(x,y,z,:,:);
                    [V,D]=eig(temp_A);
                    f2=1/sqrt(1+abs(D(1,1))+abs(D(2,2)));
                    f1=f2^2;
                    T=f1*V(:,2)*V(:,2).'+f2*V(:,1)*V(:,1).';
                    kernel=myKernel(T,WindowSize,dt);
                    imgToRegularize(x,y,z)= sum(sum(kernel.*I(x-floor(WindowSize/2):x+floor(WindowSize/2),y-floor(WindowSize/2):y+floor(WindowSize/2),z)).');
                end
            end
        end
        imshow(mat2gray(imgToRegularize));
        if ShowMSE==1
            mse(im,imgToRegularize);
        end
        fprintf('iteration number %i\n', i) ;
    end
end