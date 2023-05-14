v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 200 -130 200 -100 {
lab=GND}
N 320 -180 320 -100 {
lab=GND}
N 320 -210 360 -210 {
lab=GND}
N 360 -210 360 -170 {
lab=GND}
N 320 -170 360 -170 {
lab=GND}
N 200 -210 200 -190 {
lab=#net1}
N 200 -210 280 -210 {
lab=#net1}
N 320 -250 320 -240 {
lab=#net2}
N 320 -280 320 -250 {
lab=#net2}
N 320 -350 320 -340 {
lab=vdd}
N 320 -380 320 -350 {
lab=vdd}
N 130 -180 160 -180 {
lab=#net2}
N 130 -250 130 -180 {
lab=#net2}
N 130 -250 320 -250 {
lab=#net2}
N 100 -140 160 -140 {
lab=#net3}
N 90 -140 90 -130 {
lab=#net3}
N 90 -140 100 -140 {
lab=#net3}
N 90 -70 90 -50 {
lab=GND}
N 810 -360 810 -300 {
lab=vdd}
N 810 -240 810 -180 {
lab=GND}
N 260 -210 260 -150 {
lab=#net1}
N 260 -150 420 -150 {
lab=#net1}
N 540 -350 540 -340 {
lab=vdd}
N 540 -380 540 -350 {
lab=vdd}
N 540 -280 540 -240 {
lab=out}
N 540 -180 540 -120 {
lab=GND}
N 540 -160 570 -160 {
lab=GND}
N 570 -210 570 -160 {
lab=GND}
N 540 -210 570 -210 {
lab=GND}
N 420 -210 420 -150 {
lab=#net1}
N 480 -210 500 -210 {
lab=in}
N 540 -260 620 -260 {
lab=out}
N 620 -260 660 -260 {
lab=out}
N 660 -260 660 -230 {
lab=out}
N 660 -260 700 -260 {
lab=out}
N 660 -170 660 -120 {
lab=GND}
N 470 -250 480 -250 {
lab=in}
N 480 -250 490 -250 {
lab=in}
N 490 -250 490 -210 {
lab=in}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 300 -210 0 0 {name=M1
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/vcvs.sym} 200 -160 0 0 {name=E1 value=1000}
C {devices/isource.sym} 320 -310 0 0 {name=I0 value=3n}
C {devices/vsource.sym} 90 -100 0 0 {name=VDS value=0.9}
C {devices/gnd.sym} 90 -50 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 200 -100 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 320 -100 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 810 -270 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} 810 -180 0 0 {name=l1 lab=GND}
C {devices/code.sym} 60 -650 0 0 {name=NGSPICE 
only_toplevel=false 
value="

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1 scale=1e-6

.control
save all

*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[vgs]
*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[vds]
*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[gm]
*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[id]
*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[gds]
*save @m.xm2.msky130_fd_pr__nfet_01v8_lvt[cgg]

AC dec 10 1 100Meg

*let vgs = @m.xm2.msky130_fd_pr__nfet_01v8_lvt[vgs]
*let vds = @m.xm2.msky130_fd_pr__nfet_01v8_lvt[vds] 
*let gm = @m.xm2.msky130_fd_pr__nfet_01v8_lvt[gm]
*let id = @m.xm2.msky130_fd_pr__nfet_01v8_lvt[id]
*let ro = 1/@m.xm2.msky130_fd_pr__nfet_01v8_lvt[gds]
*let cgg = @m.xm2.msky130_fd_pr__nfet_01v8_lvt[cgg]

*let ao = gm*ro
*let ft = gm/(2*pi*cgg)
*plot v(out)

*tran 10u 10m 

*plot ao



*wrdata ao-L=0.40.txt ao
.endc
"}
C {devices/iopin.sym} 320 -380 0 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 810 -360 0 0 {name=p1 lab=vdd}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 520 -210 0 0 {name=M2
L=0.5
W=1
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/isource.sym} 540 -310 0 0 {name=I1 value=3n
}
C {devices/iopin.sym} 540 -380 0 0 {name=p1 lab=vdd}
C {devices/gnd.sym} 540 -120 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 450 -210 1 0 {name=vin value= "DC 0 AC 1"}
C {devices/opin.sym} 700 -260 0 0 {name=p1 lab=out}
C {devices/capa.sym} 660 -200 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 660 -120 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 470 -250 0 0 {name=l1 sig_type=std_logic lab=in}
