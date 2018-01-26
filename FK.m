function position = FK(q1, q2, q3, q4)

pi = sym('pi');
%Takes user input
t_1 = q1;
t_2 = q2;
t_3 = q3;
t_4 = q4;
t_5 = pi;

L2 = 450;
L4 = 100;
L5 = 600;


%Transformation matrix of each joint, based on our D-H parameters
T_1 = T_matrix(0, 0, t_1, 0);
T_2 = T_matrix(0, 0, L2, t_2+(pi/2));
T_3 = T_matrix(pi/2, 0, t_3, (pi/2) );
T_4 = T_matrix((pi/2) , L4, 0, t_4 );
T_5 = T_matrix((pi/2), L5, 0, t_5);
%Matrix Multiplication to get transformation matrix of end effector(EE).
T_5 = T_1*T_2*T_3*T_4*T_5;
EE = T_5*[0;0;0;1];
%Show output.
digits(6);
position = vpa(subs(EE));
position = position(1:3);

end