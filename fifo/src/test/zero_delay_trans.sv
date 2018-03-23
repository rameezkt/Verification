`ifndef __ZERO_DELAY_TRANS__
`define __ZERO_DELAY_TRANS__

class zero_delay_trans extends fifo_trans;

   
   constraint zero_c {delay == 0;}

endclass

`endif
