`ifndef __OUT_AGENT_PKG__
`define __OUT_AGENT_PKG__

package out_agent_pkg;
   parameter ADDRWIDTH = 4;

   `include "router_trans_base.sv"
   `include "out_trans.sv"
   `include "out_monitor.sv"
   `include "out_agent.sv"

endpackage

`endif
