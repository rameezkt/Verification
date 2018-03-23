`ifndef __IN_INTF__
`define __IN_INTF__

interface in_intf (input clk);

   // Dut signals must be logic
   logic frame_n;
   logic valid_n;
   logic busy_n;
   logic data;
   
   clocking driv_cb @(posedge clk);
      output data;
      output frame_n;
      output valid_n;
      input  busy_n;
   endclocking

   // monitor will see all these signals as input
   clocking mon_cb @(posedge clk);
      input data;
      input frame_n;
      input valid_n;
      input busy_n;
   endclocking

endinterface

`endif
