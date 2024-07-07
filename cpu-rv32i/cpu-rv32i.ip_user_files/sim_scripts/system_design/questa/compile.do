vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/lib_pkg_v1_0_3
vlib questa_lib/msim/lib_srl_fifo_v1_0_3
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_uartlite_v2_0_33
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/proc_sys_reset_v5_0_14
vlib questa_lib/msim/interrupt_control_v3_1_5
vlib questa_lib/msim/axi_gpio_v2_0_31
vlib questa_lib/msim/blk_mem_gen_v8_4_7
vlib questa_lib/msim/generic_baseblocks_v2_1_1
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_29
vlib questa_lib/msim/fifo_generator_v13_2_9
vlib questa_lib/msim/axi_data_fifo_v2_1_28
vlib questa_lib/msim/axi_crossbar_v2_1_30

vmap xpm questa_lib/msim/xpm
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_3 questa_lib/msim/lib_pkg_v1_0_3
vmap lib_srl_fifo_v1_0_3 questa_lib/msim/lib_srl_fifo_v1_0_3
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_33 questa_lib/msim/axi_uartlite_v2_0_33
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap proc_sys_reset_v5_0_14 questa_lib/msim/proc_sys_reset_v5_0_14
vmap interrupt_control_v3_1_5 questa_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_31 questa_lib/msim/axi_gpio_v2_0_31
vmap blk_mem_gen_v8_4_7 questa_lib/msim/blk_mem_gen_v8_4_7
vmap generic_baseblocks_v2_1_1 questa_lib/msim/generic_baseblocks_v2_1_1
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_29 questa_lib/msim/axi_register_slice_v2_1_29
vmap fifo_generator_v13_2_9 questa_lib/msim/fifo_generator_v13_2_9
vmap axi_data_fifo_v2_1_28 questa_lib/msim/axi_data_fifo_v2_1_28
vmap axi_crossbar_v2_1_30 questa_lib/msim/axi_crossbar_v2_1_30

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_3  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/56d9/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_3  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/02c4/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_33  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/df48/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/system_design/ip/system_design_axi_uartlite_0_0/sim/system_design_axi_uartlite_0_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../bd/system_design/ip/system_design_clk_wiz_0/system_design_clk_wiz_0_clk_wiz.v" \
"../../../bd/system_design/ip/system_design_clk_wiz_0/system_design_clk_wiz_0.v" \

vcom -work proc_sys_reset_v5_0_14  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/408c/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/system_design/ip/system_design_rst_clk_wiz_100M_0/sim/system_design_rst_clk_wiz_100M_0.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_31  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/6fbe/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/system_design/ip/system_design_axi_gpio_0_0/sim/system_design_axi_gpio_0_0.vhd" \
"../../../bd/system_design/ip/system_design_axi_gpio_1_0/sim/system_design_axi_gpio_1_0.vhd" \

vlog -work blk_mem_gen_v8_4_7  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/3c0c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../bd/system_design/ip/system_design_blk_mem_gen_0_0/sim/system_design_blk_mem_gen_0_0.v" \
"../../../bd/system_design/ip/system_design_cpu_wrapper_0_1/sim/system_design_cpu_wrapper_0_1.v" \
"../../../bd/system_design/sim/system_design.v" \

vlog -work generic_baseblocks_v2_1_1  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/10ab/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_29  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ff9f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ac72/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_9  -93  \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_9  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ac72/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_28  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/279e/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_30  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/fb47/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/c2c6" "+incdir+../../../../cpu-rv32i.gen/sources_1/bd/system_design/ipshared/ec67/hdl" \
"../../../bd/system_design/ip/system_design_xbar_1/sim/system_design_xbar_1.v" \
"../../../bd/system_design/ip/system_design_s00_regslice_0/sim/system_design_s00_regslice_0.v" \
"../../../bd/system_design/ip/system_design_s00_data_fifo_0/sim/system_design_s00_data_fifo_0.v" \
"../../../bd/system_design/ip/system_design_m02_data_fifo_0/sim/system_design_m02_data_fifo_0.v" \
"../../../bd/system_design/ip/system_design_m02_regslice_0/sim/system_design_m02_regslice_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

