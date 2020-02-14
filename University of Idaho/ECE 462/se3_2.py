""" Se3_1.py
This program calculates the 
transmission through a barrier. """

from math import pi,sqrt, exp, cos, sin
import numpy as np
from matplotlib import pyplot as plt
from numba import jit

NN = 500
N2 = int(NN/2)
hbar = 1.054e-34
melec = 9.1e-31
meff = 1.0
ecoul = 1.6e-19
epsz = 8.85e-9
eV2J = 1.6e-19
J2eV = 1/eV2J

del_x = 0.2e-9
dt = .5e-16
ra = (0.5*hbar/m0)*(dt/del_x**2)
rd = dt/hbar
DX = del_x*1e9  
XX = np.linspace(DX,DX*NN,NN)

del_K = 1/(del_x*NN)
KK = np.linspace(0,del_K*(NN-1),NN)
EE = np.zeros(NN)
EE[0] = 0
for n in range(1,NN):
	EE[n] = (J2eV/(2*melec))*(hbar**2)*(2*pi*KK[n])**2


# ------------ Specify the potential ---------------

V = np.zeros(NN)
V[N2-2:N2+3] = .2*eV2J

# ------------ Initialize psi ----------------------

lambda_ = 3e-9/del_x
sigma   = 15
nc	  = int(4*NN/10)		 # Starting position

prl = np.zeros(NN)
pim = np.zeros(NN)
for n in range(NN):
	prl[n] = np.exp(-1.*((n-nc)/sigma)**2)*np.cos(2*pi*(n-nc)/lambda_)
	pim[n] = np.exp(-1.*(((n-nc)/sigma)**2))*np.sin(2*pi*(n-nc)/lambda_)
  
ptot = np.sum(prl**2 + pim**2)
pnorm = sqrt(ptot)
prl = np.divide(prl,pnorm)
pim = np.divide(pim,pnorm)

psi = prl + pim*1j 
PF0 = np.fft.fft(psi)  # FFT of the input

plt.subplot(321)
plt.plot(XX,J2eV*V,'k')	
plt.plot(XX,prl,'b')
plt.plot(XX,pim,'r--')
plt.show()

@jit
def fdtd(prl, pim, n_step):
	print("FDTD: nstep = ",n_step)
	for _ in range(n_step):
		
		for n in range(NN-1):
			prl[n] = prl[n] - ra*(pim[n-1] - 2*pim[n] + pim[n+1])+rd*V[n]*pim[n]
			
		for n in range(NN-1): 
			pim[n] = pim[n] + ra*(prl[n-1] - 2*prl[n] + prl[n+1])-rd*V[n]*prl[n]

T = 0

# ---------- The core FDTD loop ----------------------

while True:
	n_step = int(input("How many time steps--> "))
	if n_step == 0:
		break
	
	T = T + n_step
	fdtd(prl, pim, n_step)
 
# ----------- Calculate the observables --------------
						  
	ptot = round(np.sum(prl**2 + pim**2),5)
	psi = prl + pim*1j
	PE = round(np.sum( (prl**2 + pim**2)*V)*J2eV,4)
  
	ke = 0.
	for n in range(NN-2):
		ke = ke + (psi[n-1] - 2*psi[n] + psi[n+1])*np.conjugate(psi[n])
		
	KE = round(-J2eV*((hbar/del_x)**2/(2*m0))*ke.real,3)
	Etot = round(PE+KE,4)
	time = round(T*dt*1e15,5)	
		
# ------------- Plot ---------------------------------

	plt.subplot(311)
	plt.title("Se3_2",fontsize=14)
	plt.axis([ 0, NN*DX , -.2, .2])
	plt.text(52,0.15,"K.E.: {} eV".format(KE),fontsize=14)
	plt.yticks([-.1,0,.1],fontsize=14)
	plt.plot(XX,J2eV*V,'k',label='V')
	plt.plot(XX,prl,'k',label='real')
	plt.plot(XX,pim,'k--',label='imag',linewidth=2)
	plt.plot(XX,V,'k--')	
	plt.grid()

#----- Take the FFT of the transmitted psi-------------

	psi[0:N2] = 0
	PF = np.fft.fft(psi)

	amax = max(abs(PF0))   
	plt.subplot(323)
	plt.plot(EE,abs(PF),'k')
	plt.plot(EE,abs(PF0),'k--')
	plt.axis([0,.5,0,1.2*amax])
	plt.ylabel('Psi(E)')
	plt.xlabel('E (eV)')
	plt.grid()	   
	
#   Calculate the transmission
	
	trans = np.zeros(NN)
	for n in range(NN):
		if abs(PF0[n]) > 0.05:
			trans[n] = abs(PF[n]/PF0[n])

	plt.subplot(3,2,4)
	plt.plot(EE,trans,'k')
	plt.axis([0,.5,0,1])
	plt.grid()
	plt.ylabel('Trans(E)')
	plt.xlabel('E (eV)')
	plt.savefig('se3_1.png',dpi=300)
	plt.show()
	
	print("T = ",T,"   ptot = ",ptot)
	
   