function [ mm,dd ] = dpbin2( adj,add,o1,d1,o2,d2,xy,mm,m1,m2,dd,nd )
%dpbin2: Data-push binning in 2-D
%   Detailed explanation goes here
%Original Text: chapter 2.1.5 from BEI11,2010

[mm,dd]=adjnull(adj,add,mm,m1*m2,dd,nd);
for id=1:nd;
    i1=round(1+(xy(1,id)-o1)/d1);
    i2=round(1+(xy(2,id)-o2)/d2);
    if 1<=i1&&i1<=m1&&1<=i2&&i2<=m2;
        if adj==0;
            dd(id)=dd(id)+mm(i1,i2);
        else
            mm(i1,i2)=mm(i1,i2)+dd(id);
        end
    end
end

end

