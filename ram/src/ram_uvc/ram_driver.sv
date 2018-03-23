`ifndef __RAM__DRIVER__
`define __RAM__DRIVER__

class ram_driver;

   ram_trans trans;
   virtual ram_intf m_vif;

   mailbox #(ram_trans) mbx_gen;

   function new (mailbox #(ram_trans) mbx_gen,virtual ram_intf m_vif);
      trans            = new();
      this.mbx_gen     = mbx_gen;
      if(m_vif == null)
         $fatal("Could not find the interface !");
      else
         this.m_vif    = m_vif;
   endfunction

   task run();
      forever
      begin
	      @(m_vif.drv_cb); // ##1     
         mbx_gen.get(trans);
	      trans.print("Driver");
         if(!trans.wr)
         begin  //Write
            m_vif.drv_cb.cs   <= 1'b1;
            m_vif.drv_cb.oe   <= 1'b0;
            m_vif.drv_cb.data_in <= trans.data;
         end
         else if(trans.wr)
         begin  //Read
            m_vif.drv_cb.cs   <= 1'b1;
            m_vif.drv_cb.oe   <= 1'b1;
         end
         m_vif.drv_cb.addr  <= trans.addr;
         m_vif.drv_cb.wr    <= trans.wr;
         @ (posedge m_vif.clk);
         m_vif.drv_cb.cs <= 0;
         m_vif.drv_cb.oe <= 1'b0;
         #trans.delay;
      end
   endtask

endclass

`endif
