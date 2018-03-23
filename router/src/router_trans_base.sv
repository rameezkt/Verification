`ifndef __ROUTER_TRANS_BASE__
`define __ROUTER_TRANS_BASE__

class router_trans_base;

   rand bit resetn;
   rand bit data [];
   rand bit [ADDRWIDTH-1:0] addr;
   rand bit [   3  :  0   ] pkt_delay;
   rand enum bit {toggle_valid} toggle_vald;
   rand bit [   1  :  0   ] toggle_delay;

   function router_trans_base clone();
      router_trans_base c_trans;
      c_trans = new();
      c_trans.resetn         = this.resetn;
      c_trans.data           = this.data;
      c_trans.addr           = this.addr;
      c_trans.pkt_delay      = this.pkt_delay;
      c_trans.toggle_vald    = this.toggle_vald;
      return(c_trans);
   endfunction

   function void print(string msg=" ");
      $display("_________________%s_________________",msg);
      $display("Resetn   %d \nData    %p \nAddr     %d \nPkt Dely %d \nToggle   %d",
                this.resetn,this.data,this.addr,this.pkt_delay,this.toggle_vald);
   endfunction     


endclass

`endif

