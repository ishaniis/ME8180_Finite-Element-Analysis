%Problem 5.10

% Gaussian 1 X 1 system
% Gaussian 2 X 2 System
% Gaussian 3 X 3 system

clc
clear
close all

nR = input(sprintf('number of Rows? '));
nC = input(sprintf('Number of Columns ?'));

zero_nR = zeros(nR*nC,2);
zero_nC = zeros(nR*nC,1);

if nR == 1 && nC == 1
    Xi = 0;
    Wi = 4;
elseif nR == 2 && nC == 2
    Xi = [-1/sqrt(3) 1.0/sqrt(3)];
    Wi = [1; 1] * [1, 1];
elseif nR == 3 && nC == 3
    Xi = [-sqrt(3/5) 0 sqrt(3/5)];
    Wi = [5/9; 8/9; 5/9]*[5/9 8/9 5/9];
end

k=1;   
for i = 1:nR
    for j = 1:nC
        zero_nR(k,1:2) = [Xi(i) Xi(j)];
        zero_nC(k,1) = Wi(i,j);
        k = k+1;
    end
end

syms X Y
%5.10 a)
f1 = Xi^4;
ans5_1_a = 0;
for i = 1:(nR*nC)
    ans5_1_a = ans5_1_a + subs(f1,Xi,zero_nR(i,1))*zero_nC(i,1);
end
fprintf('Answer for 5.10a)')
ans5_1_a

%5.10 b)
f1 = (Xi^4)*(Y^4);
ans5_1_b = 0;
for i = 1:(nR*nC)
    ans5_1_b = ans5_1_b + subs(f1,{Xi,Y},{zero_nR(i,1),zero_nR(i,2)})*zero_nC(i,1);
end
fprintf('Answer for 5.10b)')
ans5_1_b  

%5.10 c)
f1 = cos((pi*Xi)/2)*cos((pi*Y)/2);
ans5_1_c = 0;
for i = 1:(nR*nC)
    ans5_1_c = ans5_1_c + subs(f1,{Xi,Y},{zero_nR(i,1),zero_nR(i,2)})*zero_nC(i,1);
end
fprintf('Answer for 5.10c)')
ans3 = eval(ans5_1_c)