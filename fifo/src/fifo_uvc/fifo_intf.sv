`ifndef __FIFO__INTF__
`define __FIFO__INTF__
import fifo_types_pkg ::*;

interface fifo_intf (input logic clk);

   logic resetn;
   logic push;
   logic pop;
   logic [DATAWIDTH-1:0] data_in;
   logic [DATAWIDTH-1:0] data_out;
   logic full;
   logic empty;
   logic wr_en;
   logic oe;

   clocking driv_cb @(posedge clk);
      output resetn;
      output push;
      output pop;
      output data_in;
      output wr_en;
      output oe;
   endclocking

   clocking mon_cb @(posedge clk);
      input resetn;
      input push;
      input pop;
      input data_in;
      input data_out;
      input wr_en;
      input oe;
      input full;
      input empty;
   endclocking

endinterface


`endif
