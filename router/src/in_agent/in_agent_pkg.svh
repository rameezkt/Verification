`ifndef __IN_AGENT_PKG__
`define __IN_AGENT_PKG__

package in_agent_pkg;
   
   parameter ADDRWIDTH = 4;

   `include "router_trans_base.sv" // for this you need +incdir+path in .f
   `include "in_trans.sv"
   `include "in_generator.sv"
   `include "in_driver.sv"
   `include "in_monitor.sv"
   `include "in_agent.sv"

endpackage

`endif
