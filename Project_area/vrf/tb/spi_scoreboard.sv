class spi_sbd extends uvm_scoreboard;
  bit[127:0] data_mask;
   //virtual interface
  virtual wb_intf      wb_vif;
  virtual spi_intf     spi_vif;

bit[127:0] temp;
//bit[127:0] temp1;
bit[127:0] data_length;
bit[127:0] rx_data_length;
bit[127:0] data;
bit[127:0] rx_data;

  `uvm_component_utils(spi_sbd)
  
  wb_trans	       wb_trans_scb_h;
  spi_slave_trans      spi_slave_trans_scb_h;

uvm_tlm_analysis_fifo#(wb_trans) wb_analysis_fifo;
uvm_tlm_analysis_fifo#(spi_slave_trans) spi_slave_analysis_fifo;

/*******************constructor*********************************/
  function new(string name="spi_sbd", uvm_component parent);
    super.new(name, parent);
  endfunction:new

/**********************build phase********************************/
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    spi_slave_trans_scb_h  = spi_slave_trans::type_id::create("spi_slave_trans_scb_h",  this);
    wb_trans_scb_h  = wb_trans::type_id::create("wb_trans_scb_h",  this);
//    wb_agent_cov_h  = wb_agent_cov::type_id::create("wb_agent_cov_h",  this);

    wb_analysis_fifo = new("wb_analysis_fifo",this);
    spi_slave_analysis_fifo = new("spi_slave_analysis_fifo",this);

  endfunction:build_phase


/***********************************run phase*************************/
  virtual task run_phase(uvm_phase phase);
//	phase.raise_objection(this);
    
 	`uvm_info("SPI_SCOREBOARD","SCOREBOARD Run Phase", UVM_LOW)
	forever 
		begin
		fork
			begin
				wb_analysis_fifo.get(wb_trans_scb_h);
     			//	`uvm_info(get_type_name(),$sformatf("=============================================WB_TRANS_MONITOR_SCBD ======================================= \n %s",wb_trans_scb_h.sprint()),UVM_MEDIUM)
			end

			begin
				spi_slave_analysis_fifo.get(spi_slave_trans_scb_h);
   				`uvm_info(get_type_name(),$sformatf("=============================================SPI_SLAVE_TRANS_MONITOR_SCBD ======================================= \n %s",spi_slave_trans_scb_h.sprint()),UVM_MEDIUM)
   			end
        	join
			if($value$plusargs("CHAR_LEN=%d",wb_trans_scb_h.ctrl_reg.ctrl_char_len)) begin
				
				if(wb_trans_scb_h.ctrl_reg.ctrl_char_len>0) begin
				data_mask = {128{1'b1}} >> (128-wb_trans_scb_h.ctrl_reg.ctrl_char_len);
				
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] data_mask=%h",$time,data_mask),UVM_MEDIUM)
				end
	
				else begin
					data_mask ='h FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] data_mask=%h",$time,data_mask),UVM_MEDIUM)
				end

			//	`uvm_info(get_type_name(),$sformatf("*****[%0t]  wb_trans_scb_h.mon_data=%h",$time,wb_trans_scb_h.mon_data),UVM_MEDIUM)
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%h",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
	      			wb_trans_scb_h.mon_data = wb_trans_scb_h.mon_data & data_mask;
	      			wb_trans_scb_h.mon_rx_data = wb_trans_scb_h.mon_rx_data & data_mask;
				
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t]  wb_trans_scb_h.mon_data=%h",$time,wb_trans_scb_h.mon_data),UVM_MEDIUM)
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%h",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
			end
			 
			if($test$plusargs("MSB_TEST")) begin
				//temp=spi_slave_trans_scb_h.mosi_rd_data;
				`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.mosi_rd_data=%h",$time,spi_slave_trans_scb_h.mosi_rd_data),UVM_MEDIUM)
		//	       `uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%h",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
		//		temp=wb_trans_scb_h.mon_rx_data;
		//		for(int i=0; i<wb_trans_scb_h.ctrl_reg.ctrl_char_len; i++) begin
		//			wb_trans_scb_h.mon_rx_data[i]=temp[127-i];
		//		`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%b",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
		//		end
		//		`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%h",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
				
				if(wb_trans_scb_h.ctrl_reg.ctrl_char_len>0) begin
				data_length= {<<4{spi_slave_trans_scb_h.mosi_rd_data}};
				$display("data_length=%0h",data_length);
				data=data_length >> (128-wb_trans_scb_h.ctrl_reg.ctrl_char_len);
				$display("data=%0h",data);
				spi_slave_trans_scb_h.mosi_rd_data=data;
				end
				else begin
				data_length= {<<1{spi_slave_trans_scb_h.mosi_rd_data}};
				spi_slave_trans_scb_h.mosi_rd_data=data_length;
				end

				if(wb_trans_scb_h.ctrl_reg.ctrl_char_len>0) begin
				rx_data_length= {<<1{wb_trans_scb_h.mon_rx_data}};
				$display("rx_data_length=%0h",rx_data_length);
				rx_data=rx_data_length >> (128-wb_trans_scb_h.ctrl_reg.ctrl_char_len);
				$display("rx_data=%0h",rx_data);
				wb_trans_scb_h.mon_rx_data=rx_data;
				end
				else begin
				rx_data_length= {<<1{wb_trans_scb_h.mon_rx_data}};
				wb_trans_scb_h.mon_rx_data=rx_data_length;
				$display("rx_data_length=%0h",rx_data_length);
				end
		
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.mosi_rd_data=%h",$time,spi_slave_trans_scb_h.mosi_rd_data),UVM_MEDIUM)
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_scb_h.mon_rx_data=%h",$time,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
			end
			
			
	 		if(spi_slave_trans_scb_h.mosi_rd_data==wb_trans_scb_h.mon_data) begin
				`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.mosi_rd_data=%h  wb_trans_scb_h.mon_data=%h",$time,spi_slave_trans_scb_h.mosi_rd_data,wb_trans_scb_h.mon_data),UVM_MEDIUM)
	  			`uvm_info("SPI_SCOREBOARD","SCOREBOARD_DATA_MATCHED", UVM_LOW)
			end

			else begin
				`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.mosi_rd_data=%h  wb_trans_scb_h.mon_data=%h",$time,spi_slave_trans_scb_h.mosi_rd_data,wb_trans_scb_h.mon_data),UVM_MEDIUM)
  				`uvm_error("SPI_SCOREBOARD","SCOREBOARD_DATA_MISMATCHED")
			end

			if(spi_slave_trans_scb_h.miso_wr_data==wb_trans_scb_h.mon_rx_data) begin
				`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.miso_wr_data=%h  wb_trans_scb_h.mon_rx_data=%h",$time,spi_slave_trans_scb_h.miso_wr_data,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
  				`uvm_info("SPI_SCOREBOARD","SCOREBOARD_DATA_MATCHED", UVM_LOW)
			end

			else begin
				`uvm_info(get_type_name(),$sformatf("*****[%0t] spi_slave_trans_scb_h.miso_wr_data=%h  wb_trans_scb_h.mon_rx_data=%h",$time,spi_slave_trans_scb_h.miso_wr_data,wb_trans_scb_h.mon_rx_data),UVM_MEDIUM)
  				`uvm_error("SPI_SCOREBOARD","SCOREBOARD_DATA_MISMATCHED")
			end
			
  		end
//	phase.drop_objection(this);

  endtask:run_phase

endclass:spi_sbd

