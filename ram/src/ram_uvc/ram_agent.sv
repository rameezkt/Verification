`ifndef __RAM__AGENT__
`define __RAM__AGENT__

class ram_agent;
   ram_gen      i_ram_gen;
   ram_driver   i_driver;
   ram_monitor  i_monitor;

   mailbox #(ram_trans) mbx_gen;
   mailbox #(ram_trans) mbx_ms; //Now port for agent From monitor

   function new (mailbox #(ram_trans) mbx_ms,virtual  ram_intf    m_vif);
      this.mbx_ms   = mbx_ms;
      mbx_gen  = new();
      i_ram_gen  = new(this.mbx_gen);
      i_driver   = new(this.mbx_gen,m_vif);
      i_monitor  = new(this.mbx_ms ,m_vif);
   endfunction
   
   task run ();
   fork
      i_ram_gen.run();
      i_driver .run();
      i_monitor.run();
   join
   endtask

endclass

`endif
