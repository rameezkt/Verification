`ifndef __FIFO__TYPES__PKG__
`define __FIFO__TYPES__PKG__

package fifo_types_pkg;

   parameter DATAWIDTH = 8,
             ADDRWIDTH = `ADDR_WIDTH;
   parameter RAM_DEPTH = (1 << ADDRWIDTH);
endpackage

`endif
