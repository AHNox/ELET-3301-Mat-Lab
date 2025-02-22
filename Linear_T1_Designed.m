R1=1e3; R2=20; C1=5e-6; C2=25e-9;
b1=1/R1/C2;
a1=1/R1/C1 + 1/R2/C2;
a0=1/(R1*R2*C1*C2);

num =- [b1 0];
den=[1 a1 a0];
G1=tf(num,den)
bode(G1),grid