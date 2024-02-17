// WORKING WITH ID like DRV1, DRV2, ENV1. ENV2 (set_report_id_verbosity) 
// Working with Individual Component like DRV | ENV (set_report_verbosity_level)
// Working with entire Hierarchy like ENV has DRV & MON (set_report_verbosity_level_hier)
`include "uvm_macros.svh"
import uvm_pkg::*;

class env extends uvm_env;
  `uvm_component_utils(env)
  
  function new(string name, uvm_component parent); 
    super.new(name,parent);
  endfunction
  
  task run();
    `uvm_info("ENV1","Executed ENV1 code",UVM_HIGH);
    `uvm_info("ENV2","Executed ENV1 code",UVM_HIGH);
  endtask
endclass

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  task run();
    `uvm_info("DRV1","Executed DRV1 code",UVM_HIGH);
    `uvm_info("DRV2","Executed DRV2 code",UVM_HIGH);
    `uvm_error("DRV2","Executed DRV2 code");
    `uvm_warning("DRV2","Executed DRV2 code");
    #10;
     `uvm_error("DRV2","Executed DRV2 code"); 
    `uvm_error("DRV2","Executed DRV2 code"); // total error messages = 3
     `uvm_info("DRV2","Executed DRV2 code",UVM_HIGH);
    #10;
    `uvm_fatal("DRV2","Executed DRV2 code");//Code after fatal doesn't work
     `uvm_error("DRV2","Executed DRV2 code"); 
     `uvm_error("DRV2","Executed DRV2 code");
  endtask
endclass

module tb;
  env e;
  driver d;
  
  initial begin
    e = new("ENV",null);
    d = new("DRV",null);
  //  d.set_report_id_verbosity("DRV1",UVM_HIGH);
  //  e.set_report_id_verbosity("ENV1",UVM_FULL);
    d.set_report_verbosity_level(UVM_HIGH);
 
    e.run();
    d.run();
    
//can set the entire UVM verbosity by writing the + UVM_VERBOSITY = UVM_HIGH (Run Options)
    
  end
endmodule
