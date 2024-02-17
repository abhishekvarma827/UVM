`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
 
  
  
  task run();
    `uvm_info("DRV", "Informational Message", UVM_NONE);
    `uvm_warning("DRV", "Potential Error");
    `uvm_error("DRV", "Real Error"); 
    `uvm_error("DRV", "Second Real Error");
  endtask
  
 
  
endclass
 
/////////////////////////////////////////////
 
 
module tb;
  driver d;
  int file;
  
  initial begin
    file = $fopen("log.txt", "w");
    d = new("DRV", null);
    //d.set_report_default_file(file);
    d.set_report_severity_file(UVM_ERROR, file);
    
  //  d.set_report_severity_action(UVM_INFO, UVM_DISPLAY|UVM_LOG);
   // d.set_report_severity_action(UVM_WARNING, UVM_DISPLAY|UVM_LOG);
    d.set_report_severity_action(UVM_ERROR, UVM_DISPLAY|UVM_LOG);
 
    
    d.run();
    
    #10;
    $fclose(file);
  end
  
  
  
endmodule
