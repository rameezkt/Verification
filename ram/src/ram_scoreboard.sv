`ifndef __RAM__SCOREBOARD__
`define __RAM__SCOREBOARD__

class ram_scoreboard;

   ram_trans trans;
   mailbox #(ram_trans) mbx_ms;
   bit [DATAWIDTH-1:0]  data_st [int];
   int count,error_count,empty_count,write_count;

   function new(mailbox #(ram_trans)mbx_ms);
      trans       = new();
      this.mbx_ms = mbx_ms;
   endfunction

   task run();
   forever
   begin
      mbx_ms.get(trans);
      $display("%m , Packet received from monitor");
      trans.print();
      if(!trans.wr) // rwn
      begin
         data_st[trans.addr] = trans.data;
	      write_count++;
      end
      else if(trans.wr)
      begin
         if(data_st.exists(trans.addr))
	      begin	 
            if(data_st[trans.addr] == trans.data)
	         begin
               count++;
	            $info("Data Matched at address: %0h, data:%0h", trans.addr,trans.data);
            end
            else
	         begin
	            $error("Data Mismatch at address: %0h, expected_data :%0h , actual_data :%0h", trans.addr,data_st[trans.addr],trans.data);
               error_count++;
            end
         end
         else
	      begin
	         empty_count++;	 
            $display("Read from empty");
         end
      end
   end
   endtask
   
   function void print_counts ();
      $display("------------Counts---------------");
      $display("---------------------------------");	   
      $display("Error : %d\nRight : %d\nEmpty : %d\nWrite : %d",
	        error_count,count,empty_count,write_count);
   endfunction

endclass

`endif
