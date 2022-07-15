`ifndef APB_MASTER_MONITOR_PROXY_INCLUDED_
`define APB_MASTER_MONITOR_PROXY_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_monitor_proxy
//  This is the HVL side apb_master_monitor_proxy
//  It gets the sampled data from the HDL master monitor and converts them into transaction items
//--------------------------------------------------------------------------------------------
class apb_master_monitor_proxy extends uvm_monitor; 
  `uvm_component_utils(apb_master_monitor_proxy)
   
  // Variable: apb_master_agent_cfg_h
  // Declaring handle for apb_master agent config class 
  apb_master_agent_config apb_master_agent_cfg_h;
    
  // Variable: apb_master_analysis_port
  // Declaring analysis port for the monitor port
  uvm_analysis_port#(apb_master_tx) apb_master_analysis_port;
  
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_master_monitor_proxy", uvm_component parent);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : apb_master_monitor_proxy

//--------------------------------------------------------------------------------------------
// Construct: new
//  Initializes memory for new object
//
// Parameters:
//  name   - apb_master_monitor_proxy
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_master_monitor_proxy::new(string name = "apb_master_monitor_proxy",uvm_component parent);
  super.new(name, parent);
  apb_master_analysis_port = new("apb_master_analysis_port",this);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
//  Creates the required ports, gets the required configuration from confif_db
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void apb_master_monitor_proxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual apb_master_monitor_bfm)::get(this,"","apb_master_monitor_bfm", apb_master_mon_bfm_h)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_APB_MASTER_MONITOR_BFM","cannot get() apb_master_mon_bfm_h");
  end
endfunction : build_phase


//--------------------------------------------------------------------------------------------
// Task: run_phase
//  This task calls the monitor logic written in the monitor BFM at HDL side
//  Receives data packet from slave monitor bfm and converts into the transaction objects
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task apb_master_monitor_proxy::run_phase(uvm_phase phase);

endtask : run_phase

`endif


