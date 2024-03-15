class sanity_seq extends uvm_sequence#(wb_trans); //spi_base_seq;
	`uvm_object_utils(sanity_seq)
          wb_trans req;
    
extern function new(string name = "sanity_seq");
extern task body();
endclass
/******************** constructor*********************/
function sanity_seq :: new(string name="sanity_seq");
  super.new(name);	
endfunction

/********************* body task*******************/

task sanity_seq ::body();
 	req=wb_trans::type_id::create("req");
	begin

/******************************Slave Select reg*****************************************************************************/
  		start_item(req);
		assert(req.randomize()with{req.reg_addr==`SS_ADDR;req.wr_en==1'h1;req.reg_wr_data==32'h 00000001;});
		finish_item(req);
  		get_response(rsp);

//COMPARISION OF SEQUENCE REPONSE:


 if(req.temp_data==rsp.reg_rd_data)
 	 	`uvm_info(get_type_name(),$sformatf("===SANITY MATCHED    req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
 else
 	 	`uvm_info(get_type_name(),$sformatf("=== SANITY MISMATCHED req.temp_data=%0h rsp.reg_rd_data=%0h",req.temp_data,rsp.reg_rd_data),UVM_MEDIUM)
	end
endtask


