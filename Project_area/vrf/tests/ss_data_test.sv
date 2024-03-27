class ss_data_test extends spi_base_test;
	`uvm_component_utils(ss_data_test)

	spi_virtual_sqr          spi_virtual_sqr_h;
	
	virt_ss_data_seq         virt_ss_data_seq_h;
	virt_miso_data_seq       virt_miso_data_seq_h;

//----------------------constructor------------------------------------------
function new(string name="ss_data_test",uvm_component parent);
	super.new(name,parent);
endfunction

//---------------------build_phase----------------------------------
function void  build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

//--------------------------run_phase---------------------------
task run_phase(uvm_phase phase);
	`uvm_info("SS_DATA_TEST","SS_DATA_TEST_BEFORE_RAISE_OBJECTION ", UVM_MEDIUM)
	phase.raise_objection(this);
  	`uvm_info("SS_DATA_TEST","SS_DATA_TEST_AFTER_RAISE_OBJECTION ", UVM_MEDIUM)
	virt_ss_data_seq_h=virt_ss_data_seq::type_id::create("virt_ss_data_seq_h");
	virt_miso_data_seq_h=virt_miso_data_seq::type_id::create("virt_miso_data_seq_h");


fork
//	v_rst_sq.start(spi_environment_h.spi_v_seqr_h);
	virt_ss_data_seq_h.start(spi_environment_h.spi_v_seqr_h);
	virt_miso_data_seq_h.start(spi_environment_h.spi_v_seqr_h);

	#6000;
join
	`uvm_info("SS_DATA_TEST","SS_DATA_TEST_BEFORE_DROP_OBJECTION ", UVM_MEDIUM)
	phase.drop_objection(this);
  	`uvm_info("SS_DATA_TEST","SS_DATA_TEST_AFTER_DROP_OBJECTION ", UVM_MEDIUM)
endtask
endclass
