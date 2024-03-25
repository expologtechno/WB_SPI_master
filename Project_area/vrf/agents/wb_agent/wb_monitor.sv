class wb_monitor extends uvm_monitor;

  `uvm_component_utils(wb_monitor)

  //virtual interface
  virtual wb_intf      wb_vif;

bit [63:0] packet;
bit [127:0] cntrl_status_reg;
bit [31:0] data0;
bit [31:0] data1;
bit [31:0] data2;
bit [31:0] data3;
bit [31:0] tx_data0;
bit [31:0] tx_data1;
bit [31:0] tx_data2;
bit [31:0] tx_data3;

  uvm_analysis_port #(wb_trans) wb_analysis_port;

  //wb transactor
  wb_trans   wb_trans_h;
 // int temp[5];
 
//*****coverage**********************

covergroup REQ_CG ;

	//REGISTERS
	SS_ADDR:            coverpoint wb_trans_h.reg_addr {bins ss_addr_bin={32'h18};}
	DIVIDER_ADDR:       coverpoint wb_trans_h.reg_addr {bins divider_addr_bin={32'h14};}
	CONTROL_STATUS_ADDR:coverpoint wb_trans_h.reg_addr {bins cntrl_status_bin={32'h10};}
	TX0:		    coverpoint wb_trans_h.reg_addr {bins tx0_bin={32'h00};}   
	TX1:		    coverpoint wb_trans_h.reg_addr {bins tx1_bin={32'h04};}   
	TX2:		    coverpoint wb_trans_h.reg_addr {bins tx2_bin={32'h08};}   
	TX3:		    coverpoint wb_trans_h.reg_addr {bins tx3_bin={32'h0C};}   
	RX0:  		    coverpoint wb_trans_h.reg_addr {bins rx0_bin={32'h00};}   
	RX1:   		    coverpoint wb_trans_h.reg_addr {bins rx1_bin={32'h04};}   
	RX2:  		    coverpoint wb_trans_h.reg_addr {bins rx2_bin={32'h08};}   
	RX3:		    coverpoint wb_trans_h.reg_addr {bins rx3_bin={32'h0c};}   

	//CONTRIL AND STATUS REGISTER[CTRL]
	CONTROL_STATUS_CHAR_LEN:coverpoint wb_trans_h.ctrl_reg.ctrl_char_len;
	CONTROL_STATUS_GO_BSY  :coverpoint wb_trans_h.ctrl_reg.ctrl_go;
	CONTROL_STATUS_RX_NEG  :coverpoint wb_trans_h.ctrl_reg.ctrl_rx_negedge;
	CONTROL_STATUS_TX_NEG  :coverpoint wb_trans_h.ctrl_reg.ctrl_tx_negedge;
	CONTROL_STATUS_LSB     :coverpoint wb_trans_h.ctrl_reg.ctrl_lsb;
	CONTROL_STATUS_IE      :coverpoint wb_trans_h.ctrl_reg.ctrl_ie;
	CONTROL_STATUS_ASS     :coverpoint wb_trans_h.ctrl_reg.ctrl_ass;
			
	//WRITE DATA
	WR_DATA:	    coverpoint wb_trans_h.reg_wr_data	{bins reg_wr_data={[0:$]};}
	
	//CROSS COVERAGE
	CR_SS_ADDR_WR_DATA            :cross  SS_ADDR,WR_DATA;
	CR_DIVIDER_ADDR_WR_DATA       :cross  DIVIDER_ADDR,WR_DATA;
	CR_CONTROL_STATUS_ADDR_WR_DATA:cross  CONTROL_STATUS_ADDR,WR_DATA;
	CR_TX0_ADDR_WR_DATA	      :cross  TX0,WR_DATA;
	CR_TX1_ADDR_WR_DATA	      :cross  TX1,WR_DATA;
	CR_TX2_ADDR_WR_DATA	      :cross  TX2,WR_DATA;
	CR_TX3_ADDR_WR_DATA	      :cross  TX3,WR_DATA;
	CR_RX0_ADDR_WR_DATA	      :cross  RX0,WR_DATA;
	CR_RX1_ADDR_WR_DATA	      :cross  RX1,WR_DATA;
	CR_RX2_ADDR_WR_DATA	      :cross  RX2,WR_DATA;
	CR_RX3_ADDR_WR_DATA	      :cross  RX3,WR_DATA;



 endgroup:REQ_CG

/**********************constructor********************************/
  function new(string name, uvm_component parent);
    super.new(name,parent);
    wb_trans_h=new();
    REQ_CG=new();
    wb_analysis_port = new("wb_analysis_port", this);
  endfunction 

/*********************build phase**********************/
 virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
	wb_trans_h=wb_trans::type_id::create("wb_trans");
    if (!uvm_config_db#(virtual wb_intf)::get(this,"*","wb_vif",wb_vif))
      `uvm_fatal("WB_DRV","**** Could not get virtual interface ****");
  endfunction: build_phase

