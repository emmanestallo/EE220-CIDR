v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 350 -1300 400 -1300 {
lab=GND}
N 400 -1300 400 -1280 {
lab=GND}
N 400 -1300 490 -1300 {
lab=GND}
N 490 -1300 490 -1240 {
lab=GND}
N 490 -1300 600 -1300 {
lab=GND}
N 600 -1300 600 -1270 {
lab=GND}
N 490 -1250 520 -1250 {
lab=GND}
N 520 -1250 520 -1210 {
lab=GND}
N 490 -1210 520 -1210 {
lab=GND}
N 400 -1210 450 -1210 {
lab=#net1}
N 400 -1220 400 -1210 {
lab=#net1}
N 490 -1180 490 -1140 {
lab=#net2}
N 490 -1140 600 -1140 {
lab=#net2}
N 600 -1210 600 -1140 {
lab=#net2}
N 320 -1300 320 -1260 {
lab=GND}
N 320 -1300 350 -1300 {
lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 470 -1210 0 0 {name=M1
L=0.70
W=10
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/gnd.sym} 320 -1260 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 400 -1250 0 0 {name=V1 value=0.9}
C {devices/vsource.sym} 600 -1240 0 0 {name=V2 value=0.9}
C {devices/code.sym} 690 -1260 0 0 {name=NGSPICE
only_toplevel=false 
value="

.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice ss
.option wnflag=1 scale=1e-6

.control 

save all
save @m.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
save @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm] 

dc v1 0 1.8 1m

let id = @m.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
let gm = @m.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]

let gmoverid = gm/id 

wrdata gmoverid-ss.txt gmoverid

.endc
"}
