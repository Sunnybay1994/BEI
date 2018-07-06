function [ output_args ] = matmult( adj,add,bb,x,nx,y,ny )
%matmult: matrix multiply and its adjoint
%   With the option add=1,results accumulate like y=y+B*x(in adjnull).
%Original Text: chapter 2.1 from BEI11,2010

[x,y]=adjnull(adj,add,x,nx,y,ny);
for ix=1:nx
    for iy=1:ny
        if adj==0
            y(iy)=y(iy)+bb(iy,ix)*x(ix);
        else
            x(ix)=x(ix)+bb(iy,ix)*y(iy);
        end
    end
end

end