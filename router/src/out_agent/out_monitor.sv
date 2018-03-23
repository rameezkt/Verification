`ifndef __OUT_MONITOR__
`define __OUT_MONITOR__

class out_monitor;
   out_trans i_trans;
   virtual out_intf  i_vif;
   mailbox #(out_trans) mbx_ms;

   function new(mailbox #(out_trans) mbx_ms,virtual out_intf i_vif);
      this.mbx_ms = mbx_ms;
      this.i_vif  = i_vif;
   endfunction

   task run();
      forever @i_vif.mon_cb
      begin
         if(!i_vif.frameo_n)
         begin
            do
            begin
               wait(!i_vif.mon_cb.valido_n);
               i_trans.data = new[i_trans.data.size() +1]({i_trans.data,i_vif.data});
               @i_vif.mon_cb;
            end
            while(!i_vif.frameo_n);
         end
         mbx_ms.put(i_trans.clone());
      end
   endtask

endclass

`endif
