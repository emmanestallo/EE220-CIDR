v {xschem version=3.1.0 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 1090 -360 1140 -360 {
lab=g1}
N 1180 -290 1180 -230 {
lab=GND}
N 1180 -360 1260 -360 {
lab=GND}
N 1260 -360 1260 -290 {
lab=GND}
N 1180 -290 1260 -290 {
lab=GND}
N 1180 -530 1180 -400 {
lab=d1}
N 1180 -530 1330 -530 {
lab=d1}
N 1180 -330 1180 -290 {
lab=GND}
N 1180 -400 1180 -390 {
lab=d1}
C {devices/code_shown.sym} 460 -1060 0 0 {name=NGSPICE
only_toplevel=true
value="
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice ss
.option wnflag = 1 scale=1e-6

vgs ga 0 dc=-0.9
vds d1 0 dc=-0.9

l1   ga g1 1e9
iac  g1 0 dc=0 ac=1
h1   io1 0 vds 1

.control
save all

save @m.xm1.msky130_fd_pr__pfet_01v8_lvt[id]

let vgsx = 0
let run = 0
set curplot = new
set scratch = $curplot 
let ft_vec = vector(181)
let vgs_vec = vector(181)

dowhile vgsx >= -1.81
  
  alter vgs = vgsx
  ac dec 100 1e6 1e12

  * plot vdb(io1)
  meas ac ft when vdb(io1) = 0
  
  set dt = $curplot
  setplot $scratch 

  let vgs_vec[run] = vgsx
  let ft_vec[run] = \{$dt\}.ft

  setplot $dt          
  
  echo Vgs \{$&vgsx\}
  echo ft \{$&ft\}
  echo Run \{$&run\}

  let vgsx = vgsx - 0.01
  let run = run + 1
end

setplot $scratch
setscale vgs_vec
wrdata mos-ft-ss-l=150nm-w=10um.dat ft_vec
plot ft_vec


.endc
" }
C {devices/ipin.sym} 1090 -360 0 0 {name=p1 lab=g1}
C {devices/iopin.sym} 1330 -530 0 0 {name=p2 lab=d1}
C {devices/gnd.sym} 1180 -230 0 0 {name=l3 lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 1160 -360 2 1 {name=M1
L=0.35
W=10
nf=10
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
