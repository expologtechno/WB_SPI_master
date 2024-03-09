class reset_agent_sqr extends uvm_sequencer#(reset_trans);

  `uvm_component_utils(reset_agent_sqr)

  function new(string name="reset_agent_sqr", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

endclass:reset_agent_sqr
