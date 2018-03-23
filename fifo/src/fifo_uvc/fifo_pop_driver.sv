`ifndef __FIFO__POP__DRIVER__
`define __FIFO__POP__DRIVER__

class fifo_pop_driver;

   fifo_trans i_trans;
   virtual fifo_intf i_vif;
   mailbox #(fifo_trans) mbx_pop_gen;

   function new(mailbox #(fifo_trans) mbx_pop_gen,virtual fifo_intf i_vif);
      this.i_vif       = i_vif;
      this.mbx_pop_gen = mbx_pop_gen;
   endfunction

   task run();
      forever  @(i_vif.driv_cb)
      begin
         if(mbx_pop_gen.try_get(i_trans))
         begin
            //i_trans.print("Pop Driver");
            if(i_trans.delay>0)
            begin
               i_vif.driv_cb.oe    <= 1'b0;
               i_vif.driv_cb.pop   <= 1'b0;
               repeat (i_trans.delay) @(i_vif.driv_cb);
            end
            wait (!i_vif.empty);
            if(i_trans.pop)
            begin
               i_vif.driv_cb.oe    <= 1'b1;
               i_vif.driv_cb.pop   <= 1'b1;
               i_vif.driv_cb.push  <= i_trans.push;
            end
         end
         else
         begin
            i_vif.driv_cb.oe    <= 1'b0;
            i_vif.driv_cb.pop   <= 1'b0;
         end
      end
   endtask

endclass



   
`endif
