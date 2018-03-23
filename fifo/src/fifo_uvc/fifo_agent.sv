`ifndef __FIFO__AGENT__
`define __FIFO__AGENT__

class fifo_agent;

   fifo_push_gen     i_push_gen;
   fifo_pop_gen      i_pop_gen;
   fifo_push_driver  i_push_driver;
   fifo_pop_driver   i_pop_driver;
   fifo_push_monitor i_push_monitor;
   fifo_pop_monitor  i_pop_monitor;

   mailbox #(fifo_trans) mbx_push_gen;
   mailbox #(fifo_trans) mbx_pop_gen;

   mailbox #(fifo_trans) mbx_ms;


   function new(mailbox #(fifo_trans) mbx_ms,virtual fifo_intf i_vif);
      this.mbx_ms   = mbx_ms;
      mbx_push_gen  = new();
      mbx_pop_gen   = new();
      i_push_gen    = new(this.mbx_push_gen);
      i_pop_gen     = new(this.mbx_pop_gen);
      i_push_driver = new(this.mbx_push_gen,i_vif);
      i_pop_driver  = new(this.mbx_pop_gen ,i_vif);
      i_push_monitor= new(this.mbx_ms      ,i_vif);
      i_pop_monitor = new(this.mbx_ms      ,i_vif);
   endfunction

   virtual task run();
   fork
      i_push_gen.run();
      i_pop_gen .run();
      i_push_driver.run();
      i_pop_driver .run();
      i_push_monitor.run();
      i_pop_monitor.run();
   join
   endtask

endclass
`endif
