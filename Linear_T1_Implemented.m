R1 = 1e3; R2 = 20; C1 = 5E-6; C2 = 25E-9;

num1 = (R1*C2);
num2 = ((R1/R2) + (C2/C1));
num3 = 1/(R2*C1);

den = 1;

finalNum = -[num1 num2 num3];
finalDen = [0 den 0];

G = tf(finalNum, finalDen);
%disp(G);

bode(G), grid

%[magIn,phaseIn,wintIn] = bode(G,1e3);
%[magNoise,phaseNoise,wintNoise] = bode(G,1e8);

%disp([magIn,phaseIn,wintIn])
%disp([magNoise,phaseNoise,wintNoise])