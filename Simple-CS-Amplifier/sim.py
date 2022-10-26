import numpy as np 
import matplotlib.pyplot as plt 

lengths = ['0.15','0.20','0.25','0.30','0.35','0.40']
for length in lengths: 
    vds = np.loadtxt(f'ao-L={length}.txt')[:,0]
    ao = np.loadtxt(f'ao-L={length}.txt')[:,1] 
    plt.plot(vds,ao,label=length) 

plt.legend(loc='lower right',ncol=3)
plt.grid()
plt.show()