import matplotlib.pyplot as plt

def read_data(data_file, index_list):
    
    sweep_var = []
    data_array = [ [] for i in range(len(index_list)) ]
        
    with open(data_file, 'r') as f:
        for line in f:
            sweep_var.append(float(line.split()[0]))
                
            for idx, val in enumerate(index_list):
                data_array[idx].append(float(line.split()[val]))
                    
    return sweep_var, data_array

corners = ['tt', 'ss', 'ff']

ft = {}
for corner in corners:
    fname = 'mos-ft-' + corner + '-l=150nm-w=10um.dat'
    fdir = '/home/emman/Desktop/Acads/EE220/MOS-Transition-Frequency/'
    vgs, [ft[corner]] = read_data( fdir + fname, [1])

fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
for corner in corners:
    ax.plot(vgs, [f/1e9 for f in ft[corner]], '-', label = corner.upper())

ax.set_title(r'pfet_01v8_lvt ($W=10\mu m$, $L=0.70\mu m$ )')
ax.set_xlabel(r'$V_{GS}$ [V]')
ax.set_ylabel(r'$f_T$ [GHz]')
ax.legend(loc= 'upper left')
fig.set_tight_layout('True')
ax.grid(True)
ax.grid(linestyle=':')
plt.gca().invert_xaxis()
plt.savefig('pmos-1v8-lvt-ft.png', dpi=600)