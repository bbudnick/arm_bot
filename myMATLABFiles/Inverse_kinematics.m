clear all;
clc;

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
L9 = 30;
Xsum = (L4+L5+L6);
Ysum = (L1+L2+L3+(-L7)+L8);
Zsum = (L9);

%Screw Axis 
S1 = [0; 0; 1; 0; 0; 0];
S2 = [0; 0; 1; -113; 0; 0];
S3 = [0; 0; 1; -191; 0; 0];
S4 = [1; 0; 0; 0; 0; 291];
S5 = [-1; 0; 0; 0; 0; -237];

Slist =[S1, S2, S3, S4, S5];

M = [[1,0,0,Xsum];
    [0,1,0,Ysum];
    [0,0,1,Zsum];
    [0,0,0,1]];


T =  [[1  , 0,   0,   99];
     [0  ,   1,     0  , 447];
     [0 ,    0 ,    1 ,   30];
     [0 ,     0  ,   0,     1]];
 
thetalist0 = [0.1; 0.1; 0.1; 0.1; 0.1];
eomg = 0.01;
ev = 0.001;
 

[thetalist, success] = IKinSpace(Slist, M, T, thetalist0, eomg, ev);

