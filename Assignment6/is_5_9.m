clear all
close all
clc

syms C
syms eta

x = [1 , -1 , -1 , 1];
y = [1 , 1, -1 , -1];

for i=1:4
N(i) = (1.0 + x(i)*C)*(1.0 + y(i)*eta)/4.0;
end

Nodes_coordinates = [1,1 ; -1,1 ; -2,-1 ; 2,-1];
s = size(Nodes_coordinates);
for i = 1:s(1)
    x1(i) = Nodes_coordinates(i,1);
    y1(i) = Nodes_coordinates(i,2);
end

%Part A
%Shape Functions
N

%Plotted Shape Functions
for i = 1:4
    figure(i);
    fsurf(N(i),[-1,1,-1,1]);
end

%X = Sum(Ni * Xi)
X = N(1)*x1(1) + N(2)*x1(2)+ N(3)*x1(3) + N(4)*x1(4) 
%Y = Sum(Ni * Yi)
Y = N(1)*y1(1) + N(2)*y1(2) + N(3)*y1(3) + N(4)*y1(4) 

%Part B
%Difrentiation
%Diffrentiation Output
diff_X_C = diff(X,C)
diff_X_eta = diff(X,eta)
diff_Y_C = diff(Y,C)
diff_Y_eta = diff(Y,eta)

%Jacobian 
J = [diff_X_C , diff_Y_C ; diff_X_eta , diff_Y_eta ];
J_inv = inv(J);

%Diffrentiation of N1 
diff_N1_c = diff(N(1),C)
diff_N1_eta = diff(N(1),eta)
diff_N1 = [diff_N1_c ; diff_N1_eta]
P = (J_inv) * (diff_N1)

diff_N2_c = diff(N(2),C)
diff_N2_eta = diff(N(2),eta)
diff_N2 = [diff_N2_c ; diff_N2_eta]
Q = (J_inv) * (diff_N2)

diff_N3_c = diff(N(3),C)
diff_N3_eta = diff(N(3),eta)
diff_N3 = [diff_N3_c ; diff_N3_eta]
R = (J_inv) * (diff_N3)

diff_N4_c = diff(N(4),C)
diff_N4_eta = diff(N(4),eta)
diff_N4 = [diff_N4_c ; diff_N4_eta]
S = (J_inv) * (diff_N4)

J

%Part C
%Jacobian at (1,-1)
subs(J,{C,eta},{1,-1})
%Jacobian at (0.5,0.5)
subs(J,{C,eta},{0.5,0.5})

