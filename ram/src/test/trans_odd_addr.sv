`ifndef __TRANS__ODD__
`define __TRANS__ODD__

class trans_odd extends ram_trans;

   function new ();
      super.new();
   endfunction

   constraint odd_c { addr [0] == 1'b1; }

endclass


`endif


