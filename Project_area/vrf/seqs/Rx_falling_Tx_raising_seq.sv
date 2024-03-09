class Rx_falling_Tx_raising_seq extends uvm_sequence#(wb_trans); //spi_base_seq;
	`uvm_object_utils(Rx_falling_Tx_raising_seq)
          wb_trans req;
  bit [31:0]       ctrl;
 // bit [31:0]  temp_data;

    
extern function new(string name = "Rx_falling_Tx_raising_seq");
extern task body();
endclass
/******************** constructor*********************/
function Rx_falling_Tx_raising_seq :: new(string name="Rx_falling_Tx_raising_seq");
  super.new(name);	
endfunction

/********************* body task*******************/

task Rx_falling_Tx_raising_seq ::body();
  	//super.body();
 	req=wb_trans::type_id::create("req");
	begin
/******************************Slave Select reg*****************************************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`SS_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
		finish_item(req);
  get_response(rsp);
/******************************************************Divider register****************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`DIVIDER_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
	        finish_item(req);
   get_response(rsp);

/*******************************************************Data_Tx reg 1 *****************************************1************/
//*************1*************
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`TX0_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hAFAF;});
		finish_item(req);
   get_response(rsp);

////***************2**********
//	  	start_item(req);
//		assert(req.randomize()with{req.reg_addr==`TX1_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hCAFE_F00D;});
//		finish_item(req);
//  get_response(rsp);
//
////*************3************
//		start_item(req);
//		assert(req.randomize()with{req.reg_addr==`TX2_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hDAAD_FFFF;});
//		finish_item(req);
// get_response(rsp);
//
////**************4***********
//		start_item(req);
//		assert(req.randomize()with{req.reg_addr==`TX3_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h1234_5678;});
//		finish_item(req);
// get_response(rsp);

/**********************************************Control_status reg************************************************/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR ;req.wr_en==1'h1;});

		req.ctrl_reg.ctrl_char_len=08; 
		req.ctrl_reg.ctrl_res_1=1'h0;      
		req.ctrl_reg.ctrl_go=1'h1;		
		req.ctrl_reg.ctrl_rx_negedge=1'h0;	
		req.ctrl_reg.ctrl_tx_negedge=1'h1;	
		req.ctrl_reg.ctrl_lsb=1'h0;	       
		req.ctrl_reg.ctrl_ie=1'h0;		  
		req.ctrl_reg.ctrl_ass=1'h1;	        
		req.ctrl_reg.ctrl_res_2=32'h00_0000;
 
		ctrl={req.ctrl_reg.ctrl_res_2,req.ctrl_reg.ctrl_ass,req.ctrl_reg.ctrl_ie,req.ctrl_reg.ctrl_lsb,req.ctrl_reg.ctrl_tx_negedge,req.ctrl_reg.ctrl_rx_negedge,req.ctrl_reg.ctrl_go,req.ctrl_reg.ctrl_res_1,req.ctrl_reg.ctrl_char_len};

		req.reg_wr_data=ctrl;    //LSB first data
				
		finish_item(req);
   get_response(rsp);

do begin
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR;req.wr_en==1'h0;});
   end
	 while (rsp.reg_rd_data[8]!=0);
                finish_item(req);

 get_response(rsp);

/*******************************************************Data_Dx reg 1 *****************************************1**********/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`RX0_ADDR;req.wr_en==1'h0;});
		finish_item(req);
   get_response(rsp);
 
////***************2*********
//		start_item(req);
//		assert(req.randomize()with{req.reg_addr==`RX1_ADDR;req.wr_en==1'h0;});
//		finish_item(req);
//  get_response(rsp);
////***************3************
//		start_item(req);
//		assert(req.randomize()with{req.reg_addr==`RX2_ADDR;req.wr_en==1'h0;});
//		finish_item(req);
// get_response(rsp);
//
////*****************4*********
//		start_item(req);
//		assert(req.randomize()with{req.reg_addr==`RX3_ADDR;req.wr_en==1'h0;});
//		finish_item(req);
// get_response(rsp);

/************************************************************************************************************************/
	end
endtask

