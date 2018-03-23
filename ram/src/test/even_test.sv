`ifndef __EVEN__TEST__
`define __EVEN__TEST__
import ram_env_pkg ::*;

program even_test (ram_intf m_vif);

   ram_env  i_ram_env;
   trans_even i_trans_even;

   initial
   begin
      i_trans_even = new();
      i_ram_env    = new(m_vif);
      i_ram_env.i_agent.i_ram_gen.trans     = i_trans_even;
      i_ram_env.i_agent.i_ram_gen.num_trans = 10;

      fork
         i_ram_env.run();
      join_none
      #1000000;
      i_ram_env.i_scoreboard.print_counts();
   end

endprogram

`endif
