`ifndef __TRANS__EVEN__
`define __TRANS__EVEN__

class trans_even extends ram_trans;

   function new ();
      super.new();
   endfunction

   constraint odd_c { addr [0] == 1'b0; }

endclass


`endif


