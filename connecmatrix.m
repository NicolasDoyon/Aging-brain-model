function [connecmat,ngoodregions,IndexInv]=connecmatrix(nregions,regions,A,InvR)
ngoodregions=0;%number of regions which are either cortical or subcortical
Index=zeros(nregions);%Index(j)=i <-> region j is the ith good region 
IndexInv=zeros(nregions);
for j=1:nregions
    if regions.categ(j)>0
        ngoodregions=ngoodregions+1;
        Index(j)=ngoodregions;  
        IndexInv(ngoodregions)=j;
    end
end
IndexInv=IndexInv(1:ngoodregions);
CSA=zeros(ngoodregions,ngoodregions);%matrix containing the contact surfaces between any two given regions
for j=5:250
    for k=5:250
        for u=5:250
            if (A(j,k,u)>A(j,k,u+1))||(A(j,k,u)<A(j,k,u+1))
                if (A(j,k,u)>0) && (A(j,k,u+1)>0)
                    if regions.categ(InvR(A(j,k,u)))*regions.categ(InvR(A(j,k,u+1)))>1
                        Ind1=Index(InvR(A(j,k,u)));
                        Ind2=Index(InvR(A(j,k,u+1)));
                        CSA(Ind1,Ind2)=CSA(Ind1,Ind2)+1;
                        CSA(Ind2,Ind1)=CSA(Ind2,Ind1)+1;
                    end
                end
            end
            if (A(j,k+1,u)>A(j,k,u))||(A(j,k+1,u)<A(j,k,u))
                if (A(j,k,u)>0)&&(A(j,k+1,u)>0)
                      if regions.categ(InvR(A(j,k,u)))*regions.categ(InvR(A(j,k+1,u)))>1
                        Ind1=Index(InvR(A(j,k,u)));
                        Ind2=Index(InvR(A(j,k+1,u)));
                        CSA(Ind1,Ind2)=CSA(Ind1,Ind2)+1;
                        CSA(Ind2,Ind1)=CSA(Ind2,Ind1)+1;
                      end
                end
            end
            if (A(j+1,k,u)>A(j,k,u))||(A(j+1,k,u)<A(j,k,u))
                if (A(j,k,u)>0)&&(A(j+1,k,u)>0)
                    if regions.categ(InvR(A(j,k,u)))*regions.categ(InvR(A(j+1,k,u)))>1
                        Ind1=Index(InvR(A(j,k,u)));
                        Ind2=Index(InvR(A(j+1,k,u)));
                        CSA(Ind1,Ind2)=CSA(Ind1,Ind2)+1;
                        CSA(Ind2,Ind1)=CSA(Ind2,Ind1)+1;
                    end     
                end
            end
        end
    end
end
meanx=zeros(1,nregions);
meany=zeros(1,nregions);
meanz=zeros(1,nregions);
for j=1:nregions
    for k=1:regions.volume(j)
        meanx(j)=meanx(j)+regions.x(j,k);
        meany(j)=meany(j)+regions.y(j,k);
        meanz(j)=meanz(j)+regions.z(j,k);
    end
    meanx(j)=meanx(j)/regions.volume(j);
    meany(j)=meany(j)/regions.volume(j);
    meanz(j)=meanz(j)/regions.volume(j);
end

distmat=zeros(ngoodregions,ngoodregions);
for j=1:nregions-1
    for k=j+1:nregions
        if regions.categ(j)*regions.categ(k)>0
            dist=(meanx(j)-meanx(k))^2+(meany(j)-meany(k))^2+(meanz(j)-meanz(k))^2;
            dist=dist^(1/2);
            distmat(Index(j),Index(k))=dist;
            distmat(Index(k),Index(j))=dist;
        end
    end  
end
connecmat=zeros(ngoodregions,ngoodregions);
for j=1:ngoodregions-1
    for k=j+1:ngoodregions
        connecmat(j,k)=CSA(j,k)/distmat(j,k);
        connecmat(k,j)=CSA(k,j)/distmat(k,j);
    end
end
for j=1:ngoodregions
    S=sum(connecmat(j,:));
    connecmat(j,j)=-S;
end
for j=1:ngoodregions
    connecmat(:,j)=connecmat(:,j)/regions.volume(IndexInv(j));
end

