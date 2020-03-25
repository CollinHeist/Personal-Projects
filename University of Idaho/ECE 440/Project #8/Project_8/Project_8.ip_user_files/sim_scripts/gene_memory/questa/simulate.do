onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib gene_memory_opt

do {wave.do}

view wave
view structure
view signals

do {gene_memory.udo}

run -all

quit -force
