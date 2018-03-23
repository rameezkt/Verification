`ifndef __IN_DRIVER__
`define __IN_DRIVER__

class in_driver;
   in_trans i_trans;
   mailbox #(in_trans) mbx_gen;
   virtual in_intf i_vif;

   function new (mailbox #(in_trans)mbx_gen,virtual in_intf i_vif);
      this.mbx_gen = mbx_gen;
      this.i_vif   = i_vif;
      if(i_trans == null)
         i_trans = new;
   endfunction

   virtual task run();
      forever @ i_vif.driv_cb
      begin
         mbx_gen.get(i_trans);
         i_vif.driv_cb.frame_n <= 1'b0;
         foreach(i_trans.addr[i])
         begin
            i_vif.driv_cb.data <= i_trans.addr[i];
            @i_vif.driv_cb;
            //i_trans.addr = i_trans.addr >> 1;
         end
         
         foreach(i_trans.data[i])
         begin        
            i_vif.driv_cb.valid_n <= 1'b0; 
            i_vif.driv_cb.data <= i_trans.data[i];
            wait(i_vif.driv_cb.busy_n == 1'b1);

            if(i_trans.toggle_vald)
            begin
               if(i==i_trans.toggle_delay) //ok , but can chage this later
               begin
                  i_vif.driv_cb.valid_n <= 1'b1;
                  repeat(2) @i_vif.driv_cb; // later 2 can be randomised
               end
               else
                  @i_vif.driv_cb;
            end
            else 
               @i_vif.driv_cb;
         end

         i_vif.driv_cb.frame_n <= 1'b1;
      end
   endtask

endclass

`endif
