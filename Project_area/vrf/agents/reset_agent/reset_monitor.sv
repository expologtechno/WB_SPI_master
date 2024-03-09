class reset_monitor extends uvm_monitor;

  `uvm_component_utils(reset_monitor)

  reset_trans   reset_trans_h;

  uvm_analysis_port #(reset_trans) reset_monitor_port;

  function new(string name="reset_monitor", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    reset_monitor_port = new("reset_monitor_port", this);
    reset_trans_h = reset_trans::type_id::create("reset_trans_h", this);

  endfunction:build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("reset_monitor","Monitor Run Phase", UVM_LOW)

  endtask:run_phase

endclass:reset_monitor
