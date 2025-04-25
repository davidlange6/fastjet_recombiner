# standard compile options for the c++ executable
FLAGS = -fPIC
FASTJET_LOC=`python -c "import fastjet; print (fastjet.__path__[0])"`

INCS = -I$(FASTJET_LOC)/_fastjet_core/include/
LIBS = $(FASTJET_LOC)/_fastjet_core/lib/libfastjet.so
# the python interface through swig
PYTHONI = `python3-config --includes`
PYTHONL = -Xlinker -export-dynamic

# default super-target
all:
	g++ $(FLAGS) $(INCS) -c MyRecombiner.cc -o MyRecombiner.o 
	swig -c++ -python $(INCS) -o recombiner_wrap.cxx recombiner.i
	g++ $(FLAGS) $(PYTHONI) $(INCS) -c recombiner_wrap.cxx -o recombiner_wrap.o
	g++ $(PYTHONL) $(LIBFLAGS) $(INCS) -shared MyRecombiner.o recombiner_wrap.o $(LIBS) -o _recombiner.so
	echo "Add `python -c "import fastjet; print (fastjet.__path__[0])"`/_fastjet_core/lib to your LD_LIBRARY_PATH"
