#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Sep 25 13:11:08 2022
@author: louis
"""

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
idn = {}


for corner in corners:
    fname = 'mos-nlvt-transfer-' + corner + '-l=150nm-w=10um.dat'
    fdir = '/home/emman/Desktop/Acads/EE220/MOS-Transistor-Characteristics/'
    vgs, [idn[corner]] = read_data( fdir + fname, [1])
   
fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
for corner in corners:
    ax.plot(vgs, [i/1e-3 for i in idn[corner]], 'o', markersize=1, label = corner.upper())

ax.set_title(r'nfet_01v8_lvt ($W=10\mu m$, $L=0.15\mu m$, $nf=1$ )')
ax.set_xlabel(r'$V_{GS}$ [V]')
ax.set_ylabel(r'$I_D$ [mA]')
ax.legend(loc= 'upper left')
fig.set_tight_layout('True')
ax.grid(True)
ax.grid(linestyle=':')
plt.savefig('nmos-1v8-lvt-transfer-linear.png', dpi=600)

fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
for corner in corners:
    ax.semilogy(vgs, [i/1e-3 for i in idn[corner]],  'o', markersize=1, label = corner.upper())
    
ax.set_title(r'nfet_01v8_lvt ($W=10\mu m$, $L=0.15\mu m$, $nf=1$ )')
ax.set_xlabel(r'$V_{GS}$ [V]')
ax.set_ylabel(r'$I_D$ [mA]')
ax.legend(loc= 'upper left')
fig.set_tight_layout('True')
ax.grid(True)
ax.grid(linestyle=':')
plt.savefig('nmos-1v8-lvt-transfer-log.png', dpi=600)


idn2 = {}

for corner in corners:
    fname = 'mos-nlvt-output-' + corner + '-l=150nm-w=10um.dat'
    fdir = '/home/emman/Desktop/Acads/EE220/MOS-Transistor-Characteristics/'
    vds, [idn2[corner]] = read_data( fdir + fname, [1])

fig = plt.figure()
ax = fig.add_subplot(1, 1, 1)
for corner in corners:
    ax.plot(vds, [i/1e-3 for i in idn2[corner]], 'o', markersize=1, label = corner.upper())

ax.set_title(r'nfet_01v8_lvt ($W=10\mu m$, $L=0.15\mu m$, $nf=1$ )')
ax.set_xlabel(r'$V_{DS}$ [V]')
ax.set_ylabel(r'$I_D$ [mA]')
ax.legend(loc= 'upper left')
fig.set_tight_layout('True')
ax.grid(True)
ax.grid(linestyle=':')
plt.savefig('nmos-1v8-lvt-output.png', dpi=600)