class virtual_sequence extends uvm_sequence#(uvm_sequence_item);

  `uvm_object_utils(virtual_sequence)

  spi_virtual_sqr 	 spi_v_sqr_h; 
  spi_environment        spi_environment_h;

  wb_seqr 	         wb_agent_sqr_h;
  spi_slave_sqr	         spi_slave_agent_sqr_h;
  reset_agent_sqr        reset_agent_sqr_h;

  reset_seq     rst_sq;

  /***************** constructor************************/
  function new(string name="virtual_sequence");
    super.new(name);
  endfunction 

  virtual task pre_body();
    super.pre_body();
    if ( (starting_phase != null) && (get_parent_sequence() == null) )
      starting_phase.raise_objection( this );
/*
    wb_agent_sqr_h        = spi_v_sqr_h.wb_agent_sqr_h         ;
    reset_agent_sqr_h     = spi_v_sqr_h.reset_agent_sqr_h      ;  
    spi_slave_agent_sqr_h = spi_v_sqr_h.spi_slave_agent_sqr_h  ;
  */
    rst_sq=reset_seq::type_id::create("rst_sq");
    if (!$cast(spi_environment_h, uvm_top.find("uvm_test_top.spi_environment_h")))
      `uvm_error(get_name(), "spi_environment_h is not found");

    rst_sq.start(spi_environment_h.spi_v_seqr_h.reset_agent_sqr_h);
  endtask:pre_body

  /*********************** task body**********************/
  virtual task body();
   ///assert($cast(spi_v_sqr_h,m_sequencer))
    //else
      //`uvm_fatal("virt sequence","casting failed")
  endtask

  virtual task post_body();
    super.post_body();
    if ( (starting_phase != null) && (get_parent_sequence() == null) )
      starting_phase.drop_objection( this );
  endtask : post_body

endclass:virtual_sequence

