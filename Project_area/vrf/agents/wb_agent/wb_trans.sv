class wb_trans extends uvm_sequence_item;
  
  rand bit[4:0]   reg_addr;           // lower address bits   // REG address
  rand bit[31:0]  reg_wr_data;        // databus input        //reg_wr_DATA(wr_data)
  logic [31:0]    reg_rd_data;        // databus input        //reg_rd_DATA(wr_data)
  logic [31:0]    temp_data;          // databus input        //reg_rd_DATA(wr_data)
  rand bit        wr_en;              // write enable input
  bit [31:0]      ctrl;                // Control and status register
  bit [127:0]     mon_data;
  bit[127:0]      mon_rx_data;

//Control and status register [CTRL]
typedef struct packed{
 bit [6:0]   ctrl_char_len;         // char len
 bit         ctrl_res_1;            // Reserve bit
 bit         ctrl_go;               // go
 bit         ctrl_rx_negedge;       // miso is sampled on negative edge
 bit         ctrl_tx_negedge;       // mosi is driven on negative edge
 bit         ctrl_lsb;              // lsb first on line
 bit         ctrl_ie;               // interrupt enable
 bit         ctrl_ass;              // automatic slave select
 bit [17:0]  ctrl_res_2;            // Reserve bit
}ctrl_stats_reg;

	ctrl_stats_reg  ctrl_reg;
/*
task body();
	ctrl_stats_reg  ctrl_reg;

	ctrl_reg.ctrl_char_len=32'h05;
	ctrl_reg.ctrl_res_1=1'h0;
	ctrl_reg.ctrl_go=1'h1;
	ctrl_reg.ctrl_rx_negedge=1'h0;
	ctrl_reg.ctrl_tx_negedge=1'h0;
	ctrl_reg.ctrl_lsb=1'h1;       
	ctrl_reg.ctrl_ie=1'h0;        
	ctrl_reg.ctrl_ass=1'h1;       
	ctrl_reg.ctrl_res_2=32'h00_0000;
 
ctrl={ctrl_reg.ctrl_res_2,ctrl_reg.ctrl_ass,ctrl_reg.ctrl_ie,ctrl_reg.ctrl_lsb,ctrl_reg.ctrl_tx_negedge,ctrl_reg.ctrl_rx_negedge,ctrl_reg.ctrl_go,ctrl_reg.ctrl_res_1,ctrl_reg.ctrl_char_len};

endtask
*/

//Utility and Field macros, 
`uvm_object_utils_begin(wb_trans)

	`uvm_field_int(reg_addr,UVM_ALL_ON)
	`uvm_field_int(reg_wr_data,UVM_ALL_ON)
	`uvm_field_int(reg_rd_data,UVM_ALL_ON)
	`uvm_field_int(wr_en ,UVM_ALL_ON)

`uvm_object_utils_end

//constructor
function new(string name="wb_trans");
super.new(name);
endfunction

endclass
