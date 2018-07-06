function [ data ] = synmarine( nt,nh,ny,nz )
%synmarine: 
%Randomness is introduced into the earth with a random function of midpoint y and depth
%z. This randomness is impressed on some geological ?layer cake? function of depth z. This
%is done in the first half of the function synmarine() on this page.
%The second half of the function synmarine() on the current page scans all shot and geophone
%locations and depths and finds the midpoint, and the reflection coefficient for that midpoint,
%and adds it into the data at the proper travel time.
%Original Text: chapter 1.2.1 from BEI11,2010

ns=ny;
for iz=1:nz;
    depth(iz)=nt*rand;  % reflector depth
    layer=2*rand-1;     % reflector strength
    for iy=1:ny;        % impose texture on layer
        refl(iz,iy)=layer*(1+rand);
    end
end
data=zeros(nt,nh,ny);   % initiate data space
for is=1:ns;            % shots
    for ih=1:nh;        % down cable h=(g-s)/2
        for iz=1:nz;    % Add hyperbola for each layer
            iy=(ns-is)+(ih-1);      % y is midpoint
            iy=1+(iy-ny*floor(iy/ny));   % periodic with midpoint
            it=round(1+sqrt(depth(iz)^2+25*(ih-1)^2));
            if(it<=nt)
                data(it,ih,is)=data(it,ih,is)+refl(iz,iy);
            end
        end
    end
end
end

