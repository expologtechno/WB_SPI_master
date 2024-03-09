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
/****************** SEQUENCE ARBITRATION**********************************/ 
//virtual function void show_arb_cfg();
//UVM_SEQ_ARB_TYPE cur_arb;

//cur_arb=spi_environment_h.spi_virtual_sqr_h.get_arbitration();
//`uvm_info("SPI_BASE_TEST",$sformatf("Seqr set to %s",cur_arb.name()), UVM_MEDIUM)
//endfunction

/**************************run_phase**************************************/
  task run_phase (uvm_phase phase);
        `uvm_info(get_name(), "run_phase", UVM_HIGH)

   	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_BEFORE_RAISE_OBJECTION ", UVM_MEDIUM)
         phase.raise_objection(this);
  	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_AFTER_RAISE_OBJECTION ", UVM_MEDIUM)

      	 virtual_sequence_h.start(spi_environment_h.spi_v_seqr_h);
	// phase.phase_done.set_drain_time(this, 500ns);

	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_BEFORE_DROP_OBJECTION ", UVM_MEDIUM)
	 phase.drop_objection(this);
  	`uvm_info("SPI_BASE_TEST","SPI_BASE_TEST_AFTER_DROP_OBJECTION ", UVM_MEDIUM)

  endtask

/******************************check phase********************************/  
 
 function void check_phase(uvm_phase phase);
   `uvm_info("get_type_name", $sformatf("check_phase of %s", get_name()), UVM_MEDIUM)
 endfunction: check_phase

/****************************************************************************/
  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
    endfunction:end_of_elaboration_phase


   //*********************************Report for checking error************************************************
    
  function void report();
    uvm_report_server reportserver=uvm_report_server::get_server();
    $display("**************************************************");
    $display("****************** TEST Summary ******************");
    $display("**************************************************");
  
    if((reportserver.get_severity_count(UVM_FATAL)==0)&&/*(reportserver.get_severity_count(UVM_WARNING)==0)&&*/(reportserver.get_severity_count(UVM_ERROR)==0))  begin
      $display("**************************************************");
      $display("****************** TEST  PASSED ******************");
      $display("**************************************************");
      $display("");
      $display("");
      $display("******  ******  ****** ******         ****** 	******  ******  ******              ");
      $display("   *	  *       *        *            *    * 	*    *  *       *                   ");
      $display("   *	  *       *        *            *    * 	*    *  *       *                   ");
      $display("   *	  ******  ******   *            ****** 	******  ******  ******              ");
      $display("   *	  *            *   *            *       *    *       *       *              ");
      $display("   *	  *            *   *            *       *    *       *       *              ");
      $display("   *	  ******  ******   *            *       *    *  ******  ******              ");
      $display("");
      $display("");
      $display("============================================================================================================");
      
    end//if_end
  
    else begin
      $display("**************************************************");
      $display("                    \\ / ");
      $display("                    oVo ");
      $display("                \\___XXX___/ ");
      $display("                 __XXXXX__ ");
      $display("                /__XXXXX__\\ ");
      $display("                /   XXX   \\ ");
      $display("                     V ");
      $display("                TEST  FAILED          ");
      $display("**************************************************");
    end//else_end
  endfunction:report

  /****************************extract phase********************************/
  //function void extract_phase(uvm_phase phase);
  //  super.extract_phase(phase);
  //  `uvm_info("get_type_name", $sformatf("extract_phase of %s", get_name()), UVM_MEDIUM)
  //endfunction: extract_phase
  
  
  
endclass:spi_base_test
