`ifndef __RAM__INTF__
`define __RAM__INTF__

import ram_types_pkg::*;

interface ram_intf(input logic clk);

   logic      [ADDRWIDTH-1:0] addr;
   logic      [DATAWIDTH-1:0] data_in;
   logic      [DATAWIDTH-1:0] data_out;
   wire logic [DATAWIDTH-1:0] data_io;
   wr_t                       wr;
   logic                      cs;
   logic                      oe;

   assign data_io = (!wr && cs && !oe) ? data_in : 'hz;
   assign data_out= (wr  && cs && oe ) ? data_io : 'hz;

   clocking drv_cb @(posedge clk);
      output addr;
      output data_in;
      input  data_out;
      output wr;
      output cs;
      output oe;
   endclocking

   clocking mon_cb @(posedge clk);
      input  addr;
      input  data_in;
      input  data_out;
      input wr;
      input cs;
      input oe;
   endclocking



endinterface

`endif

