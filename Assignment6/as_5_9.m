clc
clear
close all

n = 2;
x = [-1 1];
y = [1 -1];
xa = [-1 1; -2 2];
ya = [1 1; -1 -1];
dxc = 0;
dxn = 0;
dyc = 0;
dyn = 0;
syms X;
syms Y;

Nc = cell(n,n);
Nc{n,n} = [];
Nn = cell(n,n);
Nn{n,n} = [];
N = cell(n,n);
N{n,n} = [];
dNc = cell(n,n);
dNc{n,n} = [];
dNn = cell(n,n);
dNn{n,n} = [];
dNx = cell(n,n);
dNx{n,n} = [];
dNy = cell(n,n);
dNy{n,n} = [];
J = cell(n,n);
J{n,n} = [];

for i = 1:n
    for j = 1:n
        Nc{i,j} = 1;
        Nn{i,j} = 1;        
    end
end
Nc
Nn
%Computing the X
for k = 1:n
    for i = 1:n
        for j = 1:n
            if i ~= j
                Nc{k,i} = Nc{k,i}*((X - x(j))/(x(i) - x(j)));
            end
        end        
    end
end

%Computing the Y
for k = 1:n
    for i = 1:n
        for j = 1:n
            if i ~= j
                Nn{i,k} = Nn{i,k}*((Y - y(j))/(y(i) - y(j)));
            end
        end        
    end
end

for i = 1:n
    for j = 1:n
        N{i,j} = Nc{i,j}*Nn{i,j};
        dNc{i,j} = diff(N{i,j},X);
        dNn{i,j} = diff(N{i,j},Y);
       
    end
end

for i = 1:n
    for j = 1:n
        dxc = dxc + dNc{i,j}*xa(i,j);
        dxn = dxn + dNn{i,j}*xa(i,j); 
        dyc = dyc + dNc{i,j}*ya(i,j);
        dyn = dyn + dNn{i,j}*ya(i,j); 
    end
end

J{1,1} = dxc;
J{1,2} = dyc;
J{2,1} = dxn;
J{2,2} = dyn;

subs(J,{X,Y},{1,-1})
subs(J,{X,Y},{0.5,0.5});


for i = 1:n
    for j = 1:n
        dNx{i,j} = dNc{i,j}./dxc;
        dNy{i,j} = dNn{i,j}./dxn;
    end
end