function showregions_cort(regions,nregions)

figure
cmap=colormap(colorcube);
 hold on
 Legend=cell(1,nregions);
 
 count=0;
for j=1:nregions
    if (regions.categ(j)==2)&&(regions.hemi(j)==0)
        disp(j/nregions)
        count=count+1;
        XX=regions.x(j,1:regions.volume(j));
        YY=regions.y(j,1:regions.volume(j));
        ZZ=regions.z(j,1:regions.volume(j));
        colindex=cmap(count-64*floor((count-1)/64),:);
        plot3(XX,YY,ZZ,'o','color',colindex,'MarkerFaceColor',colindex);
        u=regions.name(j);
        Legend{count}=u{1};
    end
end


%figure
%cmap=colormap(colorcube);
%hold on
 %Legend=cell(1,nregions);
 
 %count=0;
for j=1:nregions
    if regions.categ(j)==1
        %count=count+1;
        XX=regions.x(j,1:regions.volume(j));
        YY=regions.y(j,1:regions.volume(j));
        ZZ=regions.z(j,1:regions.volume(j));
        colindex=[0.5 0.5 0.5];
        plot3(XX,YY,ZZ,'o','color',colindex,'MarkerFaceColor',colindex);
        %u=regions.name(j);
        %Legend{count}=u{1};
    end
end
%Legend=Legend(1:count);
%legend(Legend,'Location','eastoutside','NumColumns',2);
Legend=Legend(1:count);
legend(Legend,'Location','eastoutside','NumColumns',2);
set(gca, 'YDir','reverse')
axis off


hold off

figure
hold on
count=0;
for j=1:nregions
    if (regions.categ(j)==2)&&(regions.hemi(j)==0)
        disp(j/nregions)
        count=count+1;
        XX=regions.x(j,1:regions.volume(j));
        YY=regions.y(j,1:regions.volume(j));
        ZZ=regions.z(j,1:regions.volume(j));
        colindex=cmap(count-64*floor((count-1)/64),:);
        plot3(XX,YY,ZZ,'o','color',colindex,'MarkerFaceColor',colindex);
    end
end
axis off
view([4,-90]);
hold off

end