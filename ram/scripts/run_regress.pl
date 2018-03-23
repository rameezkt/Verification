
open(FH,"<testlist") or die "Couldn't open the file";

while(<FH>) {

   system("make test_name=$_");

}


