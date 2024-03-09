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

  uvm_analysis_port #(wb_trans) wb_analysis_port;

  //wb transactor
  wb_trans   wb_trans_h;
 // int temp[5];
  /**********************constructor********************************/
  function new(string name, uvm_component parent);
    super.new(name,parent);
    wb_trans_h=new();
    wb_analysis_port = new("wb_analysis_port", this);
  endfunction 

/*********************build phase**********************/
 virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual wb_intf)::get(this,"*","wb_vif",wb_vif))
      `uvm_fatal("WB_DRV","**** Could not get virtual interface ****");
  endfunction: build_phase

/*******************run phase***********************/
virtual task run_phase(uvm_phase phase);
	
	wb_trans_h=wb_trans::type_id::create("wb_trans");
 	`uvm_info("WB_MON","WB Monitor Run Phase", UVM_LOW)

	`uvm_info("WB_MONITOR","WB_MONITOR_BEFORE_RAISE_OBJECTION ", UVM_HIGH)
	phase.raise_objection(this);
  	`uvm_info("WB_MONITOR","WB_MONITOR_AFTER_RAISE_OBJECTION ", UVM_HIGH)

	wait(wb_vif.rstn==0);
	forever
	begin
     		@((wb_vif.clk) && !wb_vif.rstn )
		begin
			@(posedge wb_vif.clk);

		 //	if(wb_vif.wb_cyc_i  && wb_vif.wb_stb_i  && wb_vif.wb_sel_i  && wb_vif.wb_ack_o) begin
