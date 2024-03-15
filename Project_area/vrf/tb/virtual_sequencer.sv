class spi_virtual_sqr extends uvm_sequencer;
  
  `uvm_component_utils(spi_virtual_sqr)

  wb_seqr 	      wb_agent_sqr_h;
  spi_slave_sqr	      spi_slave_agent_sqr_h;
  reset_agent_sqr     reset_agent_sqr_h;
  
  function new(string name="spi_virtual_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wb_agent_sqr_h        = wb_seqr::type_id::create("wb_agent_sqr_h", this);
    spi_slave_agent_sqr_h = spi_slave_sqr::type_id::create("spi_slave_agent_sqr_h", this);
    reset_agent_sqr_h     = reset_agent_sqr::type_id::create("reset_agent_sqr_h", this);
  endfunction:build_phase

endclass:spi_virtual_sqr
