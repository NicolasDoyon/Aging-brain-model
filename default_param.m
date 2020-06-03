function p=default_param()
%NO INPUT
%OUTPUT: p an bject containing the values of the parameters as given in Hao

%Parameters of Table 2.
    p.DAO=4.32*10^(-2);%Diffusion coefficient
    p.DH=8.11* 10^(-2); %Diffusion coefficient
    p.DTbeta=6.55*10^(-2);%Diffusion coefficient
    p.DI10=6.55*10^(-2);%Diffusion coefficient
    p.DTalpha=6.55*10^(-2);%Diffusion coefficient
    p.DP=1.2*10^(-1);%Diffusion coefficient
    
    p.lambdai=9.51.*10.^-6;  % lambda_{beta}^i : Production rate of ABi in g/ml/day
    p.lambdaN=8.*10.^-11;         %lambda_N : Production rate of ABO by neuron in g/ml/day
    p.lambdaA=p.lambdaN.*10.^-1;   %lambda_A : Production rate of ABO by astrocytes in g/ml/day
    p.lambdatau0=8.1.*10.^-11;      % Production rate of tau proteins in health in g/ml/day 
    p.lambdatau=1.35.*10.^-11;      % Production rate of tau proteins by ROS in g/ml
    p.dtau=0.277;                   %  Degradation rate of tau proteins in day
    p.lambdaF=1.662.*10.^-3;     % Production rate of NFT by tau in day
    p.lambdaATAlpha=1.54; % Production/activation rate of astrocytes by TNF-alpha in day 
    p.lambdaAABo=1.793; % Production/activation rate of astrocytes by ABO in day
    p.lambdaA_O=0.19;      % Production rate of AO in day
    p.lambdaH=3.*10.^-5; %Production rate of HMGB-1 in day 
    p.lambda_MF= 2.*10.^-2; % Production/activation rate of microglias by NFT in day
    p.lambda_MA=1.*10.^-2; % Production/activation rate of microglias by astrocytes in day
    p.lambda_M1TBeta=6.*10.^-3; % Rate of M1 → M2
    p.lambda_M1hatTBeta=1.5.*10.^-3; % Rate of ˆM1 → ˆM2 in day
    p.lambda_TBetaM=1.5.*10.^-2 ; % Production rate of TGF-Beta by M in day^−1
    p.lambda_TbetaMhat=1.5.*10.^-4 ; % Production rate of TGF-Beta by Mhat in day^−1
    p.lambda_TalphaM1= 3.*10.^-2; % Production rate of TNF-alpha by M1  day^−1
    p.lambda_TalphaM1hat= 3.*10.^-2; % Production rate of TNF-alpha by M1hat  day^−1
    p.lambda_I10M2= 6.67.*10.^-3; % Production rate of IL-10 by M2 in day^−1
    p.lambda_I10M2hat= 6.67.*10.^-3; % Production rate of IL-10 by M2hat in day^−1
    p.lambda_PA=6.6.*10.^-8 ; % Production rate of MCP-1 by astrocytes in day^−1
    p.lambda_PM2=1.32.*10.^-7 ; % Production rate of MCP-1 by M2 in day^−1
    
    p.theta=0.9;   % M2/M1 effectivity in clearance of ABO 
    p.alpha=5; % Flux rate of macrophages
    p.beta= 10; % Proinflammatory/anti-inflammatory ratio 
    p.gamma=1;      % I10 inhibition ratio
    
%Parameters of table 3:

    p.di=9.51;  % d_{ABi}:  Degradation rate of ABi in day
    p.dAB0M=8.*10.^-8;   %d_{A^0_{\beta}M} : Clearance rate of ABO by microglia in day
    p.dAB0Mhat=4.*10^-7;  %d_{A^0_{\beta}\hat{M}} : Clearance rate of ABO by macrophages in day
    p.dFi=2.77.*10.^-3;          % Degradation rate of intracellular NFT in day
    p.dFO=2.77.*10.^-4;       % Degradation rate of extracellular NFT in day
    p.dNF=0.27.*10.^-4; % Death rate of neurons by NFTs in day
    p.dNT=3.*10.^-4; %Death rate of neurons by TNF-α 
    p.dNdM=10.^-3;  % Clearance rate of dead neurons by M in day 
    p.dNdMhat=5.*10.^-4; % Clearance rate of dead neurons by M^{hat} in day
    p.dA=1.2.*10.^-5;  % Death rate of astrocytes in day^{-1}
    p.dM1= 0.015; %Death rate of M1 microglias in day^−1
    p.dM2=0.015;  % Death rate of M2 microglias day^−1 
    p.dM1hat=0.015 ; % Death rate of M1 macrophages in day^−1
    p.dM2hat=0.015 ; % Death rate of M2 macrophages in day^−1
    p.dA_O=0.951;% Degradation rate of AO in day
    p.dH=58.71; % Degradation rate of HMGB-1 in day  
    p.dT_alpha=55.45 ; % Degradation rate of TNF-alpha in  day^−1 
    p.dT_Beta=3.33.*10.^2 ; % Degradation rate of TGF-Beta in day^−1
    p.dI_10= 16.64; % Degradation rate of IL-10 in day^−1
    p.dP= 1.73;% Degradation rate of MCP-1  day^−1
      
    p.R0=6;    % Initial inflammation by ROS
    p.M0=5.*10^-2 ; %Monocytes concentration in blood 
    p.N0=0.14;   % Reference density of neuron in g/cm^3
    p.MGO=0.047;  % Source of microglia in g/cm^3
    p.A0=0.14; % initial condition for A (Astrocytes) in g/ml   ..... Note that y60 is the A0
        
    p.K_AB0hat=7.*10.^-3;       % hat{K}_{A^0_{\beta}} : Michaelis-Mention coefficient for ABO in g/cm3
    p.KNdbar=10.^-3; % Michaelis-Mention coefficient for Nd in g/ml
    p.K_I10= 2.5.*10.^-6; % Half-saturation of IL-10 in g/cm^3
    p.K_TBeta=2.5.*10.^-7 ; % Half-saturation of TGF-Beta in g/ml
    p.KI10=2.5.*10.^-6; % Half-saturation of IL-10 in g/cm3 
    p.KFi=3.36.*10.^-10;  % Half-saturation of intracellular NFTs in g/ml
    p.KTAlpha=4.*10.^-5;  % Half-saturation of TNF-alpha  in g/ml
    p.K_FO=10.^-11; %Average of extracellular NFTs  in g/ml
    p.K_AO=1.*10.^-7; %Average of of ABO in g/ml
    p.K_P=1.2.*10.^-8; %Half-saturation of MCP-1 in g/ml
    p.K_TAlpha= 4.*10.^-5; % Half-saturation of TNF-alpha in g/ml
   
    
    
   
    
    
   
    
%....................................................
             
end