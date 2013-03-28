#o primeiro path corresponde à localização da lib libsystemc.so, a segunda não precisa mudar desde que execute esse
#script no diretório <projeto>/processor
export LD_LIBRARY_PATH=`pwd`/../systemc-2.3.0/lib-cygwin/:../lib:../libxml2-2.7.8.win32/lib/:../zlib-1.2.5/lib/:../iconv-1.9.2.win32/lib/
export PATH=$PATH:$LD_LIBRARY_PATH
echo $PATH
./bin/HardwareReconfTests
