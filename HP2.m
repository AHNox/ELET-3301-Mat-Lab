R1=99e3; R2=1e3; C=0.1e-6;
R1R2=R1*R2/(R1+R2);
num=[1 1/(R1R2*C)];
den=[1 1/R1/C];
G=tf(num,den);
bode (G),grid;
[mag, phase, w2]=bode(G,1000);
[mag, phase, w2]=bode(G,100000);