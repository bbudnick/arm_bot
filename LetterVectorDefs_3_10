%Relates the letter positions on the whiteboard to the robot Space frame
%Includes definitions for the robot to draw each letter path [A through J]

% Define k values
% k1 = -35
k1 = 0
k2 = 395
k3 = 180

% Define v values
letter_width = 30
letter_thick = 20
letter_height = 60
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
A = [u,w,s,q,o,m,w,n,r,w];

B = [u,w,n,o,q,u,s,m,n,u,w];

C = [u,w,q,o,m,s,w];

D = [u,w,r,p,o,m,t,r,w];

E = [u,w,q,o,m,s,w,n,u,w];

F = [u,w,q,o,m,w,n,u,w];

G = [u,w,q,o,m,s,r,u,w];

H = [u,w,q,s,w,o,m,w,n,r,w];

I = [u,w,o,q,w,m,s,w,p,t,w];

J = [u,w,o,q,w,p,s,m,n,w];
