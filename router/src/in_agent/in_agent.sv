`ifndef __IN_AGENT__
`define __IN_AGENT__

class in_agent;
   in_generator i_gen;
   in_driver    i_driv;
   in_monitor   i_mon;

   mailbox #(in_trans) mbx_gen;
   mailbox #(in_trans) mbx_ms;

   function new(mailbox #(in_trans) mbx_ms,virtual in_intf i_vif);
      this.mbx_ms = mbx_ms;
      mbx_gen = new();
      i_gen   = new(this.mbx_gen);
      i_driv  = new(this.mbx_gen,i_vif);
      i_mon   = new(this.mbx_ms ,i_vif);
   endfunction

   task run();
      fork
         i_gen .run();
         i_driv.run();
         i_mon .run();
      join
   endtask

endclass

`endif

