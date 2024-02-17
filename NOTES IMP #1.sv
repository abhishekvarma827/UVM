/* WORKING WITH ID like DRV1, DRV2, ENV1. ENV2 (set_report_id_verbosity) 
 Working with Individual Component like DRV | ENV (set_report_verbosity_level)
 Working with entire Hierarchy like ENV has DRV & MON (set_report_verbosity_level_hier)
 Overriding the Severity for ID's | Entire Class 
							1.	(set_report_severity_override) entire class
							2.  (set_report_severity_id_override) Specific ID 	
 We can change the action of the macros by 
 				            1. set_report_severity_action(UVM_INFO,UVM_NO_ACTION)
							2. set_report_severity_action(UVM_INFO,UVM_DISPLAY | UVM_EXIT)
 we can exit the simulation based on the errors we are encountering call the die method and exit 
 							1. set_report_max_quit_count(2);
*/

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
    `uvm_error("DRV2","First Error DRV2 code");   //UVM_Count
    `uvm_warning("DRV2","Executed DRV2 code");
    #10;
    `uvm_error("DRV2","Second Error DRV2 code"); 
    `uvm_error("DRV2","Executed DRV2 code"); // total error messages = 3
     `uvm_info("DRV2","Executed DRV2 code",UVM_HIGH);
    #10;
    `uvm_fatal("DRV1","Simulation could not continue");//Code after fatal doesn't work  //UVM_Exit
     `uvm_error("DRV2","Executed DRV2 code"); 
     `uvm_error("DRV2","Executed DRV2 code");
    `uvm_fatal("DRV1","Simulation could not continue");//Code after fatal doesn't work
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
   // d.set_report_severity_override(UVM_FATAL,UVM_INFO); //entire class
   // d.set_report_severity_id_override(UVM_FATAL,"DRV1",UVM_INFO); //entire class
    
    
    //ACTION CONTROL
      // d.set_report_severity_action(UVM_INFO,UVM_NO_ACTION);
      //d.set_report_severity_action(UVM_INFO,UVM_DISPLAY | UVM_EXIT);
    d.set_report_severity_action(UVM_FATAL,UVM_DISPLAY);
    
    //To end the simulation based on the number of errors we are encountering
    d.set_report_max_quit_count(2);
    
    e.run();
    d.run();
    
//can set the entire UVM verbosity by writing the + UVM_VERBOSITY = UVM_HIGH (Run Options)
    
  end
endmodule