/*******************run phase***********************/

virtual task run_phase(uvm_phase phase);
	
 	`uvm_info("WB_MON","WB Monitor Run Phase", UVM_LOW)

	wait(wb_vif.rstn==0);
	forever
	 begin
    		@(posedge wb_vif.clk);

 //	`uvm_info("WB_MON","WB_Monitor_Run_Phase_started", UVM_MEDIUM)
		 	if(wb_vif.wb_cyc_i  && wb_vif.wb_stb_i  && wb_vif.wb_sel_i ) begin
`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_vif.wb_cyc_i=%h wb_vif.wb_stb_i=%h wb_vif.wb_sel_i =%h ",$time,wb_vif.wb_cyc_i,wb_vif.wb_stb_i,wb_vif.wb_sel_i),UVM_HIGH)

				wb_trans_h.wr_en =  wb_vif.wb_we_i;
				`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.wr_en=%h wb_vif.wb_we_i=%h ",$time,wb_trans_h.wr_en,wb_vif.wb_we_i),UVM_HIGH)

				if(wb_trans_h.wr_en==1)	begin	
					@(posedge wb_vif.clk);
					wb_trans_h.reg_addr    = wb_vif.wb_adr_i;
					wb_trans_h.reg_wr_data = wb_vif.wb_dat_i;	
					`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_wr_data=%h wb_vif.wb_dat_i=%h ",$time,wb_trans_h.reg_wr_data,wb_vif.wb_dat_i),UVM_HIGH)

					if(wb_trans_h.reg_addr==`SS_ADDR) begin
						packet[31:0]=wb_trans_h.reg_wr_data;
				//		`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h packet0=%h ",$time,wb_trans_h.reg_addr,packet[31:0]),UVM_HIGH)
					end
	
					if(wb_trans_h.reg_addr==`DIVIDER_ADDR) begin
						packet[63:32]=wb_trans_h.reg_wr_data;
				//		`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h packet1=%h ",$time,wb_trans_h.reg_addr,packet[63:32]),UVM_HIGH)
					end
			
					if(wb_trans_h.reg_addr==`TX0_ADDR) begin
						wb_trans_h.mon_data[31:0]=wb_trans_h.reg_wr_data;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data0=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[31:0]),UVM_HIGH)
					end
	
					else if(wb_trans_h.reg_addr==`TX1_ADDR) begin
						wb_trans_h.mon_data[63:32]=wb_trans_h.reg_wr_data;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data1=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[63:32]),UVM_HIGH)

					end
	
					else if(wb_trans_h.reg_addr==`TX2_ADDR) begin
						wb_trans_h.mon_data[95:64]=wb_trans_h.reg_wr_data;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data2=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[95:64]),UVM_HIGH)
					end
	
					else if (wb_trans_h.reg_addr==`TX3_ADDR) begin
						wb_trans_h.mon_data[127:96]=wb_trans_h.reg_wr_data;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data3=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[127:96]),UVM_HIGH)
					end
		
					if(wb_trans_h.reg_addr==`CTRL_STATUS_ADDR) begin
						cntrl_status_reg=wb_trans_h.reg_wr_data;
					//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h cntrl_status_reg=%h ",$time,wb_trans_h.reg_addr,cntrl_status_reg[31:0]),UVM_MEDIUM)
					end
				end  
  		 		else begin
					@(posedge wb_vif.clk);
					wb_trans_h.reg_addr= wb_vif.wb_adr_i;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  wb_trans_h.reg_addr=%h ",$time,wb_trans_h.reg_addr),UVM_MEDIUM)
					@(posedge wb_vif.clk);
					if(wb_trans_h.reg_addr==`RX0_ADDR) begin
						data0 = wb_vif.wb_dat_o;
						if(cntrl_status_reg[7:0] > 0 && cntrl_status_reg[7:0] <=32) begin
							wb_trans_h.mon_rx_data[31:0] = data0;
							{wb_trans_h.ctrl_reg.ctrl_res_2,wb_trans_h.ctrl_reg.ctrl_ass,wb_trans_h.ctrl_reg.ctrl_ie,wb_trans_h.ctrl_reg.ctrl_lsb,wb_trans_h.ctrl_reg.ctrl_tx_negedge,wb_trans_h.ctrl_reg.ctrl_rx_negedge,wb_trans_h.ctrl_reg.ctrl_go,wb_trans_h.ctrl_reg.ctrl_res_1,wb_trans_h.ctrl_reg.ctrl_char_len}=cntrl_status_reg;


					//	`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR wb_trans_h.mon_rx_data[31:0]=%h ",$time,wb_trans_h.mon_rx_data[31:0]),UVM_MEDIUM)
							wb_analysis_port.write(wb_trans_h);
						end
					//	if(cntrl_status_reg[7:0] > 8 && cntrl_status_reg[7:0] <=16) begin
					//	`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_MEDIUM)
					//	wb_trans_h.mon_rx_data[15:0] = data0;
					//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.mon_rx_data[15:0]=%h ",$time,wb_trans_h.mon_rx_data[15:0]),UVM_MEDIUM)
					//	wb_analysis_port.write(wb_trans_h);
					//	end
					//	if(cntrl_status_reg[7:0] > 16 && cntrl_status_reg[7:0] <=32) begin
				//	//	`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
					//	wb_trans_h.mon_rx_data[31:0] = data0;

					//	wb_analysis_port.write(wb_trans_h);
					//	end

					end
			
					if(wb_trans_h.reg_addr==`RX1_ADDR) begin
						data1  = wb_vif.wb_dat_o;
						if(cntrl_status_reg[7:0] > 32 && cntrl_status_reg[7:0] <=64) begin
							wb_trans_h.mon_rx_data[63:0]={data1,data0};
							{wb_trans_h.ctrl_reg.ctrl_res_2,wb_trans_h.ctrl_reg.ctrl_ass,wb_trans_h.ctrl_reg.ctrl_ie,wb_trans_h.ctrl_reg.ctrl_lsb,wb_trans_h.ctrl_reg.ctrl_tx_negedge,wb_trans_h.ctrl_reg.ctrl_rx_negedge,wb_trans_h.ctrl_reg.ctrl_go,wb_trans_h.ctrl_reg.ctrl_res_1,wb_trans_h.ctrl_reg.ctrl_char_len}=cntrl_status_reg;


					//	`uvm_info(get_type_name(),$sformatf("*****[%0t] RX1_ADDR wb_trans_h.mon_rx_data[63:0]=%h ",$time,wb_trans_h.mon_rx_data[63:0]),UVM_MEDIUM)
							wb_analysis_port.write(wb_trans_h);
						end
					end

					if(wb_trans_h.reg_addr==`RX2_ADDR) begin 
						data2  = wb_vif.wb_dat_o;
						if(cntrl_status_reg[7:0] >64 && cntrl_status_reg[7:0] <=96) begin
							wb_trans_h.mon_rx_data[95:0]={data2,data1,data0};
							{wb_trans_h.ctrl_reg.ctrl_res_2,wb_trans_h.ctrl_reg.ctrl_ass,wb_trans_h.ctrl_reg.ctrl_ie,wb_trans_h.ctrl_reg.ctrl_lsb,wb_trans_h.ctrl_reg.ctrl_tx_negedge,wb_trans_h.ctrl_reg.ctrl_rx_negedge,wb_trans_h.ctrl_reg.ctrl_go,wb_trans_h.ctrl_reg.ctrl_res_1,wb_trans_h.ctrl_reg.ctrl_char_len}=cntrl_status_reg;


							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX2_ADDR  wb_trans_h.mon_rx_data[95:0]=%h ",$time,wb_trans_h.mon_rx_data[95:0]),UVM_HIGH)
							wb_analysis_port.write(wb_trans_h);
						end
					end

					if(wb_trans_h.reg_addr==`RX3_ADDR) begin
						data3  = wb_vif.wb_dat_o;
						if(((cntrl_status_reg[7:0] >96) && (cntrl_status_reg[7:0] <=127)) || (cntrl_status_reg[7:0] ==0)) begin
							wb_trans_h.mon_rx_data[127:0]={data3,data2,data1,data0};
							{wb_trans_h.ctrl_reg.ctrl_res_2,wb_trans_h.ctrl_reg.ctrl_ass,wb_trans_h.ctrl_reg.ctrl_ie,wb_trans_h.ctrl_reg.ctrl_lsb,wb_trans_h.ctrl_reg.ctrl_tx_negedge,wb_trans_h.ctrl_reg.ctrl_rx_negedge,wb_trans_h.ctrl_reg.ctrl_go,wb_trans_h.ctrl_reg.ctrl_res_1,wb_trans_h.ctrl_reg.ctrl_char_len}=cntrl_status_reg;

					//		`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  wb_trans_h.mon_rx_data=%h ",$time,wb_trans_h.mon_rx_data[127:0]),UVM_MEDIUM)
					      		wb_analysis_port.write(wb_trans_h);
						end

					end  
					
				end 
	//	`uvm_info(get_type_name(),$sformatf("[%0t]=============================================WB_MONITOR_from_dut ======================================= \n %s",$time,wb_trans_h.sprint()),UVM_MEDIUM)
			end

//**************functional coverage***********
REQ_CG.sample();

	end
 endtask : run_phase

endclass 

			
