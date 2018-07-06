function [ xx,yy ] = causint( adj,add,n,xx,yy )
%causint: causalintegration (1?s on diagonal )
%   Detailed explanation goes here
%Original Text: chapter 2.1.7 from BEI11,2010

[xx,yy]=adjnull(adj,add,xx,n,yy,n);
if adj==0;
    tt(1)=xx(1);
    for i=2:n;
        tt(i)=tt(i-1)+xx(i);
    end
    for i=1:n
        yy(i)=yy(i)+tt(i);
    end
else
    tt(n)=yy(n);
    for i=n:-2:-1;
        tt(i-1)=tt(i)+yy(i-1);
    end
    for i=1:n;
        xx(i)=xx(i)+tt(i);
    end
end

end

