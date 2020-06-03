[regions,nregions,A,InvR]=readatlas();
[connecmat,ngoodregions,IndexInv]=connecmatrix(nregions,regions,A,InvR);
init = default_init(ngoodregions);
p=default_param();
tic
[t,y] = SolveSystem(init,p,ngoodregions,10000*connecmat);
toc


Ymax=[1e-5 1e-6 1e-9 4e-10 3.5e-11 0.2 0.4 5e-4 2e-7 4e-10 0.06 0.02 0.06 8e-3 1e-6 1e-5 6e-5 2e-8];
Yname=['Abi'; 'Abo'; 'tau'; 'Fi '; 'F0 '; ' N '; ' A '; ' Nd';' AO';' H ';' M1';' M2'; 'M1h'; 'M2h'; 'T_b';'I10';'T_a';' P '];

Vplot=9;%index of the variable to plot
F=makemovie(Vplot,t,y,ngoodregions,regions,IndexInv);
v = VideoWriter('newfile2.avi');
open(v)
writeVideo(v,F);
close(v)
%close(vidfile);
