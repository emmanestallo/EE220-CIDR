import numpy as np 
import matplotlib.pyplot as plt 


lengths = ['0.20','0.21','0.22','0.23','0.24','0.25']
for length in lengths: 
    ft = np.loadtxt(f'charac-L={length}.txt')[:,1]/1e9
    vstar = np.loadtxt(f'charac-L={length}.txt')[:,5] 
    plt.plot(vstar,ft,label=length,ncol=3) 

plt.title('nfet_01v8_lvt $(W=99.9\mu m, V_{DS} = 0.7mV)$')
plt.legend(loc='lower right',ncol=3)
plt.ylabel('$f_t$ [GHz]')
plt.xlabel('$V^* [V]$')
plt.grid(linestyle='--')
plt.show()

'''
vstar = np.loadtxt(f'vstar.txt')[:,1]
id = np.loadtxt(f'vstar.txt')[:,3]

idd = np.interp(0.2,vstar,id)

idDesired = 314e-6

mult = idDesired/idd 

print(f'W multiplier = {round(mult)}')

plt.plot(vstar,id/1e-3) 
plt.title('nfet_01v8_lvt $(W=1\mu m, L=0.30\mu m)$')
plt.ylabel('$I_D \; [mA]$')
plt.xlabel('$V^* \; [V]$')
plt.grid(linestyle='--')
plt.savefig('vstar-id.png',dpi=600)
'''