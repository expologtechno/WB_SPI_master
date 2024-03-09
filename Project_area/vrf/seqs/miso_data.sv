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
	spi_slave_trans_h.miso_wr_data=128'h1122_3344_5566_7788_99aa_bbcc_ddee_0f0f;
	spi_slave_trans_h.frame_size=128;
	  

	finish_item(spi_slave_trans_h);
  get_response(rsp);
	end	
endtask
endclass


	//assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==128'b 0001_0010_0011_0100_0101_0110_0111_1000_0001_0010_0011_0100_0101_0110_0111_1000_0001_0010_0011_0100_0101_0110_0111_1000_0001_0010_0011_0100_0101_0110_0111_1000_; spi_slave_trans_h.frame_size==8'h08; });
/*	begin
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
//*******************************************
	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************2**********

	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
//*******************************************
	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************3**********

	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
//*******************************************
	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************4*******************	
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
//*******************************************
	start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

//******************************

start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);

		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h0; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
		start_item(spi_slave_trans_h);
		assert(spi_slave_trans_h.randomize()with{spi_slave_trans_h.miso_wr_data==32'h1; });
		finish_item(spi_slave_trans_h);
	 get_response(rsp);
*/
//`uvm_info(get_type_name(),$sformatf("[%0t]=== MISO WRITE DATA===rsp.miso_wr_data=%0h ******",$time,rsp.miso_wr_data),UVM_MEDIUM)
	


