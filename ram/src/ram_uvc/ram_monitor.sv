`ifndef __RAM__MONITOR__
`define __RAM__MONITOR__

class ram_monitor;
   
   ram_trans        trans;
   virtual ram_intf m_vif;

   mailbox #(ram_trans) mbx_ms;

   function new(mailbox #(ram_trans) mbx_ms,virtual ram_intf m_vif);
      this.mbx_ms  = mbx_ms;
      if(m_vif == null)
         $fatal("Could not find the interface !");
      else
         this.m_vif   = m_vif;
   endfunction


   task run();
      forever @(m_vif.mon_cb)
      begin
         if(m_vif.mon_cb.cs)
         begin
            trans        = new();
            trans.wr   = m_vif.mon_cb.wr;
            trans.addr = m_vif.mon_cb.addr;

            if(!m_vif.mon_cb.wr && !m_vif.mon_cb.oe)//Write
            begin		 
               trans.data = m_vif.mon_cb.data_in;
	            trans.print("Mon_Write");
            end
            else if(m_vif.mon_cb.wr && m_vif.mon_cb.oe)//Read
            begin
               trans.data = m_vif.mon_cb.data_out;
	            trans.print("Mon_Read");
            end
            mbx_ms.put(trans);
         end
      end
   endtask

  endclass

  `endif  
