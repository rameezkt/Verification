
all:clean compile run gen_report

compile:
	vlib work
	vlog +define+MAX_DATA_BITS=20 -f rtl.f -f tb.f
run:
	vsim  -novopt -do "run -all" 


clean:
	rm -rf work *.log wlf* transcr* *.wlf *.ucdb 
