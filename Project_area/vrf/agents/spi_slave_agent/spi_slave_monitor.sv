class spi_slave_mon extends uvm_monitor;

  `uvm_component_utils(spi_slave_mon)

  spi_slave_trans   spi_slave_trans_h;

bit rx_neg_mon;
bit tx_neg_mon;
bit[31:0] ss_wr_data;
bit[31:0] ss_pad_value=32'hfffffffe;

  //virtual interface
  virtual spi_intf      spi_vif;

  uvm_analysis_port #(spi_slave_trans)       spi_slave_analysis_port;
  
  //*************** constructor*************************
  function new(string name="spi_slave_mon", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  // ********************* build phase *******************
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    spi_slave_trans_h = spi_slave_trans::type_id::create("spi_slave_trans_h", this);
    spi_slave_analysis_port = new("spi_slave_analysis_port", this);

    if (!uvm_config_db#(virtual spi_intf)::get(this,"*","spi_vif",spi_vif))
      `uvm_fatal("SPI_SLAVE_MON","**** Could not get virtual interface ****");
  endfunction:build_phase

  // ************************* connect phase ******************
  function void  connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

  // **************** run phase*********************
virtual task run_phase(uvm_phase phase);
int i=0;
int counter=0; 

    	forever begin
		$value$plusargs("SS_WR_DATA=%d",ss_wr_data);
		if(ss_wr_data==1) begin	
			ss_pad_value=32'hfffffffe;
		end
		else begin
			ss_pad_value=~(ss_wr_data);
		end
	
	      //  wait(spi_vif.ss_pad_o==32'hfffffffe);
	        wait(spi_vif.ss_pad_o==ss_pad_value);
	        @(negedge spi_vif.spi_clk);
	        while (spi_vif.ss_pad_o==ss_pad_value) begin
       	        	spi_slave_trans_h.mosi_rd_data[i]  = spi_vif.mosi_pad_o;
       			spi_slave_trans_h.miso_wr_data[i]  = spi_vif.miso_pad_i;

			i++;
			counter++;
			fork begin
			$value$plusargs("RX_NEG=%0d",rx_neg_mon);
			$value$plusargs("TX_NEG=%0d",tx_neg_mon);
			
			if(rx_neg_mon==0 && tx_neg_mon==0)begin	
				@(negedge spi_vif.spi_clk);
			end
			
			else if(rx_neg_mon==0 && tx_neg_mon==1) begin
				@(posedge spi_vif.spi_clk);
			end
			
			else if(rx_neg_mon==1 && tx_neg_mon==0) begin
				@(negedge spi_vif.spi_clk);
			end
			
			else if (rx_neg_mon==1 && tx_neg_mon==1) begin
				@(posedge spi_vif.spi_clk);
			end
      	`uvm_info(get_type_name(),$sformatf("*****[%0t]SPI_SLAVE_MONITOR********* rx_neg_mon=%0h tx_neg_mon=%0h ",$time,rx_neg_mon,tx_neg_mon),UVM_HIGH)
			end
			
			begin	
				wait (spi_vif.ss_pad_o==32'hffffffff);
			end
			join_any
			disable fork;

		/*	fork
			begin		
				@(posedge spi_vif.spi_clk);
			end
			begin	
				wait (spi_vif.ss_pad_o==32'hffffffff);
			end
			join_any
			disable fork;
		*/
		end
        	spi_slave_trans_h.frame_size=counter;

   //	 `uvm_info(get_type_name(),$sformatf("=============================================SPI_SLAVE MONITOR TO SCB======================================= \n %s",spi_slave_trans_h.sprint()),UVM_MEDIUM)
	
		//scoreboard write method
      		spi_slave_analysis_port.write(spi_slave_trans_h); 
		end

   // `uvm_info("SPI_SLAVE_MON","Monitor Run Phase completed", UVM_LOW)
      endtask:run_phase

endclass:spi_slave_mon


