onerror {exit -code 1}
vlib work
vlog -work work mips.vo
vlog -work work Waveform.vwf.vt
vsim -c -t 1ps -voptargs=+acc -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.UnidadedeProcessamento_vlg_vec_tst
vcd file -direction mips.msim.vcd
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/clock
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Interruptores
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Inst
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Out_ULA
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/zero
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Display1
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Display2
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Display3
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Display4
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/valorPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/BEQ
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/BNE
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/Control_Branch
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/ProximoPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/EnderecoBranch
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/EnderecoFinalPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/ReadDataRS
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/ReadDataRT
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/ImediatoEstendido
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Wave_Dado1
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Wave_Saida_AluSrc
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Wave_Saida_RegDST
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Wave_Saida_MemToReg
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/Wave_Unit_Control_ALU
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/auxRS
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/auxRT
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/valorPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/RegWrite
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/ALUSrc
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/Out
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/valorPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/Halt
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/int_halt
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/save_pc_halt
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/PCFunct
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/PCFunctHabilitaHalt
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/EnderecoFinalPC
vcd add sim:/UnidadedeProcessamento_vlg_vec_tst/i1/Out
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f




