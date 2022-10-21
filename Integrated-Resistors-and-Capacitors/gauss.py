import numpy as np 
import matplotlib.pyplot as plt 
import statistics as stat

td = np.loadtxt('mc_RC.dat')
mean = np.mean(td)
std = stat.stdev(td) 

mu = np.format_float_scientific(mean,precision=3)
sigma = np.format_float_scientific(std,precision=3)

plt.hist(td, bins=20, rwidth=0.85) 
plt.title(f'$t_d$ ($\mu = {mu}$, $\sigma = {sigma}$)')
plt.xlabel('Time Delay [s]')
plt.ylabel('Occurence')
plt.grid(linestyle='--')
plt.show()