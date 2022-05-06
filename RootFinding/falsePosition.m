function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
ea=0;
if nargin <= 4
    maxit=200;
elseif nargin <= 3
    es= 0.0001;
elseif nargin <= 2
    error('not enough input arguments')
end
xlp=xl;
xup=xu;
if xu==0
xr=xl;
else
xr=xu;
end
for iter=(1:maxit)
       if (func(xu)*func(xl)) < 0
                xrold=xr;
                xr=(xup-(func(xup)*(xlp-xup)/(func(xlp)-func(xup))));
                if func(xr)==0
                    break
                else
                ea=abs((abs(xr-xrold)/xr)*100);
                if ea <= es
                   break
                elseif (func(xl)*func(xr)) <= 0
                    xup=xr;
                else
                    xlp=xr;
                end  
                end

       elseif func(xu)==0
                xr=xu;
                disp('root found at upper bound')
                break
        elseif func(xl)==0
                xr=xl;
                disp('root found at lower bound')
                break
        else
                error('No sign change within bracket')
                end
                end
      
       root=xr
       fx=func(xr);
end