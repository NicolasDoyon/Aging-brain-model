
function [t,y] = SolveSystem(init,p,nregions,connec)
%INPUT
%nregions: a positive integer, the number of brain regions
%connec: a n times n square matrix, can be a sparse matrix.  The sum of
%each line must be equal to zeros.  The entries on the main diagonal must be non positive
%and the entries off the main diagonal must be non negative
%init: A vector containing the initial conditions, this must be a vector of
%length 18*nregions
%p: an object containing the values of the parameters

%OUTPUT:
%t: a vector of positive integers containing time points
%y: A matrix containing the values of the variables  

tspan = [0 3650]; % Setting the time interval to 10 years

options = odeset('RelTol',1e-5);
[t,y] = ode23t( @(t,y)Hao1to18(t,y,p,nregions,connec) ,tspan ,init,options);

function dydt = Hao1to18 (t,y,p,nregions,connec)
    dydt=zeros(18*nregions,1); 
    R=p.R0*(1-exp(-t/100));%Replacing the ROS function by a differentiable one
    
    Rfactor=zeros(nregions,1);%Assuming that ROS occurs only in the hippocampus
    Rfactor(5)=1;
    Rfactor(12)=1;
    %equation 1.... Eq for Amyloid Beta inside the neurons
    for j=1:nregions
        dydt(1+18*(j-1))=(p.lambdai.*(1+R*Rfactor(j))- p.di.*y(1+18*(j-1))).*(y(6+18*(j-1))/p.N0);
    end
    for j=1:nregions
        % AA is the value of abs(dydt(6))
        AA=abs(-p.dNF.*(y(4+18*(j-1))/(y(4+18*(j-1))+p.KFi)).*y(6+18*(j-1))-p.dNT.*(y(17+18*(j-1))/(y(17+18*(j-1))+p.KTAlpha)).*(1/(1+(p.gamma.*y(16+18*(j-1)))/p.KI10)).*y(6+18*(j-1)));
        %%%%%%%%%% equation 2 .... Eq for Amyloid Beta outside the neorons
        dydt(2+18*(j-1))=y(1+18*(j-1)).*AA+p.lambdaN.*(y(6+18*(j-1))/p.N0)+p.lambdaA.*(y(7+18*(j-1))/p.A0)-(p.dAB0Mhat.*(y(13+18*(j-1))+p.theta.*y(14+18*(j-1)))+p.dAB0M.*(y(11+18*(j-1))+p.theta.*y(12+18*(j-1)))).*(y(2+18*(j-1))/(y(2+18*(j-1))+p.K_AB0hat));
        dydt(3+18*(j-1))=(p.lambdatau0+p.lambdatau.*R-p.dtau.*y(3+18*(j-1))).*(y(6+18*(j-1))/p.N0);%%%%%%%%%%%%%%%%%%%% equation 4 ......Eq for NFT inside the neorons%........................................
        dydt(4+18*(j-1))=(p.lambdaF.*y(3+18*(j-1))-p.dFi.*y(4+18*(j-1))).*(y(6+18*(j-1))/p.N0);
        dydt(5+18*(j-1))=y(4+18*(j-1)).*abs(dydt(6+18*(j-1)))-p.dFO.*y(5+18*(j-1));
        dydt(6+18*(j-1))=-p.dNF.*(y(4+18*(j-1))/(y(4+18*(j-1))+p.KFi)).*y(6+18*(j-1))-p.dNT.*(y(17+18*(j-1))/(y(17+18*(j-1))+p.KTAlpha)).*(1/(1+(p.gamma.*y(16+18*(j-1)))/p.KI10)).*y(6+18*(j-1));
        %%%%%%%%%%%%%%%%%%% equation 7 ...... Eq for Astrocytes
        dydt(7+18*(j-1))=p.lambdaAABo.*y(2+18*(j-1))+p.lambdaATAlpha.* y(17+18*(j-1))-p.dA.*y(7+18*(j-1));
        %%%%%%%%%%%%%%%%%%% equation 8 ...... Eq for dead neorons Nd 
        %..................................
        dydt(8+18*(j-1))=p.dNF.*(y(4+18*(j-1))/(y(4+18*(j-1))+p.KFi)).*y(6+18*(j-1))+p.dNT.*(y(17+18*(j-1))/(y(17+18*(j-1))+p.KTAlpha)).*(1/(1+(p.gamma.*y(16+18*(j-1)))/p.KI10)).*y(6+18*(j-1))-p.dNdM.*(y(11+18*(j-1))+y(12+18*(j-1))).*(y(8+18*(j-1))/(y(8+18*(j-1))+p.KNdbar))-p.dNdMhat.*(y(13)+y(14)).*(y(8+18*(j-1))/(y(8+18*(j-1))+p.KNdbar));
        %%%%%%%%%% equation 9 .... Eq for Amyloid Beta Oligomers
        if nregions==1
            dydt(9+18*(j-1))=p.lambdaA_O.*y(2+18*(j-1))-p.dA_O.*y(9+18*(j-1));
        else
            dydt(9+18*(j-1))=p.DAO*sum(connec(:,j).*y(9:18:9+18*(nregions-1)))+p.lambdaA_O.*y(2+18*(j-1))-p.dA_O.*y(9+18*(j-1));
        end
        %%%%%%%%%% equation 10 .... Eq for HMGB-1 (High Mobility Group Box 1 protein)
        if nregions==1
            dydt(10+18*(j-1))=p.lambdaH.*y(8+18*(j-1))-p.dH.*y(10+18*(j-1));
        else
            dydt(10+18*(j-1))=p.DH*sum(connec(:,j).*y(10:18:10+18*(nregions-1)))+p.lambdaH.*y(8+18*(j-1))-p.dH.*y(10+18*(j-1));
        end
        %%%%%%%%%% equation 11 .... Eq for M1
        %%%%%%%%%% equation 12 .... Eq for M2
        part11_1=p.lambda_MF.*(y(5+18*(j-1))/(y(5+18*(j-1))+p.K_FO))+p.lambda_MA.*(y(9+18*(j-1))/(y(9+18*(j-1))+p.K_AO));
        part11_2=p.lambda_M1TBeta.*(y(15+18*(j-1))/(y(15+18*(j-1))+p.K_TBeta)).*y(11+18*(j-1));
        epsilon1= y(17)/(y(17)+p.K_TAlpha) ;
        epsilon2= y(16)/(y(16)+p.K_I10) ;
        dydt(11+18*(j-1))=p.MGO.*part11_1.*(p.beta.*epsilon1/(p.beta.*epsilon1+epsilon2))-part11_2-p.dM1.*y(11+18*(j-1)) ;
        dydt(12+18*(j-1))= p.MGO.*part11_1.*(epsilon2/(p.beta.*epsilon1+epsilon2))+part11_2-p.dM2.*y(12+18*(j-1)) ;
        %%%%%%%%%% equation 13 .... Eq for M1hat
        %%%%%%%%%% equation 14..... Eq for M2 hat
        p.alphaP=p.alpha.*(y(18+18*(j-1))/(y(18+18*(j-1))+p.K_P));
        Mhat=y(13)+y(14);
        part13_1=p.alphaP.*(p.M0-Mhat) ;
        part13_2 =p.lambda_M1hatTBeta.*(y(15+18*(j-1))/y(15+18*(j-1))+p.K_TBeta).*y(13+18*(j-1));
        %....................................................
        dydt(13+18*(j-1))= part13_1.*(p.beta.*epsilon1/(p.beta.*epsilon1+epsilon2))-part13_2-p.dM1hat.*y(13+18*(j-1));
        dydt(14+18*(j-1))=part13_1.*(epsilon2/(p.beta.*epsilon1+epsilon2))+part13_2-p.dM2hat.*y(14+18*(j-1)) ;
        %%%%%%%%%% equation 15 .... Eq for T_{beta}...... (TGF-Beta = Transforming growth factor beta)
        if nregions==1
            dydt(15+18*(j-1))=p.lambda_TBetaM.*y(12+18*(j-1))+p.lambda_TbetaMhat .*y(14+18*(j-1))-p.dT_Beta.*y(15+18*(j-1));
        else
            dydt(15+18*(j-1))=p.DTbeta*sum(connec(:,j).*y(15:18:15+18*(nregions-1)))+p.lambda_TBetaM.*y(12+18*(j-1))+p.lambda_TbetaMhat .*y(14+18*(j-1))-p.dT_Beta.*y(15+18*(j-1));
        end
        %%%%%%%%%% equation 16 .... Eq for I_10 .... (IL-10 =Interleukin 10 )
        % In the paper there are lambda_I10M and lambda_I10Mhat But in the table page 11 we have lambda_I10M2 and lambda_I10M2hat !!!
        if nregions==1
            dydt(16+18*(j-1))=p.lambda_I10M2.*y(12+18*(j-1))+p.lambda_I10M2hat .*y(14+18*(j-1)) -p.dI_10.*y(16+18*(j-1));
        else
            dydt(16+18*(j-1))=p.DI10*sum(connec(:,j).*y(16:18:16+18*(nregions-1))) +p.lambda_I10M2.*y(12+18*(j-1))+p.lambda_I10M2hat .*y(14+18*(j-1)) -p.dI_10.*y(16+18*(j-1));
        end
        if nregions==1
            dydt(17+18*(j-1))=p.lambda_TalphaM1.*y(11+18*(j-1))+p.lambda_TalphaM1hat.*y(13+18*(j-1)) -p.dT_alpha.*y(17+18*(j-1)) ;
        else
            dydt(17+18*(j-1))=p.DTalpha*sum(connec(:,j).*y(17:18:17+18*(nregions-1)))+p.lambda_TalphaM1.*y(11+18*(j-1))+p.lambda_TalphaM1hat.*y(13+18*(j-1)) -p.dT_alpha.*y(17+18*(j-1)) ;
        end
        %%%%%%%%% equation 18 .... Eq for P (MCP-1)
        %....................................................
        if nregions==1
            dydt(18+18*(j-1))= p.lambda_PA.*y(7+18*(j-1))+p.lambda_PM2.*y(12+18*(j-1)) -p.dP.*y(18+18*(j-1));
        else
            dydt(18+18*(j-1))= p.DP*sum(connec(:,j).*y(18:18:18+18*(nregions-1)))+p.lambda_PA.*y(7+18*(j-1))+p.lambda_PM2.*y(12+18*(j-1)) -p.dP.*y(18+18*(j-1));
        end
    end
end
end