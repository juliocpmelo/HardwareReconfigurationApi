#o primeiro path corresponde à localização da lib libsystemc.so, a segunda não precisa mudar desde que execute esse
#script no diretório <projeto>/processor
export LD_LIBRARY_PATH=../../../systemc-2.2.0/lib-cygwin:../components/lib
export PATH=$PATH:../../../lib-cygwin:../components/lib
./bin/processor
