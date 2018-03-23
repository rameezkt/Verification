+incdir+$SRC

# Include all required files for ram-uvc
+incdir+$SRC/ram_uvc
+incdir+$SRC/test
$SRC/ram_uvc/ram_types_pkg.svh
$SRC/ram_uvc/ram_intf.sv
$SRC/ram_uvc/ram_pkg.svh

# Include all required files for ram-env
+incdir+$SRC
$SRC/ram_env_pkg.svh

# Include tb-top
$SRC/tb_top.sv

# Include base-test
$SRC/test/base_test.sv
$SRC/test/odd_test.sv
$SRC/test/even_test.sv
$SRC/test/write_read_test.sv
