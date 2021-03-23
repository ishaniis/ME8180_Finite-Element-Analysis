% this program can only work with 1x1, 2x2, 3x3 gaussian points
% Please enter the number of rows and columns accordingly
clc
clear
close all

nR = input(sprintf('Number of Rows ? '));
nC = input(sprintf('Number of Columns ?'));

apx_1 = zeros(nR*nC,2);
bwx_1 = zeros(nR*nC,1);

if nR == 1 && nC == 1
    Xi = 0;
    Ci = 4;
elseif nR == 2 && nC == 2
    Xi = [-1/sqrt(3) 1.0/sqrt(3)];
    Ci = [1; 1] * [1, 1];
elseif nR == 3 && nC == 3
    Xi = [-sqrt(3/5) 0 sqrt(3/5)];
    Ci = [5/9; 8/9; 5/9]*[5/9 8/9 5/9];
end

k=1;   
for i = 1:nR
    for j = 1:nC
        apx_1(k,1:2) = [Xi(i) Xi(j)];
        bwx_1(k,1) = Ci(i,j);
        k = k+1;
    end
end

syms X Y
%5.10 a)
f1 = Xi^4;
ans1 = 0;
for i = 1:(nR*nC)
    ans1 = ans1 + subs(f1,Xi,apx_1(i,1))*bwx_1(i,1);
end
fprintf('Answer 5.10a)')
ans1

%5.10 b)
f1 = (Xi^4)*(Y^4);
ans2 = 0;
for i = 1:(nR*nC)
    ans2 = ans2 + subs(f1,{Xi,Y},{apx_1(i,1),apx_1(i,2)})*bwx_1(i,1);
end
fprintf('Answer 5.10b)')
ans2  

%5.10 c)
f1 = cos((pi*Xi)/2)*cos((pi*Y)/2);
ans4 = 0;
for i = 1:(nR*nC)
    ans4 = ans4 + subs(f1,{Xi,Y},{apx_1(i,1),apx_1(i,2)})*bwx_1(i,1);
end
fprintf('Answer 5.10c)')
ans3 = eval(ans4)