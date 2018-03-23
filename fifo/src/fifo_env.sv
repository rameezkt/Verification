`ifndef __FIFO__ENV__
`define __FIFO__ENV__

class fifo_env;

   fifo_agent i_agent;
   fifo_scbrd i_scbrd;

   mailbox #(fifo_trans) mbx_ms;
   virtual fifo_intf i_vif;

   function new(virtual fifo_intf i_vif);
      mbx_ms  = new();
      i_agent = new(this.mbx_ms,i_vif);
      i_scbrd = new(this.mbx_ms);
   endfunction

   task run();
      fork
         i_agent.run();
         i_scbrd.run();
      join
   endtask

endclass

`endif
