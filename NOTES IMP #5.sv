// Code your testbench here
// or browse Examples
/*                // Using Field Macros P2 : ENUM, REAL
`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
 
class obj extends uvm_object;
//  `uvm_object_utils(obj)
  
  typedef enum bit [1:0] {s0 , s1, s2, s3} state_type;
  rand state_type state;
  
  real temp = 12.34;
  string str = "UVM";
 
  function new(string path = "obj");
    super.new(path);
  endfunction
  
 
  `uvm_object_utils_begin(obj)
  `uvm_field_enum(state_type, state, UVM_DEFAULT);
  `uvm_field_string(str,UVM_DEFAULT);
  `uvm_field_real(temp, UVM_DEFAULT);
  `uvm_object_utils_end
 
  
endclass
 
module tb;
  obj o;
  
  initial begin
    o = new("obj");
    o.randomize();
    o.print(uvm_default_table_printer);
  end
  
endmodule
*/


/*

          // Using Field Macros P3 : OBJECT

`include "uvm_macros.svh"
import uvm_pkg::*;
 
class parent extends uvm_object;
  
  function new(string path = "parent");
    super.new(path);
  endfunction 
  
  rand bit [3:0] data;
  
  `uvm_object_utils_begin(parent)
  `uvm_field_int(data,UVM_DEFAULT);
  `uvm_object_utils_end
  
  
endclass
 
class child extends uvm_object;
  
   parent p;
  
  function new(string path = "child");
    super.new(path);
    p = new("parent");
  endfunction 
  
  `uvm_object_utils_begin(child)
  `uvm_field_object(p,UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
module tb;
  child c;
  
  initial begin
    c = new("child");
    c.p.randomize();  // To see the random value of data member of parent need to add == .p    If do c.randomize then only be able to see the 							random values of child only and won't be performing the randomization in parent class it will be having == 0  because 							when we add the constructor all the data member gets the default value of 0. 
    c.print();        
  end
  
endmodule
*/



              // Using Field Macros P4 : Arrays

`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class array extends uvm_object;
  
  ////////static array
  int arr1[3] = {1,2,3};
  
  ///////Dynamic array
  int arr2[];
  
  ///////Queue
  int arr3[$];
  
  ////////Associative array
  int arr4[int];
  
  
  
  function new(string path = "array");
    super.new(path);
  endfunction 
  
  `uvm_object_utils_begin(array)
  `uvm_field_sarray_int(arr1, UVM_DEFAULT);  //Static Array
  `uvm_field_array_int(arr2, UVM_DEFAULT);   //Dynamic Array
  `uvm_field_queue_int(arr3, UVM_DEFAULT);   //Queue 
  `uvm_field_aa_int_int(arr4, UVM_DEFAULT);  //Associative Interger as key
  `uvm_object_utils_end
  
  task run();
    
    ///////////////////Dynamic array value update
    arr2 = new[3];
    arr2[0] = 2;
    arr2[1] = 2;
    arr2[2] = 2;
    
    ///////////////////Queue
    arr3.push_front(3);
    arr3.push_front(3);
    
    ////////////////////Associative arrays
    arr4[1] = 4;
    arr4[2] = 4;
    arr4[3] = 4;
    arr4[4] = 4;
    
  endtask
  
endclass
 
////////////////////////////////////////////
 
module tb;
  array a;
  
  initial begin
    a = new("array");
    a.run();
    a.print();
  end
  
endmodule

