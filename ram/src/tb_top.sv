`ifndef __TB__TOP__
`define __TB__TOP__


module tb_top ();
   
   bit clk;
 
   ram_intf m_vif (.clk(clk));

   //base_test i_base_test(m_vif);
   `test_name i_test(m_vif);

   sram  dut( 
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


endmodule

`endif
