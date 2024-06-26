transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/blk_mem_gen_v8_4_7
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_14
vlib activehdl/axi_lite_ipif_v3_0_4
vlib activehdl/lib_pkg_v1_0_3
vlib activehdl/lib_srl_fifo_v1_0_3
vlib activehdl/axi_uartlite_v2_0_33
vlib activehdl/interrupt_control_v3_1_5
vlib activehdl/axi_gpio_v2_0_31
vlib activehdl/generic_baseblocks_v2_1_1
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_register_slice_v2_1_29
vlib activehdl/fifo_generator_v13_2_9
vlib activehdl/axi_data_fifo_v2_1_28
vlib activehdl/axi_crossbar_v2_1_30

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap blk_mem_gen_v8_4_7 activehdl/blk_mem_gen_v8_4_7
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_14 activehdl/proc_sys_reset_v5_0_14
vmap axi_lite_ipif_v3_0_4 activehdl/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_3 activehdl/lib_pkg_v1_0_3
vmap lib_srl_fifo_v1_0_3 activehdl/lib_srl_fifo_v1_0_3
vmap axi_uartlite_v2_0_33 activehdl/axi_uartlite_v2_0_33
vmap interrupt_control_v3_1_5 activehdl/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_31 activehdl/axi_gpio_v2_0_31
vmap generic_baseblocks_v2_1_1 activehdl/generic_baseblocks_v2_1_1
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_29 activehdl/axi_register_slice_v2_1_29
vmap fifo_generator_v13_2_9 activehdl/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 activehdl/axi_data_fifo_v2_1_28
vmap axi_crossbar_v2_1_30 activehdl/axi_crossbar_v2_1_30

vlog -work xpm  -sv2k12 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/alu.sv" \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/decoder.sv" \
"../../../bd/design_1/ipshared/92ec/_1/algebra-verilog-cpu/project_1.srcs/sources_1/new/cpu_top.sv" \
"../../../bd/design_1/ip/design_1_RISC_V_CPU_0_0/sim/design_1_RISC_V_CPU_0_0.sv" \

vlog -work blk_mem_gen_v8_4_7  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ip/design_1_blk_mem_gen_0_0/sim/design_1_blk_mem_gen_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_14 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_3 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/56d9/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_3 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/02c4/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_33 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/df48/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_axi_uartlite_0_0/sim/design_1_axi_uartlite_0_0.vhd" \

vcom -work interrupt_control_v3_1_5 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_31 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/6fbe/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/design_1/ip/design_1_axi_gpio_0_0/sim/design_1_axi_gpio_0_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_gpio_1_0/sim/design_1_axi_gpio_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_1  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9 -93  \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_30  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../../project_1.gen/sources_1/bd/design_1/ipshared/fb47/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/c2c6" "+incdir+../../../../project_1.gen/sources_1/bd/design_1/ipshared/ec67/hdl" -l xpm -l xil_defaultlib -l blk_mem_gen_v8_4_7 -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_14 -l axi_lite_ipif_v3_0_4 -l lib_pkg_v1_0_3 -l lib_srl_fifo_v1_0_3 -l axi_uartlite_v2_0_33 -l interrupt_control_v3_1_5 -l axi_gpio_v2_0_31 -l generic_baseblocks_v2_1_1 -l axi_infrastructure_v1_1_0 -l axi_register_slice_v2_1_29 -l fifo_generator_v13_2_9 -l axi_data_fifo_v2_1_28 -l axi_crossbar_v2_1_30 \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

