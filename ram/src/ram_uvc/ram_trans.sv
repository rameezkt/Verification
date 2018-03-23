`ifndef __RAM_TRANS__
`define __RAM_TRANS__

class ram_trans;
   
   rand bit [ADDRWIDTH-1:0] addr;
   rand bit [DATAWIDTH-1:0] data;
   rand wr_t                wr;
   rand bit [   3  :  0   ] delay;
   
   function ram_trans clone();
      ram_trans trans_p;
      trans_p = new();
      trans_p.data = this.data;
      trans_p.addr = this.addr;
      trans_p.wr   = this.wr;
      trans_p.delay= this.delay;
      return(trans_p);
   endfunction

   function void print (string msg="");
      $display("-----------------%s---------------",msg);
      $display("Data  : %h\nAddr  : %h\nWR    : %s\nDelay : %h",
               this.data,this.addr,this.wr.name,this.delay);
   endfunction
      
endclass

`endif
