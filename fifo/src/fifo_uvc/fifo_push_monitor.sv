`ifndef __FIFO__PUSH__MONITOR__
`define __FIFO__PUSH__MONITOR__

class fifo_push_monitor;
   fifo_trans i_trans;
   virtual fifo_intf i_vif;
   mailbox #(fifo_trans) mbx_ms;
   int num_push,num_pop,pointer;

   function new (mailbox #(fifo_trans) mbx_ms,virtual fifo_intf i_vif);
      this.i_vif  = i_vif;
      if(i_vif == null)
         $error("Null vif in push mon");
      else
         this.mbx_ms = mbx_ms;
   endfunction

   int count;
   task check_full_empty(); 
   forever @(i_vif.mon_cb)
      begin
      if(i_vif.mon_cb.pop && i_vif.mon_cb.oe && i_vif.mon_cb.resetn && !(i_vif.mon_cb.push && i_vif.mon_cb.wr_en))
         pointer--;
      if(i_vif.mon_cb.push && i_vif.mon_cb.wr_en && i_vif.mon_cb.resetn && !(i_vif.mon_cb.pop && i_vif.mon_cb.oe))
         pointer++;
      
      if(i_vif.full)
      begin
         //if(i_vif.mon_cb.push)     **Full asserts with the last push,both are in same posedge clk.
         //   $error("_ERROR_ : Error in Stimulus, Cannot push a full fifo!");
         if(pointer == RAM_DEPTH)
            $info("__________________Full__________________");
         else
            $error("_ERROR_ : ___________________Error in Full!___________________ Pointer %d",pointer);
      end
      if(i_vif.mon_cb.empty)
      begin
         if(pointer == '0)
            $info("__________________Empty__________________");
         else
            $error("___________________Error in Empty!___________________ Pointer %d",pointer);
      end
   end
   endtask



   int push_count_mon;

   task run();
      fork
         check_full_empty();
      join_none

      forever @(i_vif.mon_cb)
      begin
         if(i_vif.mon_cb.push && i_vif.mon_cb.wr_en && i_vif.mon_cb.resetn)
         begin
            push_count_mon++;
            i_trans = new();
            i_trans.push    = i_vif.mon_cb.push;
            i_trans.pop     = i_vif.mon_cb.pop;
            i_trans.data_in = i_vif.mon_cb.data_in;
            i_trans.full    = i_vif.mon_cb.full;
            i_trans.empty   = i_vif.mon_cb.empty;
            //i_trans.print("Push Mon");
            $display("push_count_mon %d",push_count_mon);
            mbx_ms.put(i_trans.clone());
         end   
      end
   endtask

endclass
`endif
