# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "parameter_instruction_space" -parent ${Page_0}


}

proc update_PARAM_VALUE.parameter_instruction_space { PARAM_VALUE.parameter_instruction_space } {
	# Procedure called to update parameter_instruction_space when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.parameter_instruction_space { PARAM_VALUE.parameter_instruction_space } {
	# Procedure called to validate parameter_instruction_space
	return true
}


proc update_MODELPARAM_VALUE.parameter_instruction_space { MODELPARAM_VALUE.parameter_instruction_space PARAM_VALUE.parameter_instruction_space } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.parameter_instruction_space}] ${MODELPARAM_VALUE.parameter_instruction_space}
}

