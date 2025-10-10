v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 780 -280 780 -260 {lab=vdd}
N 780 -180 780 -160 {lab=GND}
N 720 -280 720 -260 {lab=VB}
N 560 -260 720 -260 {lab=VB}
N 560 -200 560 -160 {lab=GND}
N 440 -200 440 -160 {lab=GND}
N 440 -340 440 -260 {lab=vdd}
N 780 -340 780 -280 {lab=vdd}
N 440 -340 780 -340 {lab=vdd}
N 560 -160 560 -120 {lab=GND}
N 440 -160 440 -120 {lab=GND}
N 780 -160 780 -120 {lab=GND}
N 840 -220 880 -220 {lab=out}
N 880 -220 880 -200 {lab=out}
N 880 -140 880 -120 {lab=GND}
N 640 -240 720 -240 {lab=#net1}
N 720 -200 720 -180 {lab=#net2}
N 640 -180 720 -180 {lab=#net2}
N 720 -180 720 -60 {lab=#net2}
N 860 -220 860 -60 {lab=out}
N 720 -60 750 -60 {lab=#net2}
N 810 -60 860 -60 {lab=out}
C {opamp_3zki.sym} 780 -220 0 0 {name=x1}
C {devices/ipin.sym} 720 -280 1 0 {name=p1 lab=VB}
C {devices/iopin.sym} 780 -280 0 0 {name=p2 lab=vdd}
C {devices/vsource.sym} 560 -230 0 0 {name=V1 value=3 savecurrent=false}
C {devices/gnd.sym} 560 -120 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 780 -120 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 440 -120 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 440 -230 0 0 {name=V2 value=5 savecurrent=false}
C {devices/vsource.sym} 640 -210 0 0 {name=V4 value="AC 1" savecurrent=false}
C {devices/capa.sym} 880 -170 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 880 -120 0 0 {name=l6 lab=GND}
C {devices/iopin.sym} 880 -220 0 0 {name=p3 lab=out}
C {devices/code_shown.sym} 20 -470 0 0 {name=ngspice
only_toplevel=false
format="tcleval( @value )"
value=".inc $::IP62_MODELS
.save all
.option savecurrent
.control
set units=degree
op
ac dec 20 1 1e10
plot vdb(out)
plot vp(out)
meas ac gain find vdb(out)  at=1e3 > NUL
meas ac ugf when vdb(out)=0 > NUL
meas ac phase find vp(out) at=ugf > NUL
echo 'gain(1kHz) = $&gain dB'
echo 'ugf        = $&ugf Hz'
let phasemergin = 180 + phase
echo 'phasemergin= $&phasemergin deg'
.endc
"}
C {devices/res.sym} 780 -60 1 0 {name=R1
value=100Meg
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 640 -150 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 640 -120 0 0 {name=l4 lab=GND}
