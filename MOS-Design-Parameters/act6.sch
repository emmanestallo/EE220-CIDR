v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 -160 250 -100 {
lab=GND}
N 250 -100 250 -80 {
lab=GND}
N 140 -110 140 -90 {
lab=GND}
N 140 -90 250 -90 {
lab=GND}
N 380 -140 380 -90 {
lab=GND}
N 250 -90 380 -90 {
lab=GND}
N 140 -190 140 -170 {
lab=#net1}
N 140 -190 210 -190 {
lab=#net1}
N 250 -190 280 -190 {
lab=GND}
N 280 -190 280 -150 {
lab=GND}
N 250 -150 280 -150 {
lab=GND}
N 250 -290 250 -220 {
lab=#net2}
N 250 -290 380 -290 {
lab=#net2}
N 380 -290 380 -200 {
lab=#net2}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 230 -190 0 0 {name=M1
L=0.15
W=10
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
C {devices/vsource.sym} 140 -140 0 0 {name=V1 value=0.9
}
C {devices/vsource.sym} 380 -170 0 0 {name=V2 value=0.9
}
C {devices/gnd.sym} 250 -80 0 0 {name=l1 lab=GND}
C {devices/code.sym} 570 -250 0 0 {name=ngspice 
only_toplevel=false 
value=
"
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice ff
.option wnflag=1 scale=1e-6

.control 
save all 

save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]

dc v1 0 1.8 1m

let id = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
let gm = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]

wrdata id-ff.txt id
wrdata gm-ff.txt gm

.endc
"}