/************************RESET SEQUENCE*************************************/
/********************************************************************/
class virt_reset_seq extends virtual_sequence;

 `uvm_object_utils(virt_reset_seq)
  
  spi_virtual_sqr   spi_v_sqr_h;

  reset_seq     rst_sq;

  function new(string name="virt_reset_seq");
    super.new(name);
  endfunction	

  task body();
    super.body();
    rst_sq=reset_seq::type_id::create("rst_sq");
    rst_sq.start(spi_environment_h.spi_v_seqr_h.reset_agent_sqr_h);
  endtask 
endclass:virt_reset_seq

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
  lsb_8bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/**********************LSB 16 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_lsb_16bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_lsb_16bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 lsb_16bit_data_seq  lsb_16bit_data_seq_h; 
  
  extern function new(string name="virt_lsb_16bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_lsb_16bit_data_seq::new(string name="virt_lsb_16bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_lsb_16bit_data_seq:: body();
  super.body();
  lsb_16bit_data_seq_h=lsb_16bit_data_seq::type_id::create("lsb_16bit_data_seq_h");
  lsb_16bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/**********************LSB 32 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_lsb_32bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_lsb_32bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 lsb_32bit_data_seq  lsb_32bit_data_seq_h; 
  
  extern function new(string name="virt_lsb_32bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_lsb_32bit_data_seq::new(string name="virt_lsb_32bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_lsb_32bit_data_seq:: body();
  super.body();
  lsb_32bit_data_seq_h=lsb_32bit_data_seq::type_id::create("lsb_32bit_data_seq_h");
  lsb_32bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/**********************LSB 64 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_lsb_64bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_lsb_64bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 lsb_64bit_data_seq  lsb_64bit_data_seq_h; 
  
  extern function new(string name="virt_lsb_64bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_lsb_64bit_data_seq::new(string name="virt_lsb_64bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_lsb_64bit_data_seq:: body();
  super.body();
  lsb_64bit_data_seq_h=lsb_64bit_data_seq::type_id::create("lsb_64bit_data_seq_h");
  lsb_64bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/**********************LSB 128 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_lsb_128bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_lsb_128bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 lsb_128bit_data_seq  lsb_128bit_data_seq_h; 
  
  extern function new(string name="virt_lsb_128bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_lsb_128bit_data_seq::new(string name="virt_lsb_128bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_lsb_128bit_data_seq:: body();
  super.body();
  lsb_128bit_data_seq_h=lsb_128bit_data_seq::type_id::create("lsb_128bit_data_seq_h");
  lsb_128bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 


/*********************MSB 8 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_msb_8bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_msb_8bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 msb_8bit_data_seq  msb_8bit_data_seq_h; 
  
  extern function new(string name="virt_msb_8bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_msb_8bit_data_seq::new(string name="virt_msb_8bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_msb_8bit_data_seq:: body();
  super.body();
  msb_8bit_data_seq_h=msb_8bit_data_seq::type_id::create("msb_8bit_data_seq_h");
  msb_8bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/*********************MSB 16 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_msb_16bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_msb_16bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 msb_16bit_data_seq  msb_16bit_data_seq_h; 
  
  extern function new(string name="virt_msb_16bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_msb_16bit_data_seq::new(string name="virt_msb_16bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_msb_16bit_data_seq:: body();
  super.body();
  msb_16bit_data_seq_h=msb_16bit_data_seq::type_id::create("msb_16bit_data_seq_h");
  msb_16bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/*********************MSB 32 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_msb_32bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_msb_32bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 msb_32bit_data_seq  msb_32bit_data_seq_h; 
  
  extern function new(string name="virt_msb_32bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_msb_32bit_data_seq::new(string name="virt_msb_32bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_msb_32bit_data_seq:: body();
  super.body();
  msb_32bit_data_seq_h=msb_32bit_data_seq::type_id::create("msb_32bit_data_seq_h");
  msb_32bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/*********************MSB 64 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_msb_64bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_msb_64bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 msb_64bit_data_seq  msb_64bit_data_seq_h; 
  
  extern function new(string name="virt_msb_64bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_msb_64bit_data_seq::new(string name="virt_msb_64bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_msb_64bit_data_seq:: body();
  super.body();
  msb_64bit_data_seq_h=msb_64bit_data_seq::type_id::create("msb_64bit_data_seq_h");
  msb_64bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/*********************MSB 128 BIT DATA SEQUENCE************************/
/********************************************************************/
class virt_msb_128bit_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_msb_128bit_data_seq)
  
  spi_virtual_sqr v_sqr_h;
 
 msb_128bit_data_seq  msb_128bit_data_seq_h; 
  
  extern function new(string name="virt_msb_128bit_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_msb_128bit_data_seq::new(string name="virt_msb_128bit_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_msb_128bit_data_seq:: body();
  super.body();
  msb_128bit_data_seq_h=msb_128bit_data_seq::type_id::create("msb_128bit_data_seq_h");
  msb_128bit_data_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 

/*********************Rx RAISING TX FALLING SEQUENCE************************/
/********************************************************************/
class virt_Rx_raising_Tx_falling_seq extends virtual_sequence; 
  `uvm_object_utils(virt_Rx_raising_Tx_falling_seq)
  
  spi_virtual_sqr v_sqr_h;

  Rx_raising_Tx_falling_seq    Rx_raising_Tx_falling_seq_h;
  
  extern function new(string name="virt_Rx_raising_Tx_falling_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_Rx_raising_Tx_falling_seq::new(string name="virt_Rx_raising_Tx_falling_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_Rx_raising_Tx_falling_seq:: body();
  super.body();
  Rx_raising_Tx_falling_seq_h=Rx_raising_Tx_falling_seq::type_id::create("Rx_raising_Tx_falling_seq_h");
  Rx_raising_Tx_falling_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
 endtask 
/*********************Rx FALLING TX RAISING SEQUENCE************************/
/********************************************************************/
class virt_Rx_falling_Tx_raising_seq extends virtual_sequence; 
  `uvm_object_utils(virt_Rx_falling_Tx_raising_seq)
  
  spi_virtual_sqr v_sqr_h;

  Rx_falling_Tx_raising_seq    Rx_falling_Tx_raising_seq_h;
  
  extern function new(string name="virt_Rx_falling_Tx_raising_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_Rx_falling_Tx_raising_seq::new(string name="virt_Rx_falling_Tx_raising_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_Rx_falling_Tx_raising_seq:: body();
  super.body();
  Rx_falling_Tx_raising_seq_h=Rx_falling_Tx_raising_seq::type_id::create("Rx_falling_Tx_raising_seq_h");
  Rx_falling_Tx_raising_seq_h.start(spi_environment_h.spi_v_seqr_h.wb_agent_sqr_h);
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
  miso_data_seq_h.start(spi_environment_h.spi_v_seqr_h.spi_slave_agent_sqr_h);
 endtask 

