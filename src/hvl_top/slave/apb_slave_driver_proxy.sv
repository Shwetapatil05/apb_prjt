`ifndef APB_SLAVE_DRIVER_PROXY_INCLUDED_
`define APB_SLAVE_DRIVER_PROXY_INCLUDED_

//--------------------------------------------------------------------------------------------
//  Class: apb_slave_driver_proxy
//  This is the proxy driver on the HVL side
//  It receives the transactions and converts them to task calls for the HDL driver
//--------------------------------------------------------------------------------------------
class apb_slave_driver_proxy extends uvm_driver#(apb_slave_tx);
  `uvm_component_utils(apb_slave_driver_proxy)


  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_slave_driver_proxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
    extern virtual task run_phase(uvm_phase phase);

//--------------------------------------------------------------------------------------------
//  Construct: new
//  Initializes memory for new object
//
//  Parameters:
//  name - apb_slave_driver_proxy
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_slave_driver_proxy::new(string name = "apb_slave_driver_proxy", uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
//  Function: build_phase
//  Slave_driver_bfm congiguration is obtained in build phase
//
//  Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_slave_driver_proxy::build_phase(uvm_phase phase);
  super.build_phase(phase);

endfunction : build_phase

//--------------------------------------------------------------------------------------------
//  Function: connect_phase
//
//  Parameters:
//  phase - stores the current phase
//--------------------------------------------------------------------------------------------
function void apb_slave_driver_proxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase


//--------------------------------------------------------------------------------------------
// Task: run_phase
// 
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task apb_slave_driver_proxy::run_phase(uvm_phase phase);
  
  
endtask : run_phase

  
`endif

