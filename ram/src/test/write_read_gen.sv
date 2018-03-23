`ifndef __WRITE_READ_GEN__
`define __WRITE_READ_GEN__

class write_read_gen extends ram_gen;
   logic [ADDRWIDTH-1:0] addr_q [$];
   
   function new(mailbox #(ram_trans) mbx_gen);
      super.new(mbx_gen);
   endfunction

/*   constraint write_c { wr == 0 };

   constraint read_c  { wr == 1 };

   constraint addr_c  { addr inside {addr_q} };
*/
   task run ();
      repeat(50)
      begin
         void'(trans.randomize() with { wr == 0;} );
         addr_q.push_front(trans.addr);
         mbx_gen.put(trans.clone);
         trans.print("Write_Gen");
      end
      repeat(50)
      begin
         void'(trans.randomize() with { wr   == 1;
                                        addr inside {addr_q};
                                     });
         mbx_gen.put(trans.clone());
         trans.print("Read_Gen");
      end
   endtask

endclass
`endif
