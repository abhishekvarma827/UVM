`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
  int data = 5;
  
  initial 
    begin
    //`uvm_info("[TB_TOP]", "Hello"  ,UVM_NONE );
    `uvm_info("TB_TOP",$sformatf("Value of the data is %0d",data),UVM_NONE); 
      //If wanted to print the data along with the message use system function
  
    //To get the verbosity level as we have not extended any class we will be using             uvm_top to get the verbosity level (UVM_MEDIUM = 200)
    $display("Default Verbosoity Level :%0d",uvm_top.get_report_verbosity_level);
    
      //As verbosity level is set as medium we will try to print with different                   levels and see
      `uvm_info("TOP", " Verbosity is NONE ", UVM_NONE);
      `uvm_info("TOP", " Verbosity is LOW ", UVM_LOW);
      `uvm_info("TOP", " Verbosity is MEDIUM ", UVM_MEDIUM);
      `uvm_info("TOP", " Verbosity is HIGH ", UVM_HIGH);
      `uvm_info("TOP", " Verbosity is FULL ", UVM_FULL);
      `uvm_info("TOP", " Verbosity is DEBUG ", UVM_DEBUG);
      
      #10
      //Changing the verbosity level
      uvm_top.set_report_verbosity_level(UVM_HIGH);
      $display("Default verbosity level is :%0d",uvm_top.get_report_verbosity_level);
      `uvm_info("TOP", " Verbosity is NONE ", UVM_NONE);
      `uvm_info("TOP", " Verbosity is LOW ", UVM_LOW);
      `uvm_info("TOP", " Verbosity is MEDIUM ", UVM_MEDIUM);
      `uvm_info("TOP", " Verbosity is HIGH ", UVM_HIGH);
      `uvm_info("TOP", " Verbosity is FULL ", UVM_FULL);
      `uvm_info("TOP", " Verbosity is DEBUG ", UVM_DEBUG);
      
  end
  
endmodule


/*

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
    drv.set_report_id_verbosity("DRV2",UVM_HIGH);
    drv.run();
  end
endmodule





*/
