  // Copy & Clone Methods
`include "uvm_macros.svh";
import uvm_pkg::*;

class object extends uvm_object;
  
  rand bit[3:0] data; 
  function new (string str = "object");
    super.new(str);
  endfunction
  
  `uvm_object_utils_begin(object)
  `uvm_field_int (data, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass

module tb;
  object f;
  object s;
  int status =0;
  
  /*
  initial begin
  
    f = new("first");
    s = new("second");
    s.randomize();
    s.copy(f);
    f.print();
    s.print();
  end*/
  
 /* 
 
  initial begin
    object f,s;
    f = new("first");
    //s = f.clone();  
    
    /*Incompatible types at assignment 
	When use assignment operator "=" sign so parent class handle is (uvm_object) type and child     handle is off first type   
	Here s is the child type it is of (first) type and when we use assignment operator and         clone method  (f.(clone)) it will return the handle of parent class and it is of uvm_object 	   type but here s is of (first) type a derived class therefore we are getting an                 incompatibility type error so using the $cast.*/
    
  /*
  	$cast(s,f.clone());
    f.print();
    s.print();
  end
endmodule */


//Compare 
  initial begin
  f = new ("f");
  s = new("s");
  f.randomize();
  s.copy(f);
  f.print();
  s.print();
     
    status = f.compare(s);
  $display("Value of status : %0d", status);
  end
endmodule

/*              //Shallow VS Deep


`include "uvm_macros.svh"
import uvm_pkg::*;
 
 
class first extends uvm_object; 
  
  rand bit [3:0] data;
  
  function new(string path = "first");
    super.new(path);
  endfunction 
  
  `uvm_object_utils_begin(first)
  `uvm_field_int(data, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
///////////////////////////////////////
 
class second extends uvm_object;
  
  first f;
  
  function new(string path = "second");
    super.new(path);
    f = new("first");
  endfunction 
  
  `uvm_object_utils_begin(second)
  `uvm_field_object(f, UVM_DEFAULT);
  `uvm_object_utils_end
  
endclass
 
////////////////////////////////////////////
 
 /*
module tb;
 
second s1, s2; ///shallow
  
  initial begin
    s1 = new("s1");
    s2 = new("s2");
    s1.f.randomize();
    s1.print();
    s2 = s1;
    s2.print();
    
    s2.f.data = 12;
    s1.print();
    s2.print();
 
  end
  
  
  
endmodule
*/

/*
module tb;
 
second s1, s2; ///shallow
  
  initial begin
    s1 = new("s1");
   // s2 = new("s2");
    
    s1.f.randomize();
    
    //s2.copy(s1);  ///deep copy
    
    $cast(s2,s1.clone()); ///deep copy
    s1.print();
    s2.print();
    
    s2.f.data = 12;
    s1.print();
    s2.print();
    
 
  end
  
  
  
endmodule

*/
