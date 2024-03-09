
class wb_seqr extends uvm_sequencer#(wb_trans);

  `uvm_component_utils(wb_seqr)

  function new(string name="wb_seqr", uvm_component parent=null);
      super.new(name, parent);
  endfunction

endclass
