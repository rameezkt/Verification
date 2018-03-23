`ifndef __FIFO__ENV__PKG__
`define __FIFO__ENV__PKG__

package fifo_env_pkg;

   import fifo_types_pkg ::*;
   import fifo_pkg ::*;
   
   `include "more_push_trans.sv"
   `include "zero_delay_trans.sv"
   `include "fifo_scbrd.sv"
   `include "fifo_env.sv"

endpackage


`endif
