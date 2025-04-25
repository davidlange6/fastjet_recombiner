# standard compile options for the c++ executable
FLAGS = -fPIC
INCS = -I/dlange/240422/mc/lib/python3.12/site-packages/fastjet/_fastjet_core/include/
LIBS = /dlange/240422/mc/lib/python3.12/site-packages/fastjet/_fastjet_core/lib/libfastjet.so
# the python interface through swig
PYTHONI = -I/dlange/240422/mc/include/python3.12/
PYTHONL = -Xlinker -export-dynamic

# default super-target
all:
	g++ $(FLAGS) $(INCS) -c MyRecombiner.cc -o MyRecombiner.o 
	swig -c++ -python $(INCS) -o recombiner_wrap.cxx recombiner.i
	g++ $(FLAGS) $(PYTHONI) $(INCS) -c recombiner_wrap.cxx -o recombiner_wrap.o
	g++ $(PYTHONL) $(LIBFLAGS) $(INCS) -shared MyRecombiner.o recombiner_wrap.o $(LIBS) -o _recombiner.so
