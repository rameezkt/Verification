`ifndef __MORE__PUSH__
`define __MORE__PUSH__

class more_push_trans extends fifo_trans;

   function new();
      super.new();
   endfunction

   constraint more_push {(push == 1) -> (delay < 4'h5); }

   constraint less_pop  {(pop == 1) -> (delay > 4'b0111); }

endclass

`endif
