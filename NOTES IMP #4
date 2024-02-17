/*uvm_default_tree_printer(Handy if dealing with hierarchy of an component) | uvm_default_line_printer
  //Not required if using registering the variable or field to the factory using the field macros
  Can configure the radix of the value to be displayed on the console                                                                               --    UVM_BIN | UVM_DEC | UVM_UNSINGED | UVM_OCT | UVM_HEX | UVM_STRING | UVM_TIME
            --    UVM_ALL_ON | UVM_NOCOPY | UVM_NOPRINT | UVM_NOPACK | UVM_PHYSICAL | UVM_REFERENCE | UVM_ABSTRACT | UVM_READONLY
  */
  

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
 //   `uvm_object_utils(obj)
  function new (string str = "OBJ");
    super.new(str);
  endfunction
  
  rand bit [3:0]a;
  rand bit [7:0]b;
  /*If register a class but not registers a variable to a factory and tries to print the value using print then won't be getting an 
      error but can not see the size  as well as variable name present in a class*/
  `uvm_object_utils_begin(obj)
  `uvm_field_int(a,UVM_DEFAULT | UVM_BIN); // UVM_ALL_ON | UVM_NOCOPY | UVM_NOPRINT | UVM_NOPACK | UVM_PHYSICAL | UVM_REFERENCE
  `uvm_field_int(b,UVM_DEFAULT | UVM_DEC); //UVM_BIN | UVM_DEC | UVM_UNSINGED | UVM_OCT | UVM_HEX | UVM_STRING | UVM_TIME
  `uvm_object_utils_end
  
endclass

module tb;
  
  obj o;
  initial begin
    o = new("OBJ");
    o.randomize();
    // `uvm_info("TB_TOP",$sformatf("Value of a is %0d",o.a),UVM_NONE); //Not required if using the core print method
    o.print(); //Default table format  uvm_default_line_printer  |  uvm_default_tree_printer
  end
endmodule
