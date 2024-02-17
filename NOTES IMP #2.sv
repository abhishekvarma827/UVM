//               WORKING WITH ID AND VERBOSITY

`include "uvm_macros.svh"
import uvm_pkg::*;


  
class driver extends uvm_driver;
    `uvm_component_utils(driver)
   
    function new(string name, uvm_component parent);
      super.new(name,parent);
    endfunction
  
    task run();
      `uvm_info("DRV1", "Executed the Driver 1 code",UVM_HIGH);
      `uvm_info("DRV2","Executed the Driver 2 code",UVM_HIGH);
    endtask
endclass
  
module tb;
  driver drv;
  
  initial begin
    drv = new("DRV",null);
    drv.set_report_id_verbosity("DRV1",UVM_HIGH);
    drv.run();
  end
endmodule
