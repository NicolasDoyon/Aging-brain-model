function F=makemovie(Vplot,t,y,ngoodregions,regions,IndexInv)

Yname=['Abi'; 'Abo'; 'tau'; 'Fi '; 'F0 '; ' N '; ' A '; ' Nd';' AO';' H ';' M1';' M2'; 'M1h'; 'M2h'; 'T_b';'I10';'T_a';' P '];
Tplot=(0:50:3650);
L=length(Tplot);
Yplot=zeros(ngoodregions,L);
for j=1:ngoodregions
    Yplot(j,:)=interp1(t,y(:,Vplot+18*(j-1)),Tplot);   
end
%MMAX=max(max(Yplot));
%MMIN=min(min(Yplot));
U=parula(64);
clear F
for j=1:length(Tplot)
    MMAX=max(max(Yplot(:,j)));
    MMIN=min(min(Yplot(:,j)));
    for k=1:ngoodregions
        if regions.hemi(IndexInv(k))==0
            cind=round((Yplot(k,j)-MMIN)*64/(MMAX-MMIN));
            colo=U(max(cind,1),:);
            XX=regions.x(IndexInv(k),1:regions.volume(IndexInv(k)));
            YY=regions.y(IndexInv(k),1:regions.volume(IndexInv(k)));
            ZZ=regions.z(IndexInv(k),1:regions.volume(IndexInv(k)));
            plot3(XX,-YY,ZZ,'o','color',colo);
            caxis([MMIN MMAX]);
            colorbar;
            hold on
        end
    end
    view([0,90]);
    str=['Time=', num2str(Tplot(j)),'days','  Value=',num2str(mean(Yplot(:,j))),',  ',Yname(Vplot,:)];
    title(str);
    F(j) = getframe(gcf); 
    close;
end
