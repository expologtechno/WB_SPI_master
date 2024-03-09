class reset_driver extends uvm_driver#(reset_trans);

  `uvm_component_utils(reset_driver)

  reset_trans               reset_trans_h;

  //virtual interface
  virtual wb_intf       wb_vif;
  virtual spi_intf      spi_vif;

  function new(string name="reset_driver", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual wb_intf)::get(this,"*","wb_vif",wb_vif))
      `uvm_fatal("RESET_DRV WB","**** Could not get virtual WB interface ****");
 if (!uvm_config_db#(virtual spi_intf)::get(this,"*","spi_vif",spi_vif))
      `uvm_fatal("RESET_DRV SPI","**** Could not get virtual SPI interface ****");

  endfunction:build_phase

  
 virtual function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
	`uvm_info("TRACE", $sformatf("Hierarchy: %m"), UVM_HIGH );
	if(wb_vif == null)
	begin
	  `uvm_fatal("WB","Interface for reset driver not set");
	end
	if(spi_vif == null) 
	begin
	  `uvm_fatal("SPI","Interface for reset driver not set");
	end
  endfunction : end_of_elaboration_phase

 task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
       // drive_tx(req);
      seq_item_port.item_done();
    end
  endtask:run_phase

// task drive_tx(reset_trans     reset_trans_h);
//
//    if(reset_trans_h.state == 0) begin
//    //  wb_vif.rstn <= 1'b0;
//   //   spi_vif.rstn <= 1'b0;
//      repeat (reset_trans_h.cycles) @(posedge wb_vif.clk);
//  //   repeat (reset_trans_h.cycles) @(posedge spi_vif.clk);
//    end
//    else begin
//    //  wb_vif.rstn <= 1'b1;
//    //  spi_vif.rstn <= '1;
//      reset_input_signals();
//      repeat(reset_trans_h.cycles) @(posedge wb_vif.clk);
//   //   repeat(reset_trans_h.cycles) @(posedge spi_vif.clk);
//    end
//
//    
//  endtask:drive_tx
//
//  task reset_input_signals();
//    wb_vif.wb_adr_i   = 0;
//    wb_vif.wb_dat_i   = 0;
//    wb_vif.wb_dat_o   = 0;
//    wb_vif.wb_sel_i   = 0;
//    wb_vif.wb_we_i    = 0;
//    wb_vif.wb_stb_i   = 0;
//    wb_vif.wb_cyc_i   = 0;
//    wb_vif.wb_ack_o   = 0;
//    wb_vif.wb_err_o   = 0;
//    wb_vif.wb_int_o   = 0;
//    spi_vif.miso_pad_i = 0;
//  endtask

endclass:reset_driver
