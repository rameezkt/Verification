`ifndef __TEST__FWFR__
`define __TEST__FWFR__

import fifo_env_pkg ::*;
import fifo_types_pkg ::*;
import fifo_pkg ::*;

program test_FWFR(fifo_intf m_vif);

   fifo_env     i_env;
   zero_delay_trans m_burst_trans;

   initial
   begin
      i_env = new(m_vif);
      m_burst_trans = new();

      i_env.i_agent.i_push_gen.i_trans = m_burst_trans;
      i_env.i_agent.i_pop_gen.i_trans  = m_burst_trans;
      i_env.i_agent.i_push_driver.reset();

      i_env.i_agent.i_push_gen.num_trans = 0;
      i_env.i_agent.i_pop_gen.num_trans  = 0;
      
      fork
         i_env.run();
      join_none

      i_env.i_agent.i_push_gen.do_push(RAM_DEPTH);
      wait(m_vif.full==1);
      
      i_env.i_agent.i_pop_gen.do_pop(RAM_DEPTH);
      wait(m_vif.empty==1);
      
      #1000;
      i_env.i_scbrd.print();
   end

endprogram

`endif
