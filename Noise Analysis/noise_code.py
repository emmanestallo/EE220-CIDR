import math 

#Physical Constants 
k = 1.38E-23
T = 300 
L = 0.35E-6

#Transistor Characteristics 
gm = 967.77E-6 
vstar = 596.30E-3 
ID = 288.53E-6 
P_10_G= 1.53E-13 
BW = 10E+9

gamma = P_10_G/(4*k*T*gm*BW) 


p_total = 1.57E-12
p_thermal = P_10_G*10

p_flicker = p_total - p_thermal
kfcox = p_flicker / ((ID/L**2)*(math.log(100E+9))) 

print(f'gamma = {gamma}')
print(f'p_total = {p_total}, p_thermal = {p_thermal}')
print(f'1/f constant = {kfcox}')