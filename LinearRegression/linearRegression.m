function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
if size(x,2) ~= size (y,2)
    error('X and Y vectors must be the same size')
end
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
Q1=sortedY(floor((size(x,2)+1)/4));
Q3=sortedY(floor((size(x,2)*3+3)/4));
IQR=Q3-Q1;
fX=sortedX;
fY=sortedY;
z=0;
for i=1:(size(x,2))
if sortedY(i) < (Q1-1.5*IQR) || sortedY(i) > (Q3+1.5*IQR)
    fX(i-z)=[];
    fY(i-z)=[];
    z=z+1;
end
end
n=size(fX,2);
Exiyi=sum(fX.*fY);
Exi2=sum(fX.^2);
Exi=sum(fX);
a1=(n*Exiyi-sum(fX)*sum(fY))/(n*Exi2-(Exi)^2);
a0=mean(fY)-a1*mean(fX);
regress=@(x) a0+a1*x;
St=sum((fY-mean(fY)).^2);
Sr=sum((fY-regress(fX)).^2);
Rsquared=1-Sr/St;
intercept=a0;
slope=a1;
end