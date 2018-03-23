`ifndef __RAM_TB2__
`define __RAM_TB2__

import ram_env_pkg :: *

   module ram_tb2 ();

   ram_env i_ram_env;
   bit clk;
   ram_intf m_vif (.clk(clk));

   sram dut        (
      .data(m_vif.data_io),
      .addr(m_vif.addr   ),
      .wr  (m_vif.wr     ),
      .cs  (m_vif.cs     ),
      .oe  (m_vif.oe     ),
      .clk (m_vif.clk    )
   );

   initial
      forever
         #5 clk = ~clk;

   initial
   begin
      ram_env = new(m_vif);
      repeat(256)
      begin

