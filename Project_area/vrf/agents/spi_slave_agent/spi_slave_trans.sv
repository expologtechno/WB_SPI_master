class spi_slave_trans extends uvm_sequence_item;

// SPI signals                                     
  rand bit[127:0]               miso_wr_data;       // master in slave out
  rand bit[127:0]               mosi_rd_data;       // master in slave out
     logic[7:0]                 mosi_pad_o;       // master out slave in
       bit[7:0] 		frame_size;
      


  `uvm_object_utils_begin(spi_slave_trans)
    `uvm_field_int(miso_wr_data  , UVM_ALL_ON)
    `uvm_field_int(mosi_rd_data  , UVM_ALL_ON)
         `uvm_object_utils_end

  function new(string name="spi_slave_trans");
    super.new(name);
  endfunction

endclass
