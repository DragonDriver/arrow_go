# catch_memleak
Simple project for catching memory leak


编译：

make


cd arrow_go/bin
./my_example
短时间内看不到内存增长

or 
./my_example --enableGC
短时间内看到显著的内存增长

pprof: localhost:6060/debug/pprof
