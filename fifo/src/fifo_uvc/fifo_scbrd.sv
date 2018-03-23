`ifndef __FIFO__SCBRD__
`define __FIFO__SCBRD__

class fifo_scbrd;

   fifo_trans i_trans;
   fifo_agent i_agent;

   int match,mismatch,num_push,num_pop,pointer;
   int data_buf1,data_buf2;

   mailbox #(fifo_trans) mbx_ms;

   logic [DATAWIDTH-1:0] data_q [$];

   function new(mailbox #(fifo_trans) mbx_ms);
      i_trans     = new();
      this.mbx_ms = mbx_ms;
   endfunction

   task run();
   forever
   begin
      mbx_ms.get(i_trans);
      i_trans.print("Scbrd Recieved");
      if(i_trans.push)
      begin
         num_push++;
         data_buf1 = i_trans.data_in;
         data_q.push_front(data_buf1);
         $display("Q Push %p\n%d",data_q,data_q.size());
      end
      if(i_trans.pop)
      begin
         num_pop++;
         data_buf2 = data_q.pop_back();
         if(i_trans.data_out == data_buf2)
         begin
            match ++;
            $info("Data Matched");
         end
         else
         begin
            mismatch ++;
            $error("__ERROR_: Data Mismatched!! Expected %d Recieved %d",data_buf2,i_trans.data_out);
         end
      end 
   end
   endtask

   task print();
      $display("--------------SCBRD--------------");
      $display("Matched Data  : %d \nMismatch Data : %d\n    Q   :  %p\nNo. of Push   : %d \nNo. of Pop    : %d",match,mismatch,data_q,num_push,num_pop);
   endtask

endclass

`endif
