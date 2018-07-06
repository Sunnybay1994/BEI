function [ data,padd ] = zpad1( adj,add,data,nd,padd,np )
%zpad1: zero pad
%   Surround data by zeros. 1-D
%Original Text: chapter 2.1.2 from BEI11,2010

[data,padd]=adjnull(adj,add,data,nd,padd,np);
for d=1:nd;
    p=round(d+(np-nd)/2);
    if adj==0;
        padd(p)=padd(p)+data(d);
    else
        data(d)=data(d)+padd(p);
    end
end

end