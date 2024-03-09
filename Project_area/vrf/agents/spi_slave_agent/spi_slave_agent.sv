class spi_slave_agent extends uvm_agent;
  `uvm_component_utils(spi_slave_agent)
  spi_slave_mon      spi_slave_mon_h; 

  //virtual interface
  virtual spi_intf     spi_vif;

  spi_slave_driver      spi_slave_drv_h; 
  spi_slave_sqr         spi_slave_sqr_h; 
  
  function new(string name="spi_slave_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     spi_slave_mon_h = spi_slave_mon::type_id::create("spi_slave_mon_h", this);

     spi_slave_drv_h = spi_slave_driver::type_id::create("spi_slave_drv_h", this);
     spi_slave_sqr_h = spi_slave_sqr::type_id::create("spi_slave_sqr_h", this);
     
    if (!uvm_config_db#(virtual spi_intf)::get(this," ","spi_vif",spi_vif))
      `uvm_fatal("SPI_SLAVE_AGENT", "***** Could not get spi_vif *****")

    uvm_config_db#(virtual spi_intf)::set(this,"*","spi_vif",spi_vif);

  endfunction:build_phase

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    spi_slave_drv_h.seq_item_port.connect(spi_slave_sqr_h.seq_item_export);

  endfunction:connect_phase

endclass:spi_slave_agent
