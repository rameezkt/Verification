`ifndef __FIFO_PKG__
`define __FIFO_PKG__

package fifo_pkg;
   import fifo_types_pkg ::*;

   `include "fifo_trans.sv"
   `include "fifo_push_gen.sv"
   `include "fifo_pop_gen.sv"
   `include "fifo_push_driver.sv"
   `include "fifo_pop_driver.sv"
   `include "fifo_push_monitor.sv"
   `include "fifo_pop_monitor.sv"
   `include "fifo_agent.sv"

endpackage

`endif
