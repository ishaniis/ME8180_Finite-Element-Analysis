clear all;
% next 3 lines: read the input files
filenames = {'nodes.dat','elements.dat','materials.dat', ...
             'options.dat','bcsforce.dat', 'bcsdisp.dat'};  
for i = 1:numel(filenames); load(filenames{i}); end;

% next 9 lines: set up global material properties and constants
E_YoungsModulus=materials(1,1);
nu=materials(2,1);
rho=materials(3,1);
damping_Coefficcent_K=materials(4,1);
damping_Mass_Coefficcent=materials(5,1);
Problem_Dimension=options(1,1);
thickness=options(2,1);
timePeriod=options(4,1);
dt=options(5,1);
probeNode=options(6,1);
% next 5 lines: bookkeeping 
n_nodes=size(nodes,1);
n_elements=size(elements,1);
n_bcsforce=size(bcsforce,1);
n_bcsdisp=size(bcsdisp,1);
n_timeSteps=timePeriod/dt+1;
% next 3 lines: set up empty matrices 
U_displacement=zeros(n_nodes*Problem_Dimension,n_timeSteps);
V_Velocity=zeros(n_nodes*Problem_Dimension,n_timeSteps);
A_Acceleration=zeros(n_nodes*Problem_Dimension,n_timeSteps);

%Compute Global K Matrix
K_Global=CompK(nodes, elements, materials);   
 % compute global M matrix
M_Global=CompM(nodes, elements, rho);        
C = damping_Mass_Coefficcent*M_Global + damping_Coefficcent_K*K_Global;                 % compute global C matrix
F=CompF(nodes, elements, thickness, bcsforce); % compute global F vector

% next 12 lines: time marching using Newmark Scheme
beta = 0.25;
gamma = 0.5;
LHS = M_Global*(1.0/(beta*dt*dt))+ C*(gamma/(beta*dt)) + K_Global; 
penalty=max(max(abs(LHS)))*1e+6;
A_Acceleration(:,1)=M_Global\F;  %initilization of accelecration
for t=2:n_timeSteps
  [U_displacement,V_Velocity,A_Acceleration]=Newmark(t,dt,beta, gamma, Problem_Dimension,... 
          K_Global,M_Global,C,F,bcsdisp,penalty,U_displacement,V_Velocity,A_Acceleration);
  if rem(t*100,(n_timeSteps-1)*5)==0
    fprintf('%d %%\n',floor(t*100/(n_timeSteps-1)));
  end
end

% next 9 lines: save the transient temperature results in file, plot
Uout=U_displacement(probeNode*2,:);
save -ascii -double Uout2.dat Uout
disp('Vertical displacement results stored in Uout.dat');
Uout(200:205)*1000
plot(Uout, 'LineWidth',2);
axis([0 90 -0.4e-3 0]);
xlabel('Time step');
ylabel('Displacement (m)');
set(gca,'fontsize',16);