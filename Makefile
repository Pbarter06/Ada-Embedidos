EXEC=demo
GPR=demo

all: clean compile

nothing:
	echo "Nothing"

compile:
	gprbuild --target=arm-eabi -P $(GPR).gpr --RTS=ravenscar-full-zynq7000
	cp ${EXEC} program

runCora10:
	xsdb cora_10_xsdb.ini
runCora07:
	xsdb cora_07_xsdb.ini

clean:
	gprclean -r -q $(GPR).gpr
	rm -f b__* $(EXEC) *.ali *.o *.adb.* *.ads.* *.bexch program


