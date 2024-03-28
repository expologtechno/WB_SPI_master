class arbitration_test extends spi_base_test;
  `uvm_component_utils(arbitration_test)
    
  function new(string name = "arbitration_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  task cfg_arb_mode;
    spi_environment_h.spi_v_seqr_h.set_arbitration(SEQ_ARB_RANDOM);
  endtask
endclass
