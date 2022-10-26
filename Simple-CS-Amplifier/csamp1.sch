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
lab=#net3}
N 320 -380 320 -350 {
lab=#net3}
N 130 -180 160 -180 {
lab=#net2}
N 130 -250 130 -180 {
lab=#net2}
N 130 -250 320 -250 {
lab=#net2}
N 100 -140 160 -140 {
lab=#net4}
N 90 -140 90 -130 {
lab=#net4}
N 90 -140 100 -140 {
lab=#net4}
N 90 -70 90 -50 {
lab=GND}
N 320 -380 520 -380 {
lab=#net3}
N 520 -380 520 -320 {
lab=#net3}
N 520 -260 520 -200 {
lab=GND}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 300 -210 0 0 {name=M1
L=0.40
W=40
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
C {devices/isource.sym} 320 -310 0 0 {name=I0 value=1m}
C {devices/vsource.sym} 90 -100 0 0 {name=VDS value=1.8}
C {devices/gnd.sym} 90 -50 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 200 -100 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 320 -100 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 520 -290 0 0 {name=V2 value=1.8}
C {devices/gnd.sym} 520 -200 0 0 {name=l1 lab=GND}
C {devices/code.sym} 690 -310 0 0 {name=NGSPICE 
only_toplevel=false 
value="

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1 scale=1e-6

.control
save all
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vgs]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vds]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]

dc VDS 0.2 1.8 1m 

let vgs = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vgs]
let vds = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[vds]
let gm = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
let gds = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro = 1/gds 

let gain = gm*ro

let ao = -1/(deriv(vgs))

plot ao
.endc
"}
