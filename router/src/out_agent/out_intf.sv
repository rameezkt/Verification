`ifndef __OUT_INTF__
`define __OUT_INTF__

interface out_intf (input logic clk);

   logic data;
   logic frameo_n;
   logic valido_n;

   clocking mon_cb @(posedge clk);
      input data;
      input frameo_n;
      input valido_n;
   endclocking

endinterface

`endif
