[regions,nregions,A,InvR]=readatlas();
[connecmat,ngoodregions,IndexInv]=connecmatrix(nregions,regions,A,InvR);
init = default_init(ngoodregions);
p=default_param();
tic
[t,y] =SolveSystem(init,p,ngoodregions,10000*connecmat);
toc

regplot=3;
plotregion(regplot,t,y);