//`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_vif.wb_cyc_i=%h wb_vif.wb_stb_i=%h wb_vif.wb_sel_i =%h wb_vif.wb_ack_o=%h",$time,wb_vif.wb_cyc_i,wb_vif.wb_stb_i,wb_vif.wb_sel_i,wb_vif.wb_ack_o),UVM_MEDIUM)
//
				wb_trans_h.wr_en =  wb_vif.wb_we_i;
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.wr_en=%h wb_vif.wb_we_i=%h ",$time,wb_trans_h.wr_en,wb_vif.wb_we_i),UVM_MEDIUM)

				if(wb_trans_h.wr_en==1)	begin	
					@(posedge wb_vif.clk);
					wb_trans_h.reg_addr    = wb_vif.wb_adr_i;
					wb_trans_h.reg_wr_data = wb_vif.wb_dat_i;
	
			//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_wr_data=%h wb_vif.wb_dat_i=%h ",$time,wb_trans_h.reg_wr_data,wb_vif.wb_dat_i),UVM_HIGH)

					if(wb_trans_h.reg_addr==`SS_ADDR) begin
						packet[31:0]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h packet0=%h ",$time,wb_trans_h.reg_addr,packet[31:0]),UVM_HIGH)
					end
	
					if(wb_trans_h.reg_addr==`DIVIDER_ADDR) begin
						packet[63:32]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h packet1=%h ",$time,wb_trans_h.reg_addr,packet[63:32]),UVM_HIGH)
					end
	
					if(wb_trans_h.reg_addr==`TX0_ADDR) begin
						wb_trans_h.mon_data[31:0]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data0=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[31:0]),UVM_HIGH)
					end
	
					else if(wb_trans_h.reg_addr==`TX1_ADDR) begin
						wb_trans_h.mon_data[63:32]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data1=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[63:32]),UVM_HIGH)
					end
	
					else if(wb_trans_h.reg_addr==`TX2_ADDR) begin
						wb_trans_h.mon_data[95:64]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data2=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[95:64]),UVM_HIGH)
					end
	
					else if (wb_trans_h.reg_addr==`TX3_ADDR) begin
						wb_trans_h.mon_data[127:96]=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h wb_trans_h.mon_data3=%h ",$time,wb_trans_h.reg_addr,wb_trans_h.mon_data[127:96]),UVM_HIGH)
					end
		
					if(wb_trans_h.reg_addr==`CTRL_STATUS_ADDR) begin
						cntrl_status_reg=wb_trans_h.reg_wr_data;
				//	`uvm_info(get_type_name(),$sformatf("*****[%0t] wb_trans_h.reg_addr=%h cntrl_status_reg=%h ",$time,wb_trans_h.reg_addr,cntrl_status_reg[31:0]),UVM_HIGH)
					end

				end
  		 		else begin
					@(posedge wb_vif.clk);
					wb_trans_h.reg_addr= wb_vif.wb_adr_i;
							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  wb_trans_h.reg_addr=%h ",$time,wb_trans_h.reg_addr),UVM_HIGH)

					@(posedge wb_vif.clk);
					if(wb_trans_h.reg_addr==`RX0_ADDR) begin
						data0 = wb_vif.wb_dat_o;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] data0=%h wb_vif.wb_dat_o=%h ",$time,data0,wb_vif.wb_dat_o),UVM_HIGH)
						if(cntrl_status_reg[7:0] > 0 && cntrl_status_reg[7:0] <=32) begin
							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
							wb_trans_h.mon_rx_data[31:0] = data0;
							wb_analysis_port.write(wb_trans_h);
						end
				//			if(cntrl_status_reg[7:0] > 8 && cntrl_status_reg[7:0] <=16) begin
				//	//		`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
				//			wb_trans_h.mon_rx_data[15:0] = data0;
				//			wb_analysis_port.write(wb_trans_h);
				//		end
				//			if(cntrl_status_reg[7:0] > 16 && cntrl_status_reg[7:0] <=32) begin
				//	//		`uvm_info(get_type_name(),$sformatf("*****[%0t] RX0_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
				//			wb_trans_h.mon_rx_data[31:0] = data0;
				//			wb_analysis_port.write(wb_trans_h);
				//		end

					end
			
					if(wb_trans_h.reg_addr==`RX1_ADDR) begin
						data1  = wb_vif.wb_dat_o;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] data1=%h wb_vif.wb_dat_o=%h ",$time,data1,wb_vif.wb_dat_o),UVM_HIGH)
						if(cntrl_status_reg[7:0] > 32 && cntrl_status_reg[7:0] <=64) begin
					//		`uvm_info(get_type_name(),$sformatf("*****[%0t] RX1_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
							wb_trans_h.mon_rx_data[63:0]={data1,data0};
							wb_analysis_port.write(wb_trans_h);
						end
					end

					if(wb_trans_h.reg_addr==`RX2_ADDR) begin 
						data2  = wb_vif.wb_dat_o;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] data2=%h wb_vif.wb_dat_o=%h ",$time,data2,wb_vif.wb_dat_o),UVM_HIGH)
						if(cntrl_status_reg[7:0] >64 && cntrl_status_reg[7:0] <=96) begin
					//		`uvm_info(get_type_name(),$sformatf("*****[%0t] RX2_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
							wb_trans_h.mon_rx_data[95:0]={data2,data1,data0};
							wb_analysis_port.write(wb_trans_h);
						end
					end

					if(wb_trans_h.reg_addr==`RX3_ADDR) begin
							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  wb_trans_h.reg_addr=%h ",$time,wb_trans_h.reg_addr),UVM_HIGH)
						data3  = wb_vif.wb_dat_o;
						`uvm_info(get_type_name(),$sformatf("*****[%0t] data3=%h wb_vif.wb_dat_o=%h ",$time,data3,wb_vif.wb_dat_o),UVM_HIGH)
						if(((cntrl_status_reg[7:0] >96) && (cntrl_status_reg[7:0] <=127)) || (cntrl_status_reg[7:0] ==0)) begin
							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  cntrl_status_reg=%h ",$time,cntrl_status_reg[7:0]),UVM_HIGH)
							wb_trans_h.mon_rx_data[127:0]={data3,data2,data1,data0};
							`uvm_info(get_type_name(),$sformatf("*****[%0t] RX3_ADDR  wb_trans_h.mon_rx_data=%h ",$time,wb_trans_h.mon_rx_data[127:0]),UVM_HIGH)
					      		wb_analysis_port.write(wb_trans_h);
						end

					end
					
				end
//	`uvm_info(get_type_name(),$sformatf("[%0t]=============================================WB_MONITOR_from_dut ======================================= \n %s",$time,wb_trans_h.sprint()),UVM_MEDIUM)
		end
	end
	
	`uvm_info("WB_MONITOR","WB_MONITOR_BEFORE_DROP_OBJECTION ", UVM_HIGH)
	phase.drop_objection(this);
  	`uvm_info("WB_MONITOR","WB_MONITOR_AFTER_DROP_OBJECTION ", UVM_HIGH)
endtask : run_phase
endclass 

			
