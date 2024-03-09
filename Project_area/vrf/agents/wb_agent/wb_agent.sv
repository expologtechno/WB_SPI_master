//typedef uvm_sequencer #(wb_trans) wb_seqr;

class wb_agent extends uvm_agent;

  // UVM automation macros for general components
  `uvm_component_utils(wb_agent)

  //declaring agent components
  wb_driver    wb_driver_h;
  wb_seqr      wb_seqr_h;
  wb_monitor   wb_monitor_h;

  //virtual interface
  virtual wb_intf     wb_vif;

  // constructor
  function new (string name="wb_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction : new

  // build_phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wb_driver_h  = wb_driver::type_id::create("wb_driver_h", this);
    wb_seqr_h    = wb_seqr::type_id::create("wb_seqr_h", this);
    wb_monitor_h = wb_monitor::type_id::create("wb_monitor_h", this);

    if (!uvm_config_db#(virtual wb_intf)::get(this," ","wb_vif",wb_vif))
      `uvm_fatal("WB_AGENT", "***** Could not get wb_vif *****")

    uvm_config_db#(virtual wb_intf)::set(this,"*","wb_vif",wb_vif);
  endfunction : build_phase

  // connect_phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    wb_driver_h.seq_item_port.connect(wb_seqr_h.seq_item_export);
  endfunction : connect_phase

endclass : wb_agent
