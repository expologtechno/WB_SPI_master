
interface wb_spi_intf(input logic clk);

	//RESET
	logic                    rst;
	// Wishbone signals
	//logic         		 wb_clk_i;         // master clock input
	//logic         		 wb_rst_i;         // synchronous active high reset
  	logic [4:0]        		 wb_adr_i;         // lower address bits
  	logic[31:0]   		 wb_dat_i;         // databus input
  	logic[31:0]   		 wb_dat_o;         // databus output
  	logic[3:0]    		 wb_sel_i;         // byte select inputs
  	logic         		 wb_we_i;          // write enable input
  	logic         		 wb_stb_i;         // stobe/core select signal
  	logic         		 wb_cyc_i;         // valid bus cycle input
  	logic         		 wb_ack_o;         // bus cycle acknowledge output
  	logic         		 wb_err_o;         // termination w/ error
  	logic          	         wb_int_o;         // interrupt request signal output
                                                     
  // SPI signals                                     
  	logic[`SPI_SS_NB-1:0]   ss_pad_o;         // slave select
  	logic	                sclk_pad_o;       // serial clock
 	logic	                mosi_pad_o;       // master out slave in
 	logic	                miso_pad_i;       // master in slave out
                                                     
//=====================================================================
//wishbone driver clocking block
//=====================================================================
clocking wb_cb@(posedge clk);
    	default input #1 output #1;
        
         output                 clk;         // master clock input
  	 output                 rst;         // synchronous active high reset
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
//spl_slave driver clocking block
//=====================================================================
clocking spi_cb@(posedge clk);
    	default input #1 output #1;

	input                 ss_pad_o;         // slave select
	input                 sclk_pad_o;       // serial clock
	input 	              mosi_pad_o;       // master out slave in
  	output                miso_pad_i;       // master in slave out

endclocking

  

//=====================================================================
//wishbone Monitor clocking block
//=====================================================================
clocking wb_mon@(posedge clk);
    default input #1 output #1;
	
         input                  clk;         // master clock input
  	 input                  rst;         // synchronous active high reset
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
//spi_slave Monitor clocking block
//=====================================================================
clocking spi_mon@(posedge clk);
	default input #1 output #0;
	
	input                 ss_pad_o;         // slave select
	input                 sclk_pad_o;       // serial clock
	input 	              mosi_pad_o;       // master out slave in
  	input                 miso_pad_i;       // master in slave out
endclocking 


//=====================================================================
//Modport's
//=====================================================================
 modport wb_drv_mp(clocking wb_cb);
 modport spi_drv_mp(clocking spi_cb);

 modport wb_mon_mp(clocking wb_mon);
 modport spi_mon_mp(clocking spi_mon);
 
endinterface:wb_spi_intf
