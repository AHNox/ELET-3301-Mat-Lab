w=500
vs=85

c=190e-6
l=220e-3
r2=60
r1=65

zc=1/(j*w*c)
zl=j*w*l

b1=r2
b2=r1+zl

zpar=1/((1/b1)+(1/b2))

zt=zc+zpar

ztMag = sqrt(43.769161406672680^2 + 3.756822172654360^2)
ztdeg = rad2deg(atan(3.756822172654360/43.769161406672680))

icMag = vs/ztMag
icdeg = 0-ztdeg

ic= icMag * exp(1j * deg2rad(icdeg))

il = (zpar/b2)*ic

ilmag = sqrt(real(il)^2 + imag(il)^2)
ildeg = rad2deg(atan(imag(il)/real(il)))