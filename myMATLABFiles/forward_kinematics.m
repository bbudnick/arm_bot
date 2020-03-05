
clc;
clear;
addpath 'C:\Users\pv\Documents\GitHub\ModernRobotics\packages\MATLAB\mr'
% All units done in mm
L1 = 113; %Mx1 to Mx2 y-dir 
L2 = 78;  %Mx2 to Ax1 y-dir 
L3 = 100; %Ax1 to Ax2 y-dir 
L4 = 21;  %Ax2 center to Srew Axis x-dir
L5 = 57;  %Ax2 to Ax3 x-dir
L6 = 21;  %Ax2 center to Srew Axis x-dir
L7 = 54;  %Ax3 to Ax2 y-dire (in our case should be negative)
L8 = 210; %Ax3 to tip of pen
L9 = 30; % point {B} in the z-direction 
Xsum = (L4+L5+L6);
Ysum = (L1+L2+L3+(-L7)+L8);
Zsum = (L9);

M = [[1,0,0,Xsum];
    [0,1,0,Ysum];
    [0,0,1,Zsum];
    [0,0,0,1]];
% solve Screw axis via calculator or create a different function for it 
S1 = [0; 0; 1; 0; 0; 0];
S2 = [0; 0; 1; -113; 0; 0];
S3 = [0; 0; 1; -191; 0; 0];
S4 = [1; 0; 0; 0; 0; 291];
S5 = [-1; 0; 0; 0; 0; -237];

Slist =[S1, S2, S3, S4, S5];
%thetalist = [pi/2;pi/2;pi/2;pi/2;pi/2];  % Test position at all pi/2 90 dgrees 
thetalist = [0;0;0;0;0];
Tsb = FKinSpace(M, Slist, thetalist);
Tsb = FKinSpace(M, Slist, thetalist)
