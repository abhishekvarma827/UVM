//Factory | Create vs new | Factory Override


`include "uvm_macros.svh"
import uvm_pkg::*;
/* 
class first extends uvm_object; 
  
  rand bit [3:0] data;
  
  function new(string path = "first");
    super.new(path);
  endfunction 
  
  `uvm_object_utils_begin(first)
  `uvm_field_int(data, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
 
////////////////////////////////////////////
 
module tb;
 
  first f1,f2;
 
  
   initial begin
   
     f1 = first::type_id::create("f1");
     f2 = first::type_id::create("f2");
     
     f1.randomize();
     f2.randomize();
     
     f1.print();
     f2.print();
     
     
   end
  
endmodule


*/


/*
1 -- Register the class to the factory.
2 -- Use create method for creating the object.

in the second release of the code we want to add a control signal in the xtn class so instead of changing the current xt class we can extend a xtn class and add a new signal(ack) to it 
Instead of changing first to second everywhere we are using factory override

REPLACE THE OLD SIGNAL WITH THE NEW SIGNAL 
OLD XTN CLASS -- FIRST (old data = a)
NEW XTN CLASS -- SECOND (new data = ack(acknowledgment signal) 
*/

class first extends uvm_object;
  rand bit [3:0]a;
  
  function new (string first = "first");
    super.new(first);
  endfunction
  
  `uvm_object_utils_begin(first)
  `uvm_field_int (a,UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass

class second extends first;
  rand bit ack;
   function new (string second = "second");
    super.new(second);
  endfunction
  
  `uvm_object_utils_begin(second)
  `uvm_field_int (ack,UVM_DEFAULT);
  `uvm_object_utils_end
endclass

class last extends uvm_component;
  `uvm_component_utils(last);
  
    first f;
    function new(string str="last", uvm_component parent);
      super.new(str,parent);
    f = first::type_id::create("f");
    f.randomize();
    f.print();
  endfunction
endclass

module tb;
  last t;
  initial begin
    t.set_type_override_by_type(first::get_type,second::get_type); //Replace first with second
    //We haven't changed the instance of the old XTN class in any of the component therefor we are getting new data along with the new one.
    t = last::type_id:: create("t",null);
  end
endmodule
