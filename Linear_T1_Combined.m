% Designed Circuit and Transfer Function
R1=1e3; R2=20; C1=5e-6; C2=25e-9;
b1=1/R1/C2;
a1=1/R1/C1 + 1/R2/C2;
a0=1/(R1*R2*C1*C2);

num =- [b1 0];
den=[1 a1 a0];
G1=tf(num,den)

bode(G1),grid on;
hold on;

% Implemented Circuit and Transfer Function
num1 = (R1*C2);
num2 = ((R1/R2) + (C2/C1));
num3 = 1/(R2*C1);

den1 = 0;
den2 = 1;
den3 = 0

finalNum = - [num1 num2 num3];
finalDen = [den1 den2 den3];
G = tf(finalNum, finalDen)

bode(G), grid on