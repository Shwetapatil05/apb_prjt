`ifndef APB_SLAVE_MONITOR_PROXY_INCLUDED_
`define APB_SLAVE_MONITOR_PROXY_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_slave_monitor_proxy
//  This is the HVL slave monitor proxy
//  It gets the sampled data from the HDL slave monitor and converts them into transaction items
//--------------------------------------------------------------------------------------------
class apb_slave_monitor_proxy extends uvm_monitor;
  
  `uvm_component_utils(apb_slave_monitor_proxy)

  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_slave_monitor_proxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : apb_slave_monitor_proxy
                                                          
//--------------------------------------------------------------------------------------------
// Construct: new
//  Initializes memory for new object
//
// Parameters:
//  name - apb_slave_monitor_proxy
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_slave_monitor_proxy::new(string name = "apb_slave_monitor_proxy", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_slave_monitor_proxy::build_phase(uvm_phase phase);
  super.build_phase(phase);

endfunction : build_phase


//--------------------------------------------------------------------------------------------
// Task: run_phase
// 
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task apb_slave_monitor_proxy::run_phase(uvm_phase phase);
  

endtask : run_phase

`endif


