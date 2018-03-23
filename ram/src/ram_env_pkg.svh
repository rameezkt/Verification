`ifndef __RAM__ENV__PKG
`define __RAM__ENV__PKG

package ram_env_pkg;
   import   ram_types_pkg ::*;
   import   ram_pkg ::*;
   
   `include "trans_odd_addr.sv" 
   `include "trans_even_addr.sv"
   `include "write_read_gen.sv"
   `include "ram_scoreboard.sv"
   `include "ram_env.sv"

endpackage

`endif
