`ifndef __RAM__ENV__
`define __RAM__ENV__

class ram_env;
   ram_agent      i_agent;
   ram_scoreboard i_scoreboard;
   
   mailbox #(ram_trans) mbx_ms;

   function new(virtual  ram_intf    vif);
      this.mbx_ms  = new();
      i_agent      = new(this.mbx_ms,vif);
      i_scoreboard = new(this.mbx_ms);
   endfunction

   task run();
   fork
      i_agent     .run();
      i_scoreboard.run();
   join
   endtask

endclass

`endif
