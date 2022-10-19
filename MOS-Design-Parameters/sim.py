import numpy as np 
import matplotlib.pyplot as plt 

corners = ['ss','tt','ff']
for corner in corners: 
    vgs = np.loadtxt(f'gm-{corner}.txt')[:,0]
    gm = np.loadtxt(f'gm-{corner}.txt')[:,1]/1e-3
    plt.plot(vgs,gm,label=corner.upper())

plt.grid()
plt.title('nfet_01v8_lvt (W=$10\mu$m, L=$0.15\mu$m)')
plt.xlabel("$V_{GS}$ [V]") 
plt.ylabel("$g_m$ [mS]")
plt.legend(loc='upper left')
plt.savefig('nfet_01v8_lvt-L=0.15-W=10.png', dpi=600)
plt.show()
