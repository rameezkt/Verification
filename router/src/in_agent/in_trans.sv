`ifndef __IN_TRANS__
`define __IN_TRANS__

class in_trans extends router_trans_base;
   
   rand int num_data_bits;
   rand bit data [];

   constraint c1 { data.size() == num_data_bits;
                   num_data_bits inside{ [0:`MAX_DATA_BITS] };
                }    

endclass

`endif
