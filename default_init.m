function init = default_init(nregions,bool)
%INPUT: 
%nregions: a positive integer, the number of regions
%OUTPUT:
%init: a vector of length 18*nregions, the initial values of the variables

init=zeros(1,18*nregions);
init(1:18:1+18*(nregions-1)) =ones(1,nregions)*10.^-6*bool; %initial condition for ABi(Amyloid Beta inside the neurons) in g/ml
init(2:18:2+18*(nregions-1))=ones(1,nregions)*10.^-8;  % initial condition for ABO (Amyloid Beta outside the neorons) in g/ml
init(3:18:3+18*(nregions-1))=ones(1,nregions)*1.37.*10.^-10; % initial condition for tau proteins in g/ml
init(4:18:4+18*(nregions-1))=ones(1,nregions)*3.36.*10.^-10;  % initial condition for F_i (NFT inside the neorons) in g/ml
init(5:18:5+18*(nregions-1))=ones(1,nregions)*3.36.*10.^-11; % initial condition for F_O (NFT outside the neorons) in g/ml
init(6:18:6+18*(nregions-1))=ones(1,nregions)*0.14;   % initial condition for N (live) neorons) in g/ml  .....Note that y60 is the N0
init(7:18:7+18*(nregions-1))=ones(1,nregions)*0.14;   %  % initial condition for A (Astrocytes) in g/ml   ..... Note that y60 is the A0
init(8:18:8+18*(nregions-1))=ones(1,nregions)*0;      % initial condition for N_d (dead neorons) in g/ml
init(9:18:9+18*(nregions-1))=ones(1,nregions)*0;      % initial condition for AO (Amyloid Beta Oligomers) in g/ml
init(10:18:10+18*(nregions-1))=ones(1,nregions)*1.3.*10.^-11;      % initial condition for HMBG-1 (High Mobility Group Box 1 protein) in g/ml
init(11:18:11+18*(nregions-1))=ones(1,nregions)*0.02;   % initial condition for M1 (Proinflammatory microglias) in g/ml
init(12:18:12+18*(nregions-1))=ones(1,nregions)*0.02;   % initial condition for M2 (Anti-inflammatory microglias) in g/ml
init(13:18:13+18*(nregions-1))=ones(1,nregions)*0 ; % initial condition for M1hat  (Peripheral pro-inflammatory macrophages) in g/ml
init(14:18:14+18*(nregions-1))=ones(1,nregions)*0 ; % initial condition for M2hat  (Peripheral anti-inflammatory macrophages) in g/ml
init(15:18:15+18*(nregions-1))=ones(1,nregions)*10.^-6 ;  % initial condition for T_Beta (TGF-Beta = Transforming growth factor beta) in g/ml
init(16:18:16+18*(nregions-1))=ones(1,nregions)*10.^-5 ;  % initial condition for I_10 (IL-10 =Interleukin 10 ) in g/ml
init(17:18:17+18*(nregions-1))=ones(1,nregions)*2.*10.^-5 ;  % initial condition for T_alpha (TNF-alpha = Tumor necrosis factor alpha) in g/ml
init(18:18:18+18*(nregions-1))=ones(1,nregions)*5.*10.^-9 ;  % initial condition for P (MCP-1) in g/ml
end