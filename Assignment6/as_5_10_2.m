%Problem 5.10

% Gaussian 1 X 1 system
% Gaussian 2 X 2 System
% Gaussian 3 X 3 system

clc
clear
close all

nr = input(sprintf('Number of rows ?'));
nc = input(sprintf('Number of columns ?'));

abx = zeros(nr*nc,2);
pqx = zeros(nr*nc,1);

if nr == 1 && nc == 1
    x = 0;
    w = 4;
elseif nr == 2 && nc == 2
    x = [-1/sqrt(3) 1.0/sqrt(3)];
    w = [1; 1] * [1, 1];
elseif nr == 3 && nc == 3
    x = [-sqrt(3/5) 0 sqrt(3/5)];
    w = [5/9; 8/9; 5/9]*[5/9 8/9 5/9];
end

k=1;   
for i = 1:nr
    for j = 1:nc
        abx(k,1:2) = [x(i) x(j)];
        pqx(k,1) = w(i,j);
        k = k+1;
    end
end

syms X Y
%Question 5.10 (a)
f1 = X^4;
ans1 = 0;
for i = 1:(nr*nc)
    ans1 = ans1 + subs(f1,X,abx(i,1))*pqx(i,1);
end
fprintf('5.10(a):')
ans1

% Question 5.10 b)
f1 = (X^4)*(Y^4);
ans2 = 0;
for i = 1:(nr*nc)
    ans2 = ans2 + subs(f1,{X,Y},{abx(i,1),abx(i,2)})*pqx(i,1);
end
fprintf('5.10(b):')
ans2  

%Question 5.10 c)
f1 = cos((pi*X)/2)*cos((pi*Y)/2);
ans4 = 0;
for i = 1:(nr*nc)
    ans4 = ans4 + subs(f1,{X,Y},{abx(i,1),abx(i,2)})*pqx(i,1);
end
fprintf('5.10(c):')
ans3 = eval(ans4)