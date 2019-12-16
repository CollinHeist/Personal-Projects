#FIR_design.py

import matplotlib.pyplot as plt
import numpy as np
from scipy import signal as sig
from math import pi, exp, cos, sin, log, sqrt

NN = 200
N2 = int(NN/2)
x = np.zeros(NN)
y = np.zeros(NN)

dt = .001
TT = np.linspace(0,dt*(NN-1),NN)
DF = 1/(dt*NN)
FF = np.linspace(0,DF*(NN-1),NN)
 
Nfreq = 4
omega = np.zeros(Nfreq)

for m in range(0,Nfreq):
    omega[m] = 2*pi*50*m

x = np.zeros(NN)

for m in range(1,Nfreq):
    for n in range(1,NN):
       x[n] = x[n] + sin(omega[m]*n*dt)
          
plt.subplot(321)
plt.plot(TT,x,'k')
plt.title('FIR_design')
plt.ylabel('x{n]')
plt.xlabel('T (sec)')
plt.grid()

X = (2/NN)*np.fft.fft(x)

plt.subplot(322)
plt.plot(FF,abs(X),'k')
plt.axis([0,200,0,1 ])
plt.grid()
plt.xticks([0,50,100,150,200])
plt.xlabel('Freq (Hz)')
plt.savefig('x.png',dpi=300)
plt.title('X(w)')
plt.show()

#----------- Filter design --------------------------

H = np.zeros(NN)

""" Band Pass, freq. domain"""
nc = int(100/DF)
sigma = 4
for n in range(0,N2):
    H[n] = exp(-0.5*( ((n-nc)/sigma)**2))

#High pass filter
#nc = 16
#for n in range(0,N2):
#    H[n] = exp(-0.5*( ((n-nc)/4)**2))
##
#for n in range(nc,N2):
#    H[n] = 1
##
## Reflect around zero to get the negative frequencies.
#for n in range(1,M):
#    H[NN-n] = H[n]

# -------------------------------------------------

""" Multiply X and H to get Y, freq domain output """   
Y = X
for n in range(0,NN):
    Y[n] = H[n]*X[n]

plt.subplot(323)
plt.plot(FF,H,'k--')
plt.plot(FF,abs(Y),'k')
plt.xticks([50,950])
plt.axis([0,200,-.2,1.1])
plt.xticks([50,100,150,200])
plt.title('Y = H*X')
plt.grid()

y = (NN/2)*np.fft.ifft(Y).real

plt.subplot(324)
plt.plot(y,'k')
plt.title('y=ifft(Y)')
plt.grid()
plt.savefig('y.png',dpi=300)
plt.show()

h = (NN/2)*np.fft.ifft(H).real

hmax = max(h)

for n in range(NN):
    h[n] = h[n]/hmax

plt.subplot(325)
plt.plot(h,'k')
plt.axis([0,30,-1,1])
#plt.axis([-2,NN,-.7,1])
plt.grid()
plt.title('h')

#  Shift h  to hh

MM = 13  
""" The shifted filter is 2*MM + 1 points long. """
hh = np.zeros(2*MM+1)
for n in range(0,MM+1):
    hh[n+MM] = h[n]
    
for n in range(0,MM):    
    hh[n] = h[NN-MM+n]
    
plt.subplot(326)
plt.plot(hh,'ko')
plt.axis([0 ,2*MM,-1,1.2])
plt.xticks([0,MM,int(2*MM)])
plt.title('hh is h shifted')
plt.grid()

plt.savefig('h.png',dpi=300)
plt.show()

# convolve hh with x

hsum = sum(abs(h))
K = 1.75
#K = 1.35    # Band pass
#K = 2.93   # For the high pass
w= (K/hsum)*np.convolve(hh,x)
plt.subplot(311)
plt.plot(w,'k')
plt.axis([0,233,-2,2])
plt.ylabel('w')
plt.title('w is hh convolved with x')
plt.grid()
plt.savefig('w.png',dpi=300)
plt.show()

# Trim the ends and take the FT.

z = np.zeros(NN)
for n in range(NN):
    z[n] = w[n+MM]
    
plt.subplot(311)
plt.plot(z,'k')
plt.ylabel('z')
#plt.plot(x,'m--')
#plt.axis([0,50,-1,1])
plt.title('z is w shifted and truncated')
plt.grid()

Z = (2/NN)*np.fft.fft(z)
plt.subplot(313)
plt.plot(FF,abs(Z),'k')
plt.ylabel('|Z(w)|')
plt.yticks([0,.15,.707,1.])
plt.xticks([0,50,100,150,200])
plt.axis([0,200,0,1.])
plt.title('Z = fft(z)')
plt.grid()
plt.savefig('z.png',dpi=300)
plt.show()

