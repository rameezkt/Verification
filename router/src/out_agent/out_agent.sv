`ifndef __OUT_AGENT__
`define __OUT_AGENT__

class out_agent;
   out_monitor i_mon;

   mailbox #(out_trans) mbx_ms;

   function new(mailbox #(out_trans) mbx_ms,virtual out_intf i_vif);
      this.mbx_ms = mbx_ms;
      i_mon = new(this.mbx_ms,i_vif);
   endfunction

   task run();
      fork
         i_mon.run();
      join
   endtask

endclass

`endif
