`ifndef APB_MASTER_COVERAGE_INCLUDED_
`define APB_MASTER_COVERAGE_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_master_coverage
// This class is used to include covergroups and bins required for functional coverage
//--------------------------------------------------------------------------------------------
class apb_master_coverage extends uvm_subscriber #(apb_master_tx);
  `uvm_component_utils(apb_master_coverage)
 
  //Variable: apb_master_agent_cfg_h
  //Declaring handle for master agent configuration class 
  apb_master_agent_config apb_master_agent_cfg_h;
  
  //-------------------------------------------------------
  // Covergroup: apb_master_covergroup
  //  Covergroup consists of the various coverpoints based on
  //  no. of the variables used to improve the coverage.
  //-------------------------------------------------------
  covergroup apb_master_covergroup with function sample (apb_master_agent_config cfg, apb_master_tx packet);
    option.per_instance = 1;


endgroup: apb_master_covergroup

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "apb_master_coverage", uvm_component parent = null);
  extern function void write(apb_master_tx t);
  extern virtual function void report_phase(uvm_phase phase);

endclass : apb_master_coverage

//--------------------------------------------------------------------------------------------
// Construct: new
//  Initializes memory for new object
//
// Parameters:
//  name - apb_master_coverage
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function  apb_master_coverage::new(string name = "apb_master_coverage", uvm_component parent = null);
  super.new(name, parent);
  apb_master_covergroup = new();
endfunction : new

//-------------------------------------------------------------------------------------------
// Function: write
// Overriding the write method declared in the parent class
//
// Parameters:
//  t - apb_master_tx
//--------------------------------------------------------------------------------------------
function void apb_master_coverage::write(apb_master_tx t);
  
  `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);
  apb_master_covergroup.sample(apb_master_agent_cfg_h,t);
  `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);

endfunction : write

//--------------------------------------------------------------------------------------------
// Function: report_phase
// Used for reporting the coverage instance percentage values
//--------------------------------------------------------------------------------------------
function void apb_master_coverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("APB Master Agent Coverage = %0.2f %%", apb_master_covergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif


