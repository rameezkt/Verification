`ifndef __WRITE__READ__TEST__
`define __WRITE__READ__TEST__
import ram_env_pkg ::*;
import ram_types_pkg ::*;
import ram_pkg ::*;

program write_read_test (ram_intf m_vif);

   ram_env  i_ram_env;
   write_read_gen i_write_read_gen;

   initial
   begin
      i_ram_env        = new(m_vif);
      i_write_read_gen = new(i_ram_env.i_agent.mbx_gen);
      i_ram_env.i_agent.i_ram_gen = i_write_read_gen;

      fork
         i_ram_env.run();
      join_none
      #1000000;
      i_ram_env.i_scoreboard.print_counts();
   end

endprogram

`endif
