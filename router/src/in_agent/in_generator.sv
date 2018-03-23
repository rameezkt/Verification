`ifndef __IN_GENERATOR__
`define __IN_GENERATOR__

class in_generator;
   in_trans i_trans;
   mailbox #(in_trans) mbx_gen;
   int num_trans = 1;

   function new (mailbox #(in_trans) mbx_gen);
      this.mbx_gen = mbx_gen;
      if(i_trans == null)
         i_trans = new;
   endfunction

   virtual task run();
      do_gen (num_trans);
   endtask

   task do_gen (int num);
      forever
      begin
         repeat (num);
         begin
            void'(i_trans.randomize());
            mbx_gen.put(i_trans.clone());
            i_trans.print("In Gen");
         end
      end
   endtask

endclass

`endif
