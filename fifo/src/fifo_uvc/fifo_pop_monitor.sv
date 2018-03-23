`ifndef __FIFO__POP__MONITOR__
`define __FIFO__POP__MONITOR__

class fifo_pop_monitor;
   fifo_trans i_trans;
   virtual fifo_intf i_vif;
   mailbox #(fifo_trans) mbx_ms;

   function new (mailbox #(fifo_trans) mbx_ms,virtual fifo_intf i_vif);
      this.i_vif  = i_vif;
      this.mbx_ms = mbx_ms;
   endfunction
   
   int pop_count_mon;
   bit read_en;
   
   task run();
      forever @(i_vif.mon_cb)
      begin
         if(read_en)
         begin
            i_trans.data_out = i_vif.mon_cb.data_out;
            mbx_ms.put(i_trans.clone());
            read_en =0;
         end
         if(i_vif.mon_cb.pop && i_vif.mon_cb.oe && i_vif.mon_cb.resetn)
         begin
            i_trans = new();
            pop_count_mon++;
            i_trans.pop      = i_vif.mon_cb.pop;
            i_trans.full     = i_vif.mon_cb.full;
            i_trans.empty    = i_vif.mon_cb.empty;
            read_en =1;
         end 
      end
   endtask

endclass
`endif

