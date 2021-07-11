clc
clear
close all

%Custom Program to generate the customized mesh as per the requirement
%Mesh for Fine Mesh Model Scenario has been
%generated using the same
%Free Variables
%Number_Elements_y
%Number_Element_x

Starting_Node_x = 0;
Starting_Node_y = 0;
Ending_Node_x = 0.2;
Ending_Node_y = 0.01;
Number_Element_x = 160;
Number_Elements_y = 8;

[x,y]=meshgrid(Starting_Node_x:(Ending_Node_x-Starting_Node_x)/Number_Element_x:Ending_Node_x, Starting_Node_y:(Ending_Node_y-Starting_Node_y)/Number_Elements_y:Ending_Node_y);  % x,y matrices of
                                                     % the grid points
nodes=zeros((Number_Element_x+1)*(Number_Elements_y+1),3);  % empty nodes matrix
elements=zeros(Number_Element_x*Number_Elements_y,5);       % empty elements matrix
nids=zeros(Number_Elements_y+1,Number_Element_x+1);         % empty node ID matrix

% next 11 lines: create nodes
fid=fopen('nodes.dat','w+');   % open file "nodes.dat"
k=1;
for i=1:Number_Elements_y+1       % rows
  for j=1:Number_Element_x+1     % columns
    nids(i,j)=k;   % grid matrix of node IDs
    nodes(k,1:3)=[k x(i,j) y(i,j)];  
    fprintf(fid,'%d %.10f %.10f\n',k, x(i,j), y(i,j)); % write file
    k=k+1;
  end
end
fclose(fid);       % close "nodes.dat"

% next 13 lines: create elements
fid=fopen('elements.dat','w+'); % open file "elements.dat"
k=1;
for i=1:Number_Elements_y         % rows
  for j=1:Number_Element_x       % columns
    elements(k,1)=k;
    elements(k,2:3)=[nids(i,j) nids(i,j+1)];
    elements(k,4:5)=[nids(i+1,j+1) nids(i+1,j)]; 
    fprintf(fid,'%d %d %d %d %d \n', k, nids(i,j), ...
	          nids(i,j+1),nids(i+1,j+1),nids(i+1,j));
    k=k+1;
  end
end
fclose(fid);  % close "elements.dat"