class spi_slave_sqr extends uvm_sequencer#(spi_slave_trans);

  `uvm_component_utils(spi_slave_sqr)

  function new(string name="spi_slave_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction

endclass:spi_slave_sqr
