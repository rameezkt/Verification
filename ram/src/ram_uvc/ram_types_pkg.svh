`ifndef __RAM__TYPES__PKG__
`define __RAM__TYPES__PKG__

package  ram_types_pkg;

   typedef enum logic { WRITE=0,READ=1} wr_t;

   parameter DATAWIDTH = 8,
             ADDRWIDTH = 8;
endpackage

`endif
