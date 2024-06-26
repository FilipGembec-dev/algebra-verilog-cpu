transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+design_1  -L xpm -L xil_defaultlib -L blk_mem_gen_v8_4_7 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_14 -L axi_lite_ipif_v3_0_4 -L lib_pkg_v1_0_3 -L lib_srl_fifo_v1_0_3 -L axi_uartlite_v2_0_33 -L interrupt_control_v3_1_5 -L axi_gpio_v2_0_31 -L generic_baseblocks_v2_1_1 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_29 -L fifo_generator_v13_2_9 -L axi_data_fifo_v2_1_28 -L axi_crossbar_v2_1_30 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.design_1 xil_defaultlib.glbl

do {design_1.udo}

run 1000ns

endsim

quit -force
