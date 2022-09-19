.title Resistor Temperature Correction 
.temp 27

*n+ polysilicon resistor model 
.model rpoly_n R rsh=100 tc1=-800u tnom=27C 

*p+ polysilicon resistor model 
.model rpoly_p R rsh=180 tc1=200u tnom=27C

*main circuit 
vsource net1 gnd dc 1 

r1 net1 net2 rpoly_n w=2u l=4u
r2 net2 gnd rpoly_p w=2u l=8.88888u

*control section
.control
dc temp -40 120 1
let r_tot = v(net1)/-i(vsource) 
plot r_tot

.endc


.end 
