class wb_agent_cov extends uvm_subcriber#(wb_trans);
  `uvm_component_utils(wb_agent_cov)

uvm_analysis_imp#(wb_trans, wb_agent_cov)  wb_agent_port;

wb_trans wb_trans_h;

covergroup req_cg();

REG_ADDR:coverpoint wb_trans_h.reg_addr
		{
                           bins b1={[0:31]};
		}

REG_WR_DATA:coverpoint wb_trans_h.reg_wr_data
		{
			bins range[]={{0:$]};
		}

WB_WE_I:coverpoint wb_trans_h.wb_we_i
		{
			bins b1={{0:1]};
		}


 endgroup:req_cg

function new(string name="wb_agent_cov", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    wb_agent_port = new("wb_agent_port", this);
    wb_trans_h = wb_trans::type_id::create("wb_trans_h", this);
  endfunction:build_phase

  function void write(req_tx   t);

    `uvm_info("wb_agent_cov", "From Coverage Write function", UVM_LOW)

  endfunction:write

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);

    `uvm_info("wb_agent_cov","From Coverage Run Phase", UVM_LOW)

  endtask:run_phase

endclass:wb_agent_cov
