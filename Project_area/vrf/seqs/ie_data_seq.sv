class ie_data_seq extends uvm_sequence#(wb_trans); 
	`uvm_object_utils(ie_data_seq)
          wb_trans req;
  bit [31:0]       ctrl;
//  bit [31:0]  temp_data;

    
extern function new(string name = "ie_data_seq");
extern task body();
endclass
/******************** constructor*********************/
function ie_data_seq :: new(string name="ie_data_seq");
  super.new(name);	
endfunction

/********************* body task*******************/

task ie_data_seq ::body();
 	req=wb_trans::type_id::create("req");
	begin

/******************************************************Divider register****************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`DIVIDER_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
	        finish_item(req);
   get_response(rsp);


/**********************************************Control_status reg************************************************/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR ;req.wr_en==1'h1;});
		if($value$plusargs("CHAR_LEN=%d",req.ctrl_reg.ctrl_char_len))
	//	req.ctrl_reg.ctrl_char_len=128'h08; 
		req.ctrl_reg.ctrl_res_1=1'h0;      
		req.ctrl_reg.ctrl_go=1'h0;		
	//	req.ctrl_reg.ctrl_rx_negedge=1'h0;	
	//	req.ctrl_reg.ctrl_tx_negedge=1'h1;
		
		if($value$plusargs("TX_NEG=%d ",req.ctrl_reg.ctrl_tx_negedge)) 
		if($value$plusargs(" RX_NEG=%d",req.ctrl_reg.ctrl_rx_negedge)) 
		begin
			req.ctrl_reg.ctrl_rx_negedge=1'h0;	
			req.ctrl_reg.ctrl_tx_negedge=1'h1;
		end
		else begin
			req.ctrl_reg.ctrl_rx_negedge=1'h1;	
			req.ctrl_reg.ctrl_tx_negedge=1'h0;
		end
	
		if($test$plusargs("MSB_TEST")) begin
			req.ctrl_reg.ctrl_lsb=1'h0; 
		end
		else begin
			req.ctrl_reg.ctrl_lsb=1'h1;
		end

		req.ctrl_reg.ctrl_lsb=1'h1;	       
		req.ctrl_reg.ctrl_ie=1'h1;		  
		req.ctrl_reg.ctrl_ass=1'h1;	        
		req.ctrl_reg.ctrl_res_2=32'h00_0000;
 
		ctrl={req.ctrl_reg.ctrl_res_2,req.ctrl_reg.ctrl_ass,req.ctrl_reg.ctrl_ie,req.ctrl_reg.ctrl_lsb,req.ctrl_reg.ctrl_tx_negedge,req.ctrl_reg.ctrl_rx_negedge,req.ctrl_reg.ctrl_go,req.ctrl_reg.ctrl_res_1,req.ctrl_reg.ctrl_char_len};

		req.reg_wr_data=ctrl;    //LSB first data
				
		finish_item(req);
   		get_response(rsp);

/******************************Slave Select reg*****************************************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`SS_ADDR;req.wr_en==1'h1;});
		$value$plusargs("SS_WR_DATA=%d",req.reg_wr_data);
		//assert(req.randomize()with{req.reg_addr==`SS_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
		finish_item(req);
  		get_response(rsp);


/*******************************************************Data_Tx reg 1 *****************************************1************/
//*************1*************
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`TX0_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hA5A5_AFAF;});
	//	assert(req.randomize()with{req.reg_addr==`TX0_ADDR;req.wr_en==1'h1;});
		finish_item(req);
  		 get_response(rsp);

