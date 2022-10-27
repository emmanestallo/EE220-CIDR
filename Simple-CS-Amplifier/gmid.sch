v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 540 -340 540 -320 {
lab=GND}
N 640 -390 640 -340 {
lab=GND}
N 780 -370 780 -340 {
lab=GND}
N 540 -420 540 -400 {
lab=#net1}
N 540 -420 600 -420 {
lab=#net1}
N 640 -370 680 -370 {
lab=GND}
N 680 -420 680 -370 {
lab=GND}
N 640 -420 680 -420 {
lab=GND}
N 640 -530 640 -450 {
lab=#net2}
N 640 -530 780 -530 {
lab=#net2}
N 780 -530 780 -430 {
lab=#net2}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 620 -420 0 0 {name=M1
L=0.30
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
C {devices/vsource.sym} 540 -370 0 0 {name=V1 value=0.9}
C {devices/gnd.sym} 640 -340 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 780 -400 0 0 {name=V2 value=0.9}
C {devices/gnd.sym} 540 -320 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 780 -340 0 0 {name=l1 lab=GND}
C {devices/code.sym} 270 -490 0 0 {name=NGSPICE 
only_toplevel=false 
value="

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.option wnflag=1 scale=1e-6

.control 
save all 
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
save @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]

dc v1 0 1.8 1m

let id = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
let gm = @m.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
let ro = 1/@m.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]

let gmoverid = gm/id 
let vstar = 2/gmoverid

plot id vs vstar

wrdata vstar.txt vstar id

.endc
"}
