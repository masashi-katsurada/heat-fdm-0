OUT	=	test1.eps

all: $(OUT)

test1: test1.c
	ccx test1.c

test1.eps: test1.gp test1.data
	gnuplot test1.gp

test1.data: test1
	(echo 0.1 ; echo 0.5; echo 10 1680 2; echo test1.0) | ./test1
	sed '1,4d' test1.0 > $@
