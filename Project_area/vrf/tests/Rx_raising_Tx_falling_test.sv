class Rx_raising_Tx_falling_test  extends spi_base_test;
	`uvm_component_utils(Rx_raising_Tx_falling_test)

//	spi_environment      spi_environment_h; 

	spi_virtual_sqr          spi_virtual_sqr_h;
//	virt_reset_seq           v_rst_sq;
	
	virt_Rx_raising_Tx_falling_seq    virt_Rx_raising_Tx_falling_seq_h;
       	virt_miso_data_seq       virt_miso_data_seq_h;

//----------------------constructor------------------------------------------
function new(string name="Rx_raising_Tx_falling_test",uvm_component parent);
	super.new(name,parent);
endfunction

//---------------------build_phase----------------------------------
function void  build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

//--------------------------run_phase---------------------------
task run_phase(uvm_phase phase);
	phase.raise_objection(this);
//	v_rst_sq=virt_reset_seq::type_id::create("v_rst_sq");
	virt_Rx_raising_Tx_falling_seq_h=virt_Rx_raising_Tx_falling_seq::type_id::create("virt_Rx_raising_Tx_falling_seq_h");
	virt_miso_data_seq_h=virt_miso_data_seq::type_id::create("virt_miso_data_seq_h");

fork
//	v_rst_sq.start(spi_environment_h.spi_v_seqr_h);
	virt_Rx_raising_Tx_falling_seq_h.start(spi_environment_h.spi_v_seqr_h);
	virt_miso_data_seq_h.start(spi_environment_h.spi_v_seqr_h);
	#5000;
join
	phase.drop_objection(this);
endtask
endclass
