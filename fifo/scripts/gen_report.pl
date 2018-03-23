
open(FH,"<run.log") or die "Couldn't open the file";
open(RPT,">>run_report") or die "Couldn't open the file";

my $err_flag=0;
$test_name = $ARGV[0];

while(<FH>) {
   if($_ =~ m/_ERROR_/ and !$err_flag)
   {
      printf("\n ***********************\n   Test Failed! \n ***********************");
      $err_flag =1;
      break;
   }
}
if(!$err_flag) {
      printf("\n ***********************\n   Test Passed! \n ***********************");
}

if($err_flag) {
   print RPT "$test_name : Failed\n";
} else {
   print RPT "$test_name : Passed\n";
}

close(FH);
close(RPT);


