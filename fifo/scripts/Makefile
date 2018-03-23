# To run with GUI(graphical user interface), so the following command
# make gui=1

gui=0

ifeq ($(gui),0)
	gui_opt = "-c"
else
	gui_opt = "-i"
endif

cover=0
addr_width = 4

ifeq ($(cover),1)
	cover_opt = "+cover=bcst"
	cover_opt_run = "-coverage"
	cov_opt_do = "coverage save -onexit $(test_name).ucdb;"
endif


test_name=test_FWFR


all:clean compile run gen_report

compile:
	vlib work
	vlog  $(cover_opt) +define+ADDR_WIDTH=$(addr_width) +define+test_name=$(test_name) -f rtl.f -f tb.f
run:
	vsim $(gui_opt) $(cover_opt_run) -novopt tb_top -l run.log -do " $(cov_opt_do) run -all" 


clean:
	rm -rf work *.log wlf* transcr* *.wlf *.ucdb 

gen_report:
	perl gen_report.pl $(test_name)

