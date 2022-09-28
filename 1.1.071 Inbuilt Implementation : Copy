`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class temp extends uvm_object;
  bit [3:0] data_temp;
  
  function new(string inst = "temp");
  super.new(inst);
  endfunction
  
  `uvm_object_utils_begin(temp) 
  `uvm_field_int(data_temp, UVM_DEFAULT)
  `uvm_object_utils_end 
    
endclass
 
 
class transaction extends uvm_sequence_item;
 
 
 rand bit [3:0] data;
 temp t;
  
 
function new(string inst = "transaction");
super.new(inst);
t = new("t");  
endfunction
  
 `uvm_object_utils_begin(transaction) 
  `uvm_field_int(data, UVM_DEFAULT)
  `uvm_field_object(t, UVM_DEFAULT)
  `uvm_object_utils_end 
endclass
 
 
module tb;
 
transaction tr_a, tr_b;
 
initial begin
  /////////adding constructor to both instances
  tr_a = new("tr_a");
  tr_b = new("tr_b");
  
  ///////////////generate random data for one of instance
  tr_a.randomize();
  tr_a.t.data_temp = 4'b0011;
  tr_a.print();
  
  ///////////////////copy the content of instance a to b
  tr_b.copy(tr_a);
  tr_b.print();
  
  //////////////////update the content from any one instance
  tr_b.t.data_temp = 4'b0000;
  tr_a.print();
  tr_b.print();
end
 
endmodule
