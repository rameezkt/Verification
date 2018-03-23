`ifndef __FIFO__PUSH__GEN__
`define __FIFO__PUSH__GEN__

class fifo_push_gen;

   int num_trans = 1;
   fifo_trans i_trans;
   mailbox #(fifo_trans) mbx_push_gen;

   function new (mailbox #(fifo_trans) mbx_push_gen);
      this.mbx_push_gen = mbx_push_gen;
      if(i_trans == null)
         i_trans = new();
   endfunction

   virtual task run();
      do_push(num_trans);
   endtask

   task do_push(input int num);
      repeat(num)
      begin
         void'(i_trans.randomize() with { push == 1'b1; pop == 1'b0; });
         mbx_push_gen.put(i_trans.clone());
         i_trans.print("Push Gen");
      end
   endtask

endclass

`endif
