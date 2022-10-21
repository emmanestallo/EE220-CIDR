import numpy as np 
import matplotlib.pyplot as plt 

corners = ['ss','tt','ff']
for corner in corners: 
    vds = np.loadtxt(f'ro-{corner}.txt')[:,0]
    ro = np.loadtxt(f'ro-{corner}.txt')[:,1]/1e3
    plt.plot(vds,ro,label=corner.upper())

plt.grid(linestyle='--')
plt.title('nfet_01v8_lvt[ro] (W=$10\mu$m, L=$0.15\mu$m)')
plt.xlabel("$V_{DS}$ [V]") 
plt.ylabel("$r_o$ [k$\Omega$]")
plt.legend(loc='upper left')
plt.savefig('nfet_01v8_lvt-ro-L=0.15-W=10.png', dpi=600)
plt.show()

'''
for corner in corners: 
    vgs = np.loadtxt(f'id-{corner}.txt')[:,0]
    id = np.loadtxt(f'id-{corner}.txt')[:,1]/1e-3
    plt.plot(vgs,id,label=corner.upper())

plt.grid(linestyle='--')
plt.title('nfet_01v8_lvt[id] (W=$10\mu$m, L=$0.15\mu$m)')
plt.xlabel("$V_{GS}$ [V]") 
plt.ylabel("$I_D$ [mA]")
plt.legend(loc='upper left')
plt.savefig('nfet_01v8_lvt-id-L=0.15-W=10.png', dpi=600)
plt.show()

for corner in corners: 
    vgs = np.loadtxt(f'gm-{corner}.txt')[:,0]
    gm = np.loadtxt(f'gm-{corner}.txt')[:,1]/1e-3
    plt.semilogy(vgs,gm,label=corner.upper())

plt.grid(linestyle='--')
plt.title('nfet_01v8_lvt[gm] (W=$10\mu$m, L=$0.15\mu$m)')
plt.xlabel("$V_{GS}$ [V]") 
plt.ylabel("$g_m$ [mS]")
plt.legend(loc='upper left')
plt.savefig('nfet_01v8_lvt-gm-L=0.15-W=10_semilog.png', dpi=600)
plt.show()
'''