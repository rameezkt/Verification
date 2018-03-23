`ifndef __FIFO__TRANS__
`define __FIFO__TRANS__

class fifo_trans;
   rand logic push;
   rand logic pop;
   rand logic [DATAWIDTH-1:0] data_in;
   rand logic [  3   :   0  ] delay;
   rand   bit [  3   :   0  ] reset_pre_delay;
   rand   bit [  3   :   0  ] reset_post_delay;

        logic [DATAWIDTH-1:0] data_out;
        logic full;
        logic empty;
        bit   resetn;

  constraint c1 { push dist { 0 := 9999, 1 := 1};};
  constraint c2 { pop  dist { 0 := 9999, 1 := 1};};

   function fifo_trans clone ();
      fifo_trans trans_c;
      trans_c = new();
      trans_c.push     = this.push;
      trans_c.pop      = this.pop;
      trans_c.data_in  = this.data_in;
      trans_c.delay    = this.delay;
      trans_c.data_out = this.data_out;
      trans_c.full     = this.full;
      trans_c.empty    = this.empty;
      trans_c.resetn   = this.resetn;
      trans_c.reset_pre_delay  = this.reset_pre_delay;
      trans_c.reset_post_delay = this.reset_post_delay; 
      return (trans_c);
   endfunction

   function void print(string msg = "");
      $display("---------------%s---------------",msg);
      $display(" Push    : %d \n Pop     : %d \n Data_in : %d \n Delay   : %d \n Data_out: %d \n Full    : %d \n Empty   : %d",
                 this.push,this.pop,this.data_in,this.delay,this.data_out,this.full,this.empty);
   endfunction

endclass

`endif
