function J = CompJacobian2D(element_nodes,Nxi,Neta)
J = zeros(2,2);
for j=1:2
    J(1,j) = Nxi' * element_nodes(;,j);
    J(2,j) = Neta' * element_nodes(;,j);
end    