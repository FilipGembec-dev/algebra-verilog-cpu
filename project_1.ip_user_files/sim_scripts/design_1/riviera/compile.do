transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/blk_mem_gen_v8_4_7
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_14
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_pkg_v1_0_3
vlib riviera/lib_srl_fifo_v1_0_3
vlib riviera/axi_uartlite_v2_0_33
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_gpio_v2_0_31
vlib riviera/generic_baseblocks_v2_1_1
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_29
vlib riviera/fifo_generator_v13_2_9
vlib riviera/axi_data_fifo_v2_1_28
vlib riviera/axi_crossbar_v2_1_30

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap blk_mem_gen_v8_4_7 riviera/blk_mem_gen_v8_4_7
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_14 riviera/proc_sys_reset_v5_0_14
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_3 riviera/lib_pkg_v1_0_3
vmap lib_srl_fifo_v1_0_3 riviera/lib_srl_fifo_v1_0_3
vmap axi_uartlite_v2_0_33 riviera/axi_uartlite_v2_0_33
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_31 riviera/axi_gpio_v2_0_31
vmap generic_baseblocks_v2_1_1 riviera/generic_baseblocks_v2_1_1
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_29 riviera/axi_register_slice_v2_1_29
vmap fifo_generator_v13_2_9 riviera/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 riviera/axi_data_fifo_v2_1_28
vmap axi_crossbar_v2_1_30 riviera/axi_crossbar_v2_1_30

vlog -work xpm  -incr "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/alu.sv" \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/decoder.sv" \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/cpu_top.sv" \
"../../../bd/design_1/ip/design_1_RISC_V_CPU_0_0/sim/design_1_RISC_V_CPU_0_0.sv" \

vlog -work blk_mem_gen_v8_4_7  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_14 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_3 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/56d9/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_3 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/02c4/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_33 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/df48/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_31 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/6fbe/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_1  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9 -93  -incr \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_30  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/fb47/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

