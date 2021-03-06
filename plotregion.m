function plotregion(regplot,t,y)

subplot(4,5,1)
plot(t,y(:,1+18*(regplot-1)))
axis([0 2000 0 1.*10.^-5])
xlabel('Time (day)')
ylabel('Abi')
%.......... figure for ABO
subplot(4,5,2)
plot(t,y(:,2+18*(regplot-1)))
axis([0 2000 0 1.*10.^-6])
xlabel('Time (day)')
ylabel('Abo')
%........... figure for tau
subplot(4,5,3)
plot(t,y(:,3+18*(regplot-1)))
axis([0 2000 0 1.*10.^-9])
xlabel('Time (day)')
ylabel('tau')
%............ figure for Fi
subplot(4,5,4)
plot(t,y(:,4+18*(regplot-1)))
axis([0 2000 3.*10.^-10 4.*10.^-10])
xlabel('Time (day)')
ylabel('Fi')
%............figure for F0
subplot(4,5,5)
plot(t,y(:,5+18*(regplot-1)))
axis([0 2000 2.5.*10.^-11 3.5.*10.^-11])
xlabel('Time (day)')
ylabel('F0')
%.......... figure for N
subplot(4,5,6)
plot(t,y(:,6+18*(regplot-1)))
axis([0 2000 0 0.2])
xlabel('Time (day)')
ylabel('N')
%.......... figure for A
subplot(4,5,7)
plot(t,y(:,7+18*(regplot-1)))
axis([0 2000 0 0.4])
xlabel('Time (day)')
ylabel('A')
%....... figure for Nd
subplot(4,5,8)
plot(t,y(:,8+18*(regplot-1)))
axis([0 2000 0 5.*10.^-4])
xlabel('Time (day)')
ylabel('Nd')
%...... figure for AO 
subplot(4,5,9)
plot(t,y(:,9+18*(regplot-1)))
axis([0 2000 0 2.*10.^-7])
xlabel('Time (day)')
ylabel('AO')
%...... figure for HMGB-1 (High Mobility Group Box 1 protein)
subplot(4,5,10)
plot(t,y(:,10+18*(regplot-1)))
axis([0 2000 0 4.*10.^-10])
xlabel('Time (day)')
ylabel('H')
%...... figure for M1
subplot(4,5,11)
plot(t,y(:,11+18*(regplot-1)))
axis([0 2000 0.02 0.06])
xlabel('Time (day)')
ylabel('M1')
%...... figure for M2
subplot(4,5,12)
plot(t,y(:,12+18*(regplot-1)))
axis([0 2000 0 0.02])
xlabel('Time (day)')
ylabel('M2')
%...... figure for M1hat
subplot(4,5,13)
plot(t,y(:,13+18*(regplot-1)))
axis([0 2000 0.02 0.06])
xlabel('Time (day)')
ylabel('M1 hat')

%...... figure for M2hat
subplot(4,5,14)
plot(t,y(:,14+18*(regplot-1)))
axis([0 2000 4.*10^-3 8.*10.^-3])
xlabel('Time (day)')
ylabel('M2 hat')
%...... figure for T_Beta
subplot(4,5,15)
plot(t,y(:,15+18*(regplot-1)))
axis([0 2000 0 1.*10.^-6])
xlabel('Time (day)')
ylabel('T beta')
%...... figure for I_alpha
subplot(4,5,16)
plot(t,y(:,16+18*(regplot-1)))
axis([0 2000 0 1.*10.^-5])
xlabel('Time (day)')
ylabel('I 10')
%...................................................................
% In the paper the order is changed! (First: T_alpha then: I_alpha)
%...................................................................
%...... figure for T_alpha
subplot(4,5,17)
plot(t,y(:,17+18*(regplot-1)))
axis([0 2000 0 6.*10.^-5])
xlabel('Time (day)')
ylabel('T alpha')
%...... figure for P
subplot(4,5,18)
plot(t,y(:,18+18*(regplot-1)))
axis([0 2000 0 2.*10.^-8])
xlabel('Time (day)')
ylabel('P')
%figure

