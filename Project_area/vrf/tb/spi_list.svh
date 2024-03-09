//----List of Include Files--------------------//
 
  `include "spi_define.sv"
  `include "wb_intf.sv"
  `include "spi_intf.sv"

  `include "reset_trans.sv"
  `include "reset_driver.sv"
  `include "reset_sqr.sv"
  `include "reset_monitor.sv"
  `include "reset_agent.sv"
  
  `include "wb_trans.sv"
  `include "wb_driver.sv"
  `include "wb_seqr.sv"
  `include "wb_monitor.sv"
  `include "wb_agent.sv"

  `include "spi_slave_trans.sv"
  `include "spi_slave_driver.sv"
  `include "spi_slave_seqr.sv"
  `include "spi_slave_monitor.sv"
  `include "spi_slave_agent.sv"

  `include "virtual_sequencer.sv"

  // Sequence List
  `include "../seqs/sequence_list.sv"
  `include "spi_scoreboard.sv"
  `include "spi_env.sv"
  `include "virtual_sequence.sv"
  // Test List
  `include "../tests/test_list.sv"
