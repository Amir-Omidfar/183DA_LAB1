function findJ = jacobian_Matrix()
% Create symbols for theta.
syms t1 t2 t3 t4 t5; 
pi = sym('pi');

L2 = 450;
L4 = 100;
L5 = 600;
t5=0;
% Transformation matrix and matrix multiplication to obtain end effector.
T01 = T_matrix(0, 0, t1, 0);
T12 = T_matrix(0, 0, L2, t2+(pi/2));
T23 = T_matrix(pi/2, 0, t3, (pi/2) );
T34 = T_matrix((pi/2) , L4, 0, t4 );
T45 = T_matrix((pi/2), L5, t5, pi);
T05 = T01*T12*T23*T34*T45;
EE = T05*[0;0;0;1];

Px = EE(1);
Py = EE(2);
Pz = EE(3);

findJ = [diff(Px,t1), diff(Px,t2), diff(Px,t3), diff(Px,t4);
         diff(Py,t1), diff(Py,t2), diff(Py,t3), diff(Py,t4);
         diff(Pz,t1), diff(Pz,t2), diff(Pz,t3), diff(Pz,t4)];