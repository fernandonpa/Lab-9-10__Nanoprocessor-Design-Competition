# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Vivado/Lab9-10/.Xil/Vivado-1816-Praneeth/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Vivado/Lab9-10/Lab9-10.cache/wt [current_project]
set_property parent.project_path C:/Vivado/Lab9-10/Lab9-10.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo c:/Vivado/Lab9-10/Lab9-10.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/ALU_4bit.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Decoder_2_to_4.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Decoder_3_to_8.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/FA.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Fetch_Instruction.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Generic_MUX.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/HA.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Instruction_Decoder.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/LUT_16_7.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/MUX_8to1.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/MUX_8to1_4bit.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Nano_Processor.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Program_Counter.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Program_ROM_1.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/RCA_3bit.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Reg.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Register_Bank.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Slow_Clk.vhd
  C:/Vivado/Lab9-10/Lab9-10.srcs/sources_1/new/Nano_Processor_with7seg_out.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Vivado/project_122/project_122.srcs/constrs_1/imports/Downloads/Basys3Labs.xdc
set_property used_in_implementation false [get_files C:/Vivado/project_122/project_122.srcs/constrs_1/imports/Downloads/Basys3Labs.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Nano_Processor_with_out -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Nano_Processor_with_out.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Nano_Processor_with_out_utilization_synth.rpt -pb Nano_Processor_with_out_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
