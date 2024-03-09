class reset_agent extends uvm_agent;

  `uvm_component_utils(reset_agent)

  //reset_monitor      reset_mon_h; 

  //virtual interface
  virtual wb_intf     wb_vif;
  virtual spi_intf    spi_vif;

  reset_driver            reset_drv_h; 
  reset_agent_sqr         reset_agent_sqr_h; 

  function new(string name="reset_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //reset_mon_h = reset_monitor::type_id::create("reset_mon_h", this);
    reset_drv_h = reset_driver::type_id::create("reset_drv_h", this);
    reset_agent_sqr_h = reset_agent_sqr::type_id::create("reset_agent_sqr_h", this);

    if (!uvm_config_db#(virtual wb_intf)::get(this," ","wb_vif",wb_vif))
      `uvm_fatal("RESET_AGENT", "***** Could not get wb_vif *****")

if (!uvm_config_db#(virtual spi_intf)::get(this," ","spi_vif",spi_vif))
      `uvm_fatal("RESET_AGENT", "***** Could not get spi_vif *****")

    uvm_config_db#(virtual wb_intf)::set(this,"*","wb_vif",wb_vif);
    uvm_config_db#(virtual spi_intf)::set(this,"*","spi_vif",spi_vif);
  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    reset_drv_h.seq_item_port.connect(reset_agent_sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:reset_agent
