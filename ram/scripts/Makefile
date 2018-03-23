# To run with GUI(graphical user interface), so the following command
# make gui=1

gui=0

ifeq ($(gui),0)
	gui_opt = "-c"
else
	gui_opt = "-i"
endif

cover=0

ifeq ($(cover),0)
	cover_opt = "+cover=bcst"
	cover_opt_run = "-coverage"
endif


test_name=base_test


all:clean compile run gen_report

compile:
	vlib work
	vlog  $(cover_opt) +define+test_name=$(test_name) -f rtl.f -f tb.f
run:
	vsim $(gui_opt) $(cover_opt_run) -novopt tb_top -l run.log -do "coverage save -onexit $(test_name).ucdb; run -all" 


clean:
	rm -rf work *.log wlf* transcr* *.wlf *.ucdb 

gen_report:
	perl gen_report.pl $(test_name)

