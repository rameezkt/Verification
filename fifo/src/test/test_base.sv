`ifndef __TEST1__
`define __TEST1__

import fifo_env_pkg ::*;

program test1(fifo_intf m_vif);

   fifo_env i_env;

   initial
   begin
      i_env = new(m_vif);
     // @(posedge m_vif.clk);
      i_env.i_agent.i_push_driver.reset();
      @(posedge m_vif.clk);
      i_env.i_agent.i_push_gen.num_trans = 16;
      i_env.i_agent.i_pop_gen.num_trans  = 16;

      fork
         i_env.run();
      join_none

      #1000;
      i_env.i_scbrd.print();
   end
endprogram

`endif
