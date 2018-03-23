`ifndef __FIFO__POP__GEN__
`define __FIFO__POP__GEN__

class fifo_pop_gen;

   int num_trans = 1;
   fifo_trans i_trans;
   mailbox #(fifo_trans) mbx_pop_gen;

   function new (mailbox #(fifo_trans) mbx_pop_gen);
      this.mbx_pop_gen = mbx_pop_gen;
      if(i_trans == null)
         i_trans = new();
   endfunction

   virtual task run();
      do_pop(num_trans);
   endtask

   task do_pop(input int num);
      repeat(num)
      begin
         void'(i_trans.randomize() with { pop  == 1'b1;
                                          data_in == '0;
                                       });
         mbx_pop_gen.put(i_trans.clone());
         //i_trans.print("Pop Gen");
      end
   endtask

endclass

`endif
