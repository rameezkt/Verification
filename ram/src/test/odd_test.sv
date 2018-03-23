`ifndef __ODD__TEST__
`define __ODD__TEST__
import ram_env_pkg ::*;

program odd_test (ram_intf m_vif);

   ram_env  i_ram_env;
   trans_odd i_trans_odd;

   initial
   begin
      i_trans_odd = new();
      i_ram_env = new(m_vif);
      i_ram_env.i_agent.i_ram_gen.trans     = i_trans_odd;
      i_ram_env.i_agent.i_ram_gen.num_trans = 10;

      fork
         i_ram_env.run();
      join_none
      #1000000;
      i_ram_env.i_scoreboard.print_counts();
   end

endprogram

`endif
