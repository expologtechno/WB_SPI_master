class miso_data_seq extends uvm_sequence#(spi_slave_trans);
	`uvm_object_utils(miso_data_seq)

spi_slave_trans    spi_slave_trans_h;
/******************** constructor*********************/
function new(string name="miso_data_seq");
  super.new(name);	
endfunction

/********************* body task*******************/

task body();

	spi_slave_trans_h=spi_slave_trans::type_id::create("spi_slave_trans_h");
	begin

	start_item(spi_slave_trans_h);
	//spi_slave_trans_h.miso_wr_data=$random;
	spi_slave_trans_h.miso_wr_data=128'h1122_3344_5566_7788_99aa_bbcc_ddee_0f0f;
	spi_slave_trans_h.frame_size=128;
	  

	finish_item(spi_slave_trans_h);
  get_response(rsp);
	end	
endtask
endclass
