interface wb_intf(input logic wb_clk_i, wb_rst_i);

  logic[4:0]      wb_adr_i;         // lower address bits
  logic[31:0]     wb_dat_i;         // databus input
  logic[31:0]     wb_dat_o;         // databus output
  logic[3:0]      wb_sel_i;         // byte select inputs
  logic           wb_we_i;          // write enable input
  logic           wb_stb_i;         // stobe/core select signal
  logic           wb_cyc_i;         // valid bus cycle input
  logic           wb_ack_o;         // bus cycle acknowledge output
  logic           wb_err_o;         // termination w/ error
  logic           wb_int_o;         // interrupt request signal output


clocking wb_cb @(posedge wb_clk_i);
    default input #1; //sample the signal 1 TU before +edge of clock
   
  input 	 wb_rst_i;
  input          wb_clk_i;         // master clock input
  input          wb_rst_i;         // synchronous active high reset
  input [4:0]    wb_adr_i;         // lower address bits
  input [31:0]   wb_dat_i;         // databus input
  output[31:0]   wb_dat_o;         // databus output
  input [3:0]    wb_sel_i;         // byte select inputs
  input          wb_we_i;          // write enable input
  input          wb_stb_i;         // stobe/core select signal
  input          wb_cyc_i;         // valid bus cycle input
  output         wb_ack_o;         // bus cycle acknowledge output
  output         wb_err_o;         // termination w/ error
  output         wb_int_o;         // interrupt request signal output

  endclocking : wb_cb
  
 
//  modport DUT (clocking wb_cb);

endinterface
