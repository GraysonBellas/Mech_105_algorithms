function [L,U,P]= luFactor(A)
sz=size(A);
if sz(1) ~= sz(2)
    eror('A must be a square matrix')
end
P=eye(sz(1));
L=eye(sz(1));
function [A,P] = pivot(A,P,j)
unsorted_column=A(((j):sz),j);
largepiv_val=max(abs(unsorted_column));
for iter=(1:sz)
if abs((A(iter,j))) == largepiv_val
largepiv_row=iter;
end
end
Apivoted=A;
Ppivoted=P;
Apivoted(j,:)=A(largepiv_row,:);
Apivoted(largepiv_row,:)=A(j,:);
Ppivoted(j,:)=P(largepiv_row,:);
Ppivoted(largepiv_row,:)=P(j,:);
A=Apivoted;
P=Ppivoted;
end
for j=1:(sz-1)
    [A,P]=pivot(A,P,j);
for i=1:(sz-j)
    coeff=(A((i+j),j)/(A(j,j)));
    A(j+i,:)=A(j+i,:)-(A(j,:)*coeff);
    L(j+i,j)=coeff;
end
end
U=A;
end
