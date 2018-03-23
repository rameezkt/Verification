`ifndef __FIFO__PUSH__DRIVER__
`define __FIFO__PUSH__DRIVER__

class fifo_push_driver;

   fifo_trans i_trans;
   virtual fifo_intf i_vif;

   mailbox #(fifo_trans) mbx_push_gen;

   function new(mailbox #(fifo_trans) mbx_push_gen,virtual fifo_intf i_vif);
      this.mbx_push_gen = mbx_push_gen;
      this.i_vif        = i_vif;
   endfunction
   
   task run();
   forever @(i_vif.driv_cb)
   begin
      
      if(mbx_push_gen.try_get(i_trans))
      begin
         
         if(i_trans.delay>0) begin
            i_vif.driv_cb.wr_en <= 1'b0;
            i_vif.driv_cb.push  <= 1'b0;
            repeat(i_trans.delay) @(i_vif.driv_cb);
         end

         //i_trans.print("Push Driver");
         wait (!i_vif.full);
         if(i_trans.push)
         begin
            i_vif.driv_cb.wr_en   <= 1'b1;
            i_vif.driv_cb.push    <= 1'b1;
            i_vif.driv_cb.pop     <= i_trans.pop;
            i_vif.driv_cb.data_in <= i_trans.data_in;
         end
      end
      else begin
         i_vif.driv_cb.wr_en <= 1'b0;
         i_vif.driv_cb.push  <= 1'b0;
      end
   end
   endtask

   task reset();
      i_trans = new();
      void'(i_trans.randomize());
      #i_trans.reset_pre_delay;
      i_vif.driv_cb.resetn <= 1'b0;
      i_vif.driv_cb.push   <= 1'b0;
      i_vif.driv_cb.pop    <= 1'b0;
      i_vif.driv_cb.wr_en  <= 1'b0;
      i_vif.driv_cb.oe     <= 1'b0;
      #i_trans.reset_post_delay;
      repeat (2) @(posedge i_vif.clk);
      i_vif.driv_cb.resetn <= 1'b1;
   endtask

endclass
`endif
