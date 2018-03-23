`ifndef  __RAM__PKG__
`define  __RAM__PKG__

package  ram_pkg;


   import ram_types_pkg::*;

   `include "ram_trans.sv"
   `include "ram_gen.sv"
   `include "ram_driver.sv"
   `include "ram_monitor.sv"
   `include "ram_agent.sv"
    
   // include all files
   // only uvc files
endpackage

`endif
