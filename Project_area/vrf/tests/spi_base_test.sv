class spi_base_test extends uvm_test;

  spi_environment      spi_environment_h; 
  spi_virtual_sqr      spi_virtual_sqr_h;

  virtual_sequence     virtual_sequence_h;

  `uvm_component_utils(spi_base_test)

  function new(string name="spi_base_test", uvm_component parent=null);
    super.new(name, parent);
  endfunction:new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    spi_environment_h = spi_environment::type_id::create("spi_environment_h", this);
    virtual_sequence_h = virtual_sequence::type_id::create("virtual_sequence_h", this);

  endfunction:build_phase

/**************************run_phase**************************************/
  task run_phase (uvm_phase phase);
        `uvm_info(get_name(), "run_phase", UVM_HIGH)

   	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_BEFORE_RAISE_OBJECTION ", UVM_MEDIUM)
         phase.raise_objection(this);
  	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_AFTER_RAISE_OBJECTION ", UVM_MEDIUM)

      	// virtual_sequence_h.start(spi_environment_h.spi_v_seqr_h);
	// phase.phase_done.set_drain_time(this, 500ns);
	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_BEFORE_DROP_OBJECTION ", UVM_MEDIUM)
	 phase.drop_objection(this);
  	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_AFTER_DROP_OBJECTION ", UVM_MEDIUM)

  endtask

/******************************check phase********************************/  
 
 function void check_phase(uvm_phase phase);
   `uvm_info("get_type_name", $sformatf("check_phase of %s", get_name()), UVM_MEDIUM)
 endfunction: check_phase

endclass:spi_base_test
