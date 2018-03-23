`ifndef __FIFO__AGENT2__
`define __FIFO__AGENT2__

class fifo_agent2 extends fifo_agent;

   function new(mailbox #(fifo_trans) mbx_ms,virtual fifo_intf i_vif);
      super.new(mbx_ms,i_vif);
   endfunction

   task run();
      fork
         i_push_gen.run();
         i_push_driver.run();
         i_push_monitor.run();
      join_none
      #11000;
      fork
         i_pop_gen .run();
         i_pop_driver .run();
         i_pop_monitor.run();
      join_none
   endtask

endclass
`endif
