class spi_slave_driver extends uvm_driver#(spi_slave_trans);

  `uvm_component_utils(spi_slave_driver)

bit rx_neg;
bit tx_neg;
bit[31:0] ss_wr_data;
bit[31:0] ss_pad_value=32'hfffffffe;

  spi_slave_trans               spi_slave_trans_h;

  //virtual interface
  virtual spi_intf      spi_vif;
/************************constructor*****************************/
  function new(string name="spi_slave_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new
/************************build phase****************************/
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_intf)::get(this,"*","spi_vif",spi_vif))
      `uvm_fatal("SPI_SLAVE_DRV","**** Could not get virtual interface ****");

    spi_slave_trans_h = spi_slave_trans::type_id::create("spi_slave_trans_h");
  endfunction:build_phase
/*************************Run phase*****************************/
task run_phase(uvm_phase phase);
  //  `uvm_info("SPI_SLAVE_DRIVER","Driver Run Phase", UVM_LOW)
	forever begin
		seq_item_port.get_next_item(spi_slave_trans_h);
    	        begin
			$value$plusargs("SS_WR_DATA=%d",ss_wr_data);
// 	 		`uvm_info(get_type_name(),$sformatf("=== SS ADDR REGISTER  ss_wr_data=%0d ",ss_wr_data),UVM_MEDIUM)
			
			if(ss_wr_data==1) begin	
				ss_pad_value=32'hfffffffe;
			end
			else begin
			ss_pad_value=~(ss_wr_data);
 //	 			`uvm_info(get_type_name(),$sformatf("=== SS PAD VALUE  ss_pad_value1=%0h ",ss_pad_value),UVM_MEDIUM)
			end

	        	//wait(spi_vif.ss_pad_o==32'hfffffffe);
	       	 	wait(spi_vif.ss_pad_o==ss_pad_value);
		 	while (spi_vif.ss_pad_o==ss_pad_value) begin
				for(int i=0; i<spi_slave_trans_h.frame_size; i++) begin
					spi_vif.miso_pad_i              <=  spi_slave_trans_h.miso_wr_data[i] ;
					spi_slave_trans_h.mosi_rd_data  <=  spi_vif.mosi_pad_o ;

					fork begin
						$value$plusargs("RX_NEG=%d",rx_neg);
						$value$plusargs("TX_NEG=%d",tx_neg);
						
						if(rx_neg==0 && tx_neg==0)begin	
							@(negedge spi_vif.spi_clk);
						//	@(posedge spi_vif.spi_clk);
						end
				
						else if(rx_neg==0 && tx_neg==1) begin
							@(negedge spi_vif.spi_clk);
						end
					
						else if(rx_neg==1 && tx_neg==0) begin
							@(negedge spi_vif.spi_clk);
						end
					
						else if (rx_neg==1 && tx_neg==1) begin
						//	@(posedge spi_vif.spi_clk);
							@(negedge spi_vif.spi_clk);
						end 
      						`uvm_info(get_type_name(),$sformatf("*****[%0t]SPI_SLAVE_DRIVER********* rx_neg=%0h tx_neg=%0h ",$time,rx_neg,tx_neg),UVM_HIGH)
					end
				
					begin	
						wait (spi_vif.ss_pad_o==32'hffffffff);
					end
					join_any
					disable fork;
 
					if(spi_vif.ss_pad_o==32'hffffffff)
					break;

				end
			end
		end
//	 `uvm_info(get_type_name(),$sformatf("=============================================SPI_SLAVE_DRIVER_to_dut ======================================= \n %s",spi_slave_trans_h.sprint()),UVM_MEDIUM)
// responses [RSP]
      		rsp = spi_slave_trans::type_id::create("rsp");
		rsp=spi_slave_trans_h;
      //	@(posedge spi_vif.spi_clk);
		rsp.set_id_info(spi_slave_trans_h);
      //	seq_item_port.put(rsp);

		seq_item_port.item_done(rsp);
//`uvm_info(get_type_name(),$sformatf("*****[%0t] miso_wr_data=%0h ",$time,rsp.miso_wr_data),UVM_MEDIUM)
	end    	 
endtask


endclass:spi_slave_driver
		
