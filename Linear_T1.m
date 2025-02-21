R1 = 1e3; R2 = 20; C1 = 5E-6; C2 = 25E-9;

num1 = -1;
num2 = ((1/(R1*C1))+(1/(R2*C2)));
num3 = 1/(R1*C1*R2*C2);

den = 1;

finalNum = [num1 num2 num3];
finalDen = [0 den 0];

G = tf(finalNum, finalDen);
disp(G);

bode(G), grid