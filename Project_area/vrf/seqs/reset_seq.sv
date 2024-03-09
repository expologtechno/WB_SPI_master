class reset_seq extends uvm_sequence#(reset_trans);
	
  `uvm_object_utils(reset_seq)
  
  reset_trans   reset_tx;

/******************** constructor*********************/
  function new(string name="reset_seq");
    super.new(name);	
  endfunction

  virtual task pre_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.raise_objection(this);
    end
  endtask:pre_body

/********************* body task*******************/

  virtual task body();
    //super.body();
    //req=reset_trans::type_id::create("req");
    `uvm_do_with(req,{state == 1; cycles == 1;})
    `uvm_do_with(req,{state == 0; cycles == 1;})
  endtask

  virtual task post_body();
    `ifdef UVM_POST_VERSION_1_1
      var uvm_phase starting_phase = get_starting_phase();
    `endif
  
    if (starting_phase != null)  begin
      starting_phase.drop_objection(this);
    end
  endtask:post_body

endclass
