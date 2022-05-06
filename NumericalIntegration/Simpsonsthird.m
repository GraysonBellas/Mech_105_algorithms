function [I] = Simpson(x, y)
logicalarray=(linspace(x(1),x(size(x,2)),size(x,2))) == x;
if sum(logicalarray)~=size(x,2)
    error('inputs are not equally spaced')
end
if (size(x,2)) ~= (size(y,2))
    error('inputs are not the same length')
end
h=x(2)-x(1);
n=size(x,2)-1;
multi2=[2:2:1000];
logicalarray=n==multi2;
if sum(logicalarray) ==0;
    warning('WARNING: Trapeziodal rule has been used on last interval')
    lastinterval=h*(y(size(y,2)-1)+y(size(y,2)))/2;
    x=x(1:(size(x,2)-1));
    y=y(1:(size(y,2)-1));
else
    lastinterval=0;
end
i=[1:2:(n-1)];
comp1=0; comp2=0;
for i=i
    comp1=comp1+y(i+1);
end
j=[2:2:(n-2)];
for j=j
    comp2=comp2+y(j+1);
end
n=size(x,2)-1;
I=((x(size(x,2))-x(1))*(y(1)+4*comp1+2*comp2+y(size(y,2)))/(3*n))+lastinterval;
if size(x,2)==1
    I=lastinterval;
end

