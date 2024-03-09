class reset_trans extends uvm_sequence_item;

  rand bit  state;
  rand int  cycles;

  `uvm_object_utils_begin(reset_trans)
    `uvm_field_int(state, UVM_ALL_ON)
    `uvm_field_int(cycles, UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="reset_trans");
    super.new(name);
  endfunction
  
endclass
