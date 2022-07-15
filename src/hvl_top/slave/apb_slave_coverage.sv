`ifndef APB_SLAVE_COVERAGE_INCLUDED_
`define APB_SLAVE_COVERAGE_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: apb_slave_coverage
//  This class is used to include covergroups and bins required for functional coverage
//--------------------------------------------------------------------------------------------
class apb_slave_coverage extends uvm_subscriber#(apb_slave_tx);
  `uvm_component_utils(apb_slave_coverage)

  //-------------------------------------------------------
  // Covergroup : apb_slave_covergroup
  //  Covergroup consists of the various coverpoints
  //  based on the number of the variables used to improve the coverage.
  //-------------------------------------------------------
  covergroup apb_slave_covergroup with function sample (apb_slave_agent_config cfg, apb_slave_tx packet);
  option.per_instance = 1;


  endgroup : apb_slave_covergroup

  //-------------------------------------------------------
  //Externally defined tasks and functions
  //-------------------------------------------------------
  extern function new(string name = "apb_slave_coverage", uvm_component parent = null);
  extern virtual function void write(apb_slave_tx t);
  extern virtual function void report_phase(uvm_phase phase);

endclass : apb_slave_coverage

//--------------------------------------------------------------------------------------------
// Construct: new
// 
// Parameters:
//  name - apb_slave_coverage
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function apb_slave_coverage::new(string name = "apb_slave_coverage",uvm_component parent = null);
  super.new(name, parent);
  apb_slave_covergroup = new();
endfunction : new

//-------------------------------------------------------
// Function: write
//  Creates the write method
//
// Parameters:
//  t - apb_slave_tx handle
//-------------------------------------------------------
function void apb_slave_coverage::write(apb_slave_tx t);
  `uvm_info(get_type_name(),"APB SLAVE COVERAGE",UVM_LOW);
  apb_slave_covergroup.sample(apb_slave_agent_cfg_h,t);
endfunction: write

//--------------------------------------------------------------------------------------------
// Function: report_phase
//  Used for reporting the coverage instance percentage values
//--------------------------------------------------------------------------------------------
function void apb_slave_coverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(), $sformatf("Slave Agent Coverage = %0.2f %%", apb_slave_covergroup.get_coverage()), UVM_NONE);
endfunction : report_phase

`endif


