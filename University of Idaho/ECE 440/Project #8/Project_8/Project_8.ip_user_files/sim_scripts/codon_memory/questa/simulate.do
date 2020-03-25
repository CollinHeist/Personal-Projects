onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib codon_memory_opt

do {wave.do}

view wave
view structure
view signals

do {codon_memory.udo}

run -all

quit -force
