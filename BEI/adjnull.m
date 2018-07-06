function [ x,y ] = adjnull( adj,add,x,nx,y,ny )
%adjnull: optionally erasing the output
%   Detailed explanation goes here
%Original Text: chapter 2.1 from BEI11,2010

if add==0;
    if adj==0
        for iy=1:ny;
            y(iy)=0;
        end
    else
        for ix=1:nx
            x(ix)=0;
        end
    end
end
end
    