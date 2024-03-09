class reset_test extends spi_base_test;
	
  `uvm_component_utils(reset_test)

  //virt_reset_seq     v_rst_sq;

  //----------------------constructor------------------------------------------
  function new(string name="reset_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction

  //---------------------build_phase----------------------------------
  function void  build_phase(uvm_phase phase);
    super.build_phase(phase);
    //v_rst_sq=virt_reset_seq::type_id::create("v_rst_sq",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    //v_rst_sq.rst_sq = reset_sq;
  endfunction:connect_phase

endclass
