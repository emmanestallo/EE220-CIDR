import numpy as np 
import matplotlib.pyplot as plt 

corners = ['ss','tt','ff']
length = 0.30
for corner in corners: 
    vgs = np.loadtxt(f'gmoverid-{corner}.txt')[:,0]
    gmoverid = np.loadtxt(f'gmoverid-{corner}.txt')[:,1]
    plt.plot(vgs,gmoverid,label=corner.upper())

plt.grid(linestyle='--')
plt.title(f'nfet_01v8_lvt[$g_m/I_D$] (W=$10\mu$m, L=${length}\mu$m)')
plt.xlabel("$V_{GS}$ [V]") 
plt.ylabel("$g_m/I_D$ [$V^{-1}$]")
plt.legend(loc='upper right')
plt.savefig(f'nfet_01v8_lvt-gmoverid-L={length}-W=10.png', dpi=600)
plt.show()

for corner in corners: 
    vgs = np.loadtxt(f'ft-{corner}.txt')[:,0]
    ft = np.loadtxt(f'ft-{corner}.txt')[:,1]
    gmoverid = np.loadtxt(f'gmoverid-{corner}.txt')[:,1]
    plt.plot(vgs,-ft*gmoverid/1e9,label=corner.upper())

plt.grid(linestyle='--')
plt.title(f'nfet_01v8_lvt[$f_t\cdot g_m/I_D$] (W=$10\mu$m, L=${length}\mu$m)')
plt.xlabel("$V_{GS}$ [V]") 
plt.ylabel("$f_t \cdot g_m/I_D$ [$GHz/V$]")
plt.legend(loc='upper right')
plt.savefig(f'nfet_01v8_lvt-AFOM-L={length}-W=10.png', dpi=600)
plt.show()

for corner in corners: 
    vgs = np.loadtxt(f'ft-{corner}.txt')[:,0]
    ft = np.loadtxt(f'ft-{corner}.txt')[:,1]
    gmoverid = np.loadtxt(f'gmoverid-{corner}.txt')[:,1]
    vstar = np.loadtxt(f'vstar-{corner}.txt')[:,1]
    plt.plot(vstar,-ft*gmoverid/1e9,label=corner.upper())

plt.grid(linestyle='--')
plt.title(f'nfet_01v8_lvt[$f_t\cdot g_m/I_D$] (W=$10\mu$m, L=${length}\mu$m)')
plt.xlabel("$V^*$ [V]") 
plt.ylabel("$f_t \cdot g_m/I_D$ [$GHz/V$]")
plt.legend(loc='upper right')
plt.savefig(f'nfet_01v8_lvt-AFOM_vstar-L={length}-W=10.png', dpi=600)
plt.show()
'''
----------------------------------------------------------
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
----------------------------------------------------------
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
----------------------------------------------------------
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