
interface wb_intf(input logic clk,rstn,clk_within_tolerance,clk_outof_tolerance);

	//RESET
//	logic                    rstn;
	// Wishbone signals
	//logic         		 wb_clk_i;         // master clock input
	//logic         		 wb_rst_i;         // synchronous active high reset
  	logic [4:0]        	 wb_adr_i;         // lower address bits
  	logic[31:0]   		 wb_dat_i;         // databus input
  	logic[31:0]   		 wb_dat_o;         // databus output
  	logic[3:0]    		 wb_sel_i;         // byte select inputs
  	logic         		 wb_we_i;          // write enable input
  	logic         		 wb_stb_i;         // stobe/core select signal
  	logic         		 wb_cyc_i;         // valid bus cycle input
  	logic         		 wb_ack_o;         // bus cycle acknowledge output
  	logic         		 wb_err_o;         // termination w/ error
  	logic          	         wb_int_o;         // interrupt request signal output
                                                     
//=====================================================================
//wishbone driver clocking block
//=====================================================================
clocking wb_cb@(posedge clk,rstn,clk_within_tolerance,clk_outof_tolerance);
    	default input #1 output #1;
        
         output                 clk;         // master clock input
  	 output                 rstn;         // synchronous active high reset
         //output                 wb_clk_i;         // master clock input
  	 //output                 wb_rst_i;         // synchronous active high reset
 	 output  		wb_adr_i;         // lower address bits
 	 output          	wb_dat_i;         // databus input
 	 input          	wb_dat_o;         // databus output
 	 output  		wb_sel_i;         // byte select inputs
 	 output                 wb_we_i;          // write enable input
 	 output                 wb_stb_i;         // stobe/core select signal
 	 output                 wb_cyc_i;         // valid bus cycle input
 	 input                  wb_ack_o;         // bus cycle acknowledge output
 	 input                  wb_err_o;         // termination w/ error
 	 input                  wb_int_o;         // interrupt request signal output

endclocking

//=====================================================================
//wishbone Monitor clocking block
//=====================================================================
clocking wb_mon@(posedge clk,rstn);
    default input #0 output #1;
	
       //  input                  clk;         // master clock input
  	// input                  rstn;         // synchronous active high reset
         //input                  wb_clk_i;         // master clock input
  	 //input                  wb_rst_i;         // synchronous active high reset
 	 input	        	wb_adr_i;         // lower address bits
 	 input   	        wb_dat_i;         // databus input
 	 input    	        wb_dat_o;         // databus output
 	 input		        wb_sel_i;         // byte select inputs
 	 input                  wb_we_i;          // write enable input
 	 input                  wb_stb_i;         // stobe/core select signal
 	 input                  wb_cyc_i;         // valid bus cycle input
 	 input                  wb_ack_o;         // bus cycle acknowledge output
 	 input                  wb_err_o;         // termination w/ error
 	 input                  wb_int_o;         // interrupt request signal output
endclocking

//=====================================================================
//Modport's
//=====================================================================
 modport wb_drv_mp(clocking wb_cb);
 
 modport wb_mon_mp(clocking wb_mon);

//=====================================================================
//Assertions
//=====================================================================
//Clock frequency check assertion

time clk_period =10ns;
   property clk_frq_check(int clk_period);
    realtime current_time;
     (('1,current_time=$realtime) |=>(clk_period==$realtime-current_time));
    endproperty

ASSERT_PERIOD:assert property (@(posedge clk)clk_frq_check(clk_period))
else
`uvm_error("TB_CLOCK_CHECK_ASSERTION", "TB clk frquency mismatch ")

//******within tolerance Clock frequency check assertion**********

time clk_period_within=10ns; 
property freq_chk_within_tol ( real tolerance=10.00);
  time current_time; 
  ('1, current_time = $time) |=> 
   ( (($time - current_time) >= ( (clk_period_within * (1 - (tolerance/100.00) )) - 1)) && 
     (($time - current_time) <= ( (clk_period_within * (1 + (tolerance/100.00) )) + 1)) );
endproperty : freq_chk_within_tol
ASSERT_WITHIN_TOLERANCE_PERIOD:assert property (@(posedge clk_within_tolerance)freq_chk_within_tol(clk_period_within))
else
`uvm_error("WITHIN_TOLERANCE_CLOCK_CHECK_ASSERTION", "WITHIN_TOLERANCE_CLOCK_FREQUENCE_MISMATCH")

//******outoff tolerance Clock frequency check assertion**********

time clk_period_outof=10ns; 
property freq_chk_outof_tol ( real tolerance=10.00);
  time current_time; 
  ('1, current_time = $time) |=> 
   ( (($time - current_time) >= ( (clk_period_outof * (1 - (tolerance/100.00) )) - 1)) && 
     (($time - current_time) <= ( (clk_period_outof * (1 + (tolerance/100.00) )) + 1)) );
endproperty : freq_chk_outof_tol
ASSERT_OUTOF_TOLERANCE_PERIOD:assert property (@(posedge clk_outof_tolerance)freq_chk_outof_tol(clk_period_outof))
else
`uvm_error("OUTOF_TOLERANCE_CLOCK_CHECK_ASSERTION", "OUTOF_TOLERANCE_CLOCK_FREQUENCE_MISMATCH")


//   property sclk_frq_check;
     
//	@(posedge clk) 
//  endproperty

//ASSER_PERIOD:assert property (@(posedge clk) sclk_frq_check)

endinterface:wb_intf
