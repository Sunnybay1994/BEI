function [ mm,dd ] = lint1( adj,add,o1,d1,coordinate,mm,m1,dd,nd )
%lint1: Linear interpolation 1?D, uniform model mesh to data coordinates and values .
%   Detailed explanation goes here
%Original Text: chapter 2.1.6 from BEI11,2010

[mm,dd]=adjnull(adj,add,mm,m1,dd,nd);
for id=1:nd
    f=(coordinate(id)-o1)/d1;i=f;im=1+i;
    if 1<=im&&im<m1
        fx=f-1;gx=1-fx;
        if adj==0;
            dd(id)=dd(id)+gx*mm(im)+fx*mm(im+1);
        else
            mm(im)=mm(im)+gx*dd(id);
            mm(im+1)=mm(im+1)+fx*dd(id);
        end
    end
end

end

