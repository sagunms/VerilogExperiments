setPreference -pref AutoSignature:FALSE
setPreference -pref KeepSVF:FALSE
setPreference -pref ConcurrentMode:FALSE
setPreference -pref UseHighz:FALSE
setPreference -pref svfUseTime:FALSE
loadProjectFile -file "C:/Xilinx/SAGUN/Verilog/ps2mouse/ps2mouse.ipf"
setMode -ss
setMode -sm
setMode -hw140
setMode -spi
setMode -acecf
setMode -acempm
setMode -pff
setMode -bs
setMode -bs
setMode -bs
setCable -port auto
Program -p 1 -defaultVersion 0 
saveProjectFile -file "C:/Xilinx/SAGUN/Verilog/ps2mouse/ps2mouse.ipf"
