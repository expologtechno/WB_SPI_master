class spi_base_test extends uvm_test;

  spi_environment      spi_environment_h; 

//reset_seq	     seq0;
//lsb_8bit_data_seq    seq1;
//ie_data_seq	     seq2;
//ss_data_seq	     seq3;
//rand_data_seq	     seq4;

//virtual interface
  virtual wb_intf       wb_vif;
  virtual spi_intf      spi_vif;

  `uvm_component_utils(spi_base_test)

  function new(string name="spi_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    spi_environment_h = spi_environment::type_id::create("spi_environment_h", this);
 
if (!uvm_config_db#(virtual wb_intf)::get(this,"*","wb_vif",wb_vif))
      `uvm_fatal("RESET_DRV WB","**** Could not get virtual WB interface ****");
 if (!uvm_config_db#(virtual spi_intf)::get(this,"*","spi_vif",spi_vif))
      `uvm_fatal("RESET_DRV SPI","**** Could not get virtual SPI interface ****");
 
uvm_config_db#(virtual wb_intf)::set(this,"*","wb_vif",wb_vif);
uvm_config_db#(virtual spi_intf)::set(this,"*","spi_vif",spi_vif);

  endfunction:build_phase

/**************************run_phase**************************************/
  task run_phase (uvm_phase phase);
  super.run_phase(phase);
  phase.raise_objection(this);
//  cfg_arb_mode();
//    `uvm_info(get_name, $sformatf("Arbitration mode = %s", spi_environment_h.spi_v_seqr_h.get_arbitration()), UVM_LOW);
//	seq0=reset_seq::type_id::create("reset_seq");
//	seq1=lsb_8bit_data_seq::type_id::create("lsb_8bit_data_seq");
//	seq2=ie_data_seq::type_id::create("ie_data_seq");
//	seq3=ss_data_seq::type_id::create("ss_data_seq");
//	seq4=rand_data_seq::type_id::create("rand_data_seq");
//
//  fork
//  	seq0.start(spi_environment_h.spi_v_seqr_h.sequencer);
//  	seq1.start(spi_environment_h.spi_v_seqr_h.sequencer);
//  	seq2.start(spi_environment_h.spi_v_seqr_h.sequencer);
//  	seq3.start(spi_environment_h.spi_v_seqr_h.sequencer);
//  	seq4.start(spi_environment_h.spi_v_seqr_h.sequencer);
//
//
//Join
  phase.drop_objection(this);
  endtask
//-------------------end_of_elaboration---------------------------
function void end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
endfunction
endclass:spi_base_test
