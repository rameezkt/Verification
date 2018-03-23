`ifndef __IN_MONITOR__
`define __IN_MONITOR__

class in_monitor;
   in_trans i_trans;
   virtual in_intf i_vif;
   mailbox #(in_trans) mbx_ms;

   function new (mailbox #(in_trans) mbx_ms,virtual in_intf i_vif);
      this.mbx_ms = mbx_ms;
      this.i_vif  = i_vif;
   endfunction

   task run ();
      forever @i_vif.mon_cb
      begin
         if(!i_vif.mon_cb.frame_n)
         begin
            i_trans = new;
            foreach(i_trans.addr[i])
            begin
               i_trans.addr[i] = i_vif.mon_cb.data;
               @i_vif.mon_cb;
            end
            do
            begin
               wait(!i_vif.mon_cb.valid_n && i_vif.mon_cb.busy_n);
               i_trans.data = new[i_trans.data.size() +1]({i_trans.data,i_vif.mon_cb.data});
               @i_vif.mon_cb;
            end
            while(!i_vif.mon_cb.frame_n);
         end
         mbx_ms.put(i_trans.clone());
      end
   endtask

endclass

`endif
