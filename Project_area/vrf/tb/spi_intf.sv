
interface spi_intf(input logic spi_clk);
	//RESET
//	logic                    spi_rst;

  // SPI signals                                     
  	logic[`SPI_SS_NB-1:0]   ss_pad_o;         // slave select
  //	logic	                sclk_pad_o;       // serial clock
 	logic	                mosi_pad_o;       // master out slave in
 	logic	                miso_pad_i;       // master in slave out
                                                     
///=====================================================================
//spl_slave driver clocking block
//=====================================================================
clocking spi_cb@(posedge spi_clk);
    	default input #1 output #0;

	input                 ss_pad_o;         // slave select
//	input                 sclk_pad_o;       // serial clock
	input 	              mosi_pad_o;       // master out slave in
  	output                miso_pad_i;       // master in slave out

endclocking
//=====================================================================
//spi_slave Monitor clocking block
//=====================================================================
clocking spi_mon@(posedge spi_clk);
	default input #1 output #0;
	
	input                 ss_pad_o;         // slave select
//	input                 sclk_pad_o;       // serial clock
	input 	              mosi_pad_o;       // master out slave in
  	input                 miso_pad_i;       // master in slave out
endclocking 
//=====================================================================
//Modport's
//=====================================================================
 modport spi_drv_mp(clocking spi_cb);

 modport spi_mon_mp(clocking spi_mon);
 
endinterface:spi_intf
