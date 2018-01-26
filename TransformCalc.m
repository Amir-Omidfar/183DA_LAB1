

%%%% input D-H to get transformation matrix
%%%% Return Final transformation matrix from n+1 (5) to origion (0)
%%%% Also return a 4 by 20 matrix of all transformation matrices(from i to i-1)
%%%% q is 4 by one vector including all joints variable s
%%%% q(1)=d1, q(2)=theta2 q(3)=d3 q(4)=theta4
function [T_a,T] = Transform(q)
L2 = 450;
L4 = 100;
L5 = 600;
d1 = q(1);
theta2 = q(2);
d3 = q(3);
theta4 =q(4);

DH = [0,0,d1,0;
    0,0,L2,(pi/2)+theta2; ...
    pi/2,0,d3,pi/2; ...
    pi/2,L4,0,theta4; ...
    pi/2,L5,0,pi];  

alpha = DH(:,1);
a = DH(:,2);
d = DH(:,3);
theta = DH (:,4);
T = eye(4); 
T_a= zeros(4,4);
for i= 5:-1:1
   temp = TransformCalcHelper(alpha(i),a(i),d(i),theta(i));
   T_a = [temp,T_a];
   T=temp*T;
end 
T_a = T_a(:,1:20);
end