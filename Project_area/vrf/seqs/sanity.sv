class sanity_seq extends uvm_sequence#(wb_trans); //spi_base_seq;
	`uvm_object_utils(sanity_seq)
          wb_trans req;
    
  bit [31:0]       ctrl;
extern function new(string name = "sanity_seq");
extern task body();
endclass
/******************** constructor*********************/
function sanity_seq :: new(string name="sanity_seq");
  super.new(name);	
endfunction

/********************* body task*******************/

task sanity_seq ::body();
 	req=wb_trans::type_id::create("req");
	begin
/******************************************************Divider register****************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`DIVIDER_ADDR;req.wr_en==1'h1;});
		if($value$plusargs("DIV_REG=%d",req.reg_wr_data)) 
	        finish_item(req);
  	`uvm_info("LSB_8BIT_SEQUENCE","DIVIDER_COMPLETED ", UVM_MEDIUM)
   get_response(rsp);

/******************************Slave Select reg*****************************************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`SS_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
		finish_item(req);
  	`uvm_info("LSB_8BIT_SEQUENCE","SLAVE_SELECT_COMPLETED ", UVM_MEDIUM)
  		get_response(rsp);

/**********************************************Control_status reg************************************************/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR ;req.wr_en==1'h1;});
		$value$plusargs("CHAR_LEN=%d",req.ctrl_reg.ctrl_char_len); 
	//	req.ctrl_reg.ctrl_char_len=128'h08; 
		`uvm_info(get_type_name(),$sformatf("*****[%0t] req.ctrl_reg.ctrl_char_len=%d",$time,req.ctrl_reg.ctrl_char_len),UVM_MEDIUM)
		req.ctrl_reg.ctrl_res_1=1'h0;      
		req.ctrl_reg.ctrl_go=1'h0;		
	//	req.ctrl_reg.ctrl_rx_negedge=1'h0;	
	//	req.ctrl_reg.ctrl_tx_negedge=1'h1;
		
		$value$plusargs("TX_NEG=%d ",req.ctrl_reg.ctrl_tx_negedge);
		$value$plusargs(" RX_NEG=%d",req.ctrl_reg.ctrl_rx_negedge); 
		
		if($test$plusargs("MSB_TEST")) begin
			req.ctrl_reg.ctrl_lsb=1'h0; 
		end
		else begin
			req.ctrl_reg.ctrl_lsb=1'h1;
		end

		req.ctrl_reg.ctrl_ie=1'h0;		  
		req.ctrl_reg.ctrl_ass=1'h1;	        
		req.ctrl_reg.ctrl_res_2=32'h00_0000;
 
		ctrl={req.ctrl_reg.ctrl_res_2,req.ctrl_reg.ctrl_ass,req.ctrl_reg.ctrl_ie,req.ctrl_reg.ctrl_lsb,req.ctrl_reg.ctrl_tx_negedge,req.ctrl_reg.ctrl_rx_negedge,req.ctrl_reg.ctrl_go,req.ctrl_reg.ctrl_res_1,req.ctrl_reg.ctrl_char_len};

		req.reg_wr_data=ctrl;    //LSB first data
				
		finish_item(req);
  	`uvm_info("LSB_8BIT_SEQUENCE","control_status_COMPLETED ", UVM_MEDIUM)
   		get_response(rsp);


	end
endtask


