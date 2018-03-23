`ifndef __RAM__GEN__
`define __RAM__GEN__

class ram_gen;

   int num_trans=1;
   ram_trans trans;

   mailbox #(ram_trans) mbx_gen;
   
   function new (mailbox #(ram_trans) mbx_gen);
      this.mbx_gen = mbx_gen;
      if(trans == null)
         trans     = new();
   endfunction

   virtual task run();
      repeat(num_trans)
      begin
         void'(trans.randomize());
         mbx_gen.put(trans.clone());
	      trans.print("Gen");
      end
   endtask

endclass

`endif
