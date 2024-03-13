class virtual_sequence extends uvm_sequence#(uvm_sequence_item);

  `uvm_object_utils(virtual_sequence)

  spi_virtual_sqr 	 spi_v_sqr_h; 

  wb_seqr 	         wb_agent_sqr_h;
  spi_slave_sqr	         spi_slave_agent_sqr_h;


  /***************** constructor************************/
  function new(string name="virtual_sequence");
    super.new(name);
  endfunction 

virtual task body();

  //  spi_environment_h = spi_environment::type_id::create("spi_environment_h", this);
assert($cast(spi_v_sqr_h,m_sequencer))
    else begin
      `uvm_fatal("virt sequence","casting failed")
    end  
    spi_slave_agent_sqr_h = spi_v_sqr_h.spi_slave_agent_sqr_h;    
    wb_agent_sqr_h = spi_v_sqr_h.wb_agent_sqr_h;    
endtask

endclass:virtual_sequence

/************************RESET SEQUENCE*************************************/
/********************************************************************/
//class virt_reset_seq extends virtual_sequence;
//
// `uvm_object_utils(virt_reset_seq)
//  
//  spi_virtual_sqr   spi_v_sqr_h;
//
//  reset_seq     rst_sq;
//
//  function new(string name="virt_reset_seq");
//    super.new(name);
//  endfunction	
//
//  task body();
//    super.body();
//    rst_sq=reset_seq::type_id::create("rst_sq");
//    rst_sq.start(spi_environment_h.spi_v_seqr_h.reset_agent_sqr_h);
//  endtask 
//endclass:virt_reset_seq

/**********************SANITY SEQUENCE************************/
/********************************************************************/
class virt_sanity_seq extends virtual_sequence; 
  `uvm_object_utils(virt_sanity_seq)
  
  spi_virtual_sqr v_sqr_h;

  sanity_seq  sanity_seq_h; 
  
  extern function new(string name="virt_sanity_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_sanity_seq::new(string name="virt_sanity_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_sanity_seq:: body();
  super.body();
  sanity_seq_h=sanity_seq::type_id::create("sanity_seq_h");
  sanity_seq_h.start(wb_agent_sqr_h);
 endtask 

/**********************LSB 8 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_lsb_8bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_lsb_8bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;

  lsb_8bit_data_seq  lsb_8bit_data_seq_h; 
  
  extern function new(string name="virt_lsb_8bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_lsb_8bit_data_seq::new(string name="virt_lsb_8bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_lsb_8bit_data_seq:: body();
  super.body();
  lsb_8bit_data_seq_h=lsb_8bit_data_seq::type_id::create("lsb_8bit_data_seq_h");
  lsb_8bit_data_seq_h.start(wb_agent_sqr_h);
 endtask 

/**********************MISO DATA SEQUENCE************************/
/********************************************************************/
class virt_miso_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_miso_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 miso_data_seq  miso_data_seq_h; 
  
  extern function new(string name="virt_miso_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_miso_data_seq::new(string name="virt_miso_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_miso_data_seq:: body();
  super.body();
  miso_data_seq_h=miso_data_seq::type_id::create("miso_data_seq_h");
  miso_data_seq_h.start(spi_slave_agent_sqr_h);
 endtask 
