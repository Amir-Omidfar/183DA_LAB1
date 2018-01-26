%%%%%%%%%%% finding transfom function T(from i to i-1)
%%%%%%%%%% Use this function as a part of TransformCalcHelper

function Transform = T(alpha,a,d,theta)

Transform = zeros(4);

Transform(1,1)=cos(theta);
Transform(1,2)= -sin(theta);
Transform(1,3)= 0;
Transform(1,4)= a;

Transform(2,1)= sin(theta)*cos(alpha);
Transform(2,2)= cos(theta)*cos(alpha);
Transform(2,3)= -sin(alpha);
Transform(2,4)= -sin(alpha)*d;

Transform(3,1)= sin(theta)*sin(alpha);
Transform(3,2)= cos(theta)*sin(alpha);
Transform(3,3)= cos(alpha);
Transform(3,4)= cos(alpha)*d;

Transform(4,1)=0;
Transform(4,2)=0;
Transform(4,3)=0;
Transform(4,4)=1;
end