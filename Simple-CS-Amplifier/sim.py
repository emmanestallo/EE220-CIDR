import numpy as np 
import matplotlib.pyplot as plt 

'''
lengths = ['0.15','0.20','0.25','0.30','0.35','0.40']
for length in lengths: 
    vds = np.loadtxt(f'ao-L={length}.txt')[:,0]
    ao = np.loadtxt(f'ao-L={length}.txt')[:,1] 
    plt.plot(vds,ao,label=length) 

plt.title('nfet_01v8_lvt $(W=40\mu m, I_D = 1.0 mA)$')
plt.legend(loc='lower right',ncol=3)
plt.ylabel('$a_0 = g_mr_o$')
plt.xlabel('$V_{DS}$')
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