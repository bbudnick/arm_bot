%Define all lenghts in mm 
L0 = 150; 
L1 = 110; %Mx1 to Mx2 -x-dir 
L2 = 77;  %Mx2 to Ax1 -x-dir 
L3 = 100; %Ax1 to Ax2 -x-dir 
L4 = 21;  %Ax2 center to Srew Axis y-dir
L5 = 58;  %Ax2 to Ax3 y-dir
L6 = 21;  %Ax2 center to Srew Axis y-dir
L7 = 56;  %Ax3 to Ax2 x-dir 
L8 = 240; %Ax3 to tip of pen -x-dir
L9 = 30;  %Ax3 to tip of pen z-dir

Xsum = (L1+L2+L3+(-L7)+L8);
Ysum = (L4+L5+L6);
Zsum = (L0+L9);

% Screw Axis 

% for S1 
r1 = [0;0;0];
q1 = [0;0;1];
v1 = cross(r1,q1);

% for S2 
r2 = [-(L1);0;0];
q2 = [0;0;1];
v2 = cross(r2,q2);

% for S3 
r3 = [-(L1+L2);0;0];
q3 = [0;0;1];
v3 = cross(r3,q3);

% for S4 
r4 = [-(L1+L2+L3);L4;0];
q4 = [0;-1;0];
v4 = cross(r4,q4);

% for S5 
r5 = [-(L1+L2+L3-L7);(L4+L5+L6);0];
q5 = [0;1;0];
v5 = cross(r5,q5);

%Screw Axis
S1 = [q1;v1]
S2 = [q2;v2]
S3 = [q3;v3]
S4 = [q4;v4]
S5 = [q5;v5]


Slist =[S1, S2, S3, S4, S5];

M = [[1,0,0,Xsum];   % double check orientation
     [0,1,0,-Ysum];
     [0,0,1,Zsum];
     [0,0,0,1]]
