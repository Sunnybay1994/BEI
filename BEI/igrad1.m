function [ xx,yy ] = igrad1( adj,add,xx,n,yy )
%igrad1: first difference and its adjoint
%   Detailed explanation goes here
%Original Text: chapter 2.1.1 from BEI11,2010

[xx,yy]=adjnull(adj,add,xx,n,yy,n);
for i=1:n-1;
    if adj==0;
        yy(i)=yy(i)+xx(i+1)-xx(i);
    else
        xx(i+1)=xx(i+1)+yy(i);
        xx(i)=xx(i)-yy(i);
    end
end

end

