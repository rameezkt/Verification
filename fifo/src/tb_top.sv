`ifndef __TB__TOP__
`define __TB__TOP__

module tb_top;
   
   bit clk;

   fifo_intf m_vif(.clk(clk));

   `test_name i_test(m_vif);

   fifo  dut  (
         .clk     (m_vif.clk     ),
         .resetn  (m_vif.resetn  ),
         .data_in (m_vif.data_in ),
         .data_out(m_vif.data_out),
         .wr_cs   (m_vif.wr_en   ),
         .rd_cs   (m_vif.oe      ),
         .full    (m_vif.full    ),
         .empty   (m_vif.empty   ),
         .rd_en   (m_vif.pop     ),
         .wr_en   (m_vif.push    )
      );
      
   initial
      forever
         #10 clk = ~clk;

            

endmodule
`endif
