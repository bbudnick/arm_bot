%Relates the letter positions on the whiteboard to the robot Space frame
%Includes definitions for the robot to draw each letter path [A through J]

% Define k values
% k1 = -35
k1 = 0
k2 = 395
k3 = 180

% Define v values
letter_width = 50
letter_thick = 20
letter_height = 80
letter_kern = 80

%define Positions in space
w = [-k1; k2-letter_thick; k3];

m = [w]+[-(letter_width/2);letter_thick;-(letter_height/2)];
n = [w]+[-(letter_width/2);letter_thick;0];
o = [w]+[-(letter_width/2);letter_thick;(letter_height/2)];

t = [w]+[0;letter_thick;-(letter_height/2)];
s = [w]+[(letter_width/2);letter_thick;-(letter_height/2)];

u = [w]+[0;letter_thick;0];
r = [w]+[(letter_width/2);letter_thick;0];

p = [w]+[0;letter_thick;(letter_height/2)];
q = [w]+[(letter_width/2);letter_thick;(letter_height/2)];




%define letter shapes using an array of vectors
A = [w,s,q,o,m,w,n,r,w];

B = [w,n,o,q,u,s,m,n,u,w];

C = [w,q,o,m,s,w];

D = [w,r,p,o,m,t,r,w];

E = [w,q,o,m,s,w,n,u,w];

F = [w,q,o,m,w,n,u,w];

G = [w,q,o,m,s,r,u,w];

H = [w,q,s,w,o,m,w,n,r,w];

I = [w,o,q,w,m,s,w,p,t,w];

J = [w,o,q,w,p,s,m,n,w];

