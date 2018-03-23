`ifndef __TEST__MORE__PUSH__
`define __TEST__MORE__PUSH__

import fifo_types_pkg ::*;
import fifo_pkg ::*;
import fifo_env_pkg ::*;

program test_more_push(fifo_intf m_vif);
   
   fifo_env i_env;
   more_push_trans mr_trans;

   initial
   begin
      i_env = new(m_vif);
      mr_trans = new();

      i_env.i_agent.i_push_gen.i_trans = mr_trans;
      i_env.i_agent.i_pop_gen .i_trans = mr_trans;
      
      i_env.i_agent.i_push_gen.num_trans = 1000;
      i_env.i_agent.i_pop_gen .num_trans = 1000;

      i_env.i_agent.i_push_driver.reset();

      fork
         i_env.run();
      join_none
      #12000;

      i_env.i_scbrd.print();
   end

endprogram

`endif