//***************2**********
	  	start_item(req);
		assert(req.randomize()with{req.reg_addr==`TX1_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hCAFE_F00D;});
	//	assert(req.randomize()with{req.reg_addr==`TX1_ADDR;req.wr_en==1'h1;});
		finish_item(req);
  		get_response(rsp);

//*************3************
		start_item(req);
		assert(req.randomize()with{req.reg_addr==`TX2_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hDAAD_EAAE;});
	//	assert(req.randomize()with{req.reg_addr==`TX2_ADDR;req.wr_en==1'h1;});
		finish_item(req);
 		get_response(rsp);

//**************4***********
		start_item(req);
		assert(req.randomize()with{req.reg_addr==`TX3_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'hDEAD_BEAF;});
	//	assert(req.randomize()with{req.reg_addr==`TX3_ADDR;req.wr_en==1'h1;});
		finish_item(req);
 		get_response(rsp);

/**********************************************Control_status reg************************************************/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR ;req.wr_en==1'h1;});

		$value$plusargs("CHAR_LEN=%d",req.ctrl_reg.ctrl_char_len);
	//	req.ctrl_reg.ctrl_char_len=16; 
		`uvm_info(get_type_name(),$sformatf("*****[%0t]SPI_SEQUENSE*** req.ctrl_reg.ctrl_char_len=%d  ",$time,req.ctrl_reg.ctrl_char_len),UVM_HIGH)
		req.ctrl_reg.ctrl_res_1=1'h0;      
		req.ctrl_reg.ctrl_go=1'h1;		
		$value$plusargs("RX_NEG=%d",req.ctrl_reg.ctrl_rx_negedge);
		$value$plusargs("TX_NEG=%d",req.ctrl_reg.ctrl_rx_negedge);
	//	req.ctrl_reg.ctrl_rx_negedge=1'h0;	
	//	req.ctrl_reg.ctrl_tx_negedge=1'h1;
		`uvm_info(get_type_name(),$sformatf("*****[%0t]SPI_SEQUENSE*** req.ctrl_reg.ctrl_rx_negedge=%d  ",$time,req.ctrl_reg.ctrl_rx_negedge),UVM_HIGH)
		`uvm_info(get_type_name(),$sformatf("*****[%0t]SPI_SEQUENSE*** req.ctrl_reg.ctrl_tx_negedge=%d  ",$time,req.ctrl_reg.ctrl_tx_negedge),UVM_HIGH)
	
		if($test$plusargs("MSB_TEST")) begin
			req.ctrl_reg.ctrl_lsb=1'h0;
		end
		else begin
			req.ctrl_reg.ctrl_lsb=1'h1;
		end

		req.ctrl_reg.ctrl_ie=1'h1;		  
		req.ctrl_reg.ctrl_ass=1'h1;	        
		req.ctrl_reg.ctrl_res_2=32'h00_0000;
 
		ctrl={req.ctrl_reg.ctrl_res_2,req.ctrl_reg.ctrl_ass,req.ctrl_reg.ctrl_ie,req.ctrl_reg.ctrl_lsb,req.ctrl_reg.ctrl_tx_negedge,req.ctrl_reg.ctrl_rx_negedge,req.ctrl_reg.ctrl_go,req.ctrl_reg.ctrl_res_1,req.ctrl_reg.ctrl_char_len};

		req.reg_wr_data=ctrl;    //LSB first data
				
		finish_item(req);
   		get_response(rsp);

/************************************************************************/
		do begin
 			start_item(req);
			assert(req.randomize()with{req.reg_addr==`CTRL_STATUS_ADDR;req.wr_en==1'h0;});
			finish_item(req);

			get_response(rsp);

	//	`uvm_info(get_type_name(),$sformatf("*****[%0t] rsp.reg_rd_data=%b  ",$time,rsp.reg_rd_data),UVM_MEDIUM)
  	 	end while (rsp.reg_rd_data[8]!=0);


/*******************************************************Data_Dx reg 1 *****************************************1**********/
 		start_item(req);
		assert(req.randomize()with{req.reg_addr==`RX0_ADDR;req.wr_en==1'h0;});
		finish_item(req);
   		get_response(rsp);
	
//COMPARISION OF SEQUENCE REPONSE:
/*
 if(req.temp_data==rsp.reg_rd_data)
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 0 MATCHED    req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
 else
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 0 MISMATCHED req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
*/	
//***************2*********
		start_item(req);
		assert(req.randomize()with{req.reg_addr==`RX1_ADDR;req.wr_en==1'h0;});
		finish_item(req);
  		get_response(rsp);
//COMPARISION OF SEQUENCE REPONSE:
/*if(req.temp_data==rsp.reg_rd_data)
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 1 MATCHED    req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
 else
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 1 MISMATCHED req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
*/
//***************3************
		start_item(req);
		assert(req.randomize()with{req.reg_addr==`RX2_ADDR;req.wr_en==1'h0;});
		finish_item(req);
 		get_response(rsp);
//COMPARISION OF SEQUENCE REPONSE:
/*if(req.temp_data==rsp.reg_rd_data)
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 2 MATCHED    req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
 else
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 2 MISMATCHED req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
*/
//*****************4*********
		start_item(req);
		assert(req.randomize()with{req.reg_addr==`RX3_ADDR;req.wr_en==1'h0;});
		finish_item(req);
 		get_response(rsp);
//COMPARISION OF SEQUENCE REPONSE:
/*if(req.temp_data==rsp.reg_rd_data)
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 3 MATCHED    req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
 else
 	 	`uvm_info(get_type_name(),$sformatf("=== RX DATA REGISTER 3 MISMATCHED req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
*/
/************************************************************************************************************************/
	end
endtask


