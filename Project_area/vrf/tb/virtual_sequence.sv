class virtual_sequence extends uvm_sequence#(uvm_sequence_item);

  `uvm_object_utils(virtual_sequence)

  spi_virtual_sqr 	 spi_v_sqr_h; 

  wb_seqr 	         wb_agent_sqr_h;
  spi_slave_sqr	         spi_slave_agent_sqr_h;
  reset_agent_sqr        reset_agent_sqr_h;


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
    reset_agent_sqr_h = spi_v_sqr_h.reset_agent_sqr_h;    
    spi_slave_agent_sqr_h = spi_v_sqr_h.spi_slave_agent_sqr_h;    
    wb_agent_sqr_h = spi_v_sqr_h.wb_agent_sqr_h;    
endtask

endclass:virtual_sequence

/************************RESET SEQUENCE*************************************/
/********************************************************************/
class virt_reset_seq extends virtual_sequence;
 `uvm_object_utils(virt_reset_seq)
  
  spi_virtual_sqr   spi_v_sqr_h;
  reset_seq     reset_seq_h;

 extern function new(string name="virt_reset_seq");
  extern task body();
endclass
/************** constructor*******************/
function virt_reset_seq::new(string name="virt_reset_seq");
  super.new(name);
endfunction	
/****************** body**************************/
task virt_reset_seq:: body();
  super.body();
  reset_seq_h=reset_seq::type_id::create("reset_seq_h");
  reset_seq_h.start(reset_agent_sqr_h);
 endtask 

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
/**********************SS DATA SEQUENCE************************/
/********************************************************************/
class virt_ss_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_ss_data_seq)
  
  spi_virtual_sqr v_sqr_h;

  ss_data_seq  ss_data_seq_h; 
  
  extern function new(string name="virt_ss_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_ss_data_seq::new(string name="virt_ss_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_ss_data_seq:: body();
  super.body();
  ss_data_seq_h=ss_data_seq::type_id::create("ss_data_seq_h");
  ss_data_seq_h.start(wb_agent_sqr_h);
 endtask 
/**********************IE DATA SEQUENCE************************/
/********************************************************************/
class virt_ie_data_seq extends virtual_sequence; 
  `uvm_object_utils(virt_ie_data_seq)
  
  spi_virtual_sqr v_sqr_h;

  ie_data_seq  ie_data_seq_h; 
  
  extern function new(string name="virt_ie_data_seq");
  extern task body();

endclass

/************** constructor*******************/
function virt_ie_data_seq::new(string name="virt_ie_data_seq");
  super.new(name);
endfunction	

/****************** body**************************/
task virt_ie_data_seq:: body();
  super.body();
  ie_data_seq_h=ie_data_seq::type_id::create("ie_data_seq_h");
  ie_data_seq_h.start(wb_agent_sqr_h);
 endtask 
 
