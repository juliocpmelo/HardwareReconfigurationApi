#o primeiro path corresponde à localização da lib libsystemc.so, a segunda não precisa mudar desde que execute esse
#script no diretório <projeto>/processor
#export LD_LIBRARY_PATH=../../lib:../../systemc-2.3.0/lib-cygwin/:../../iconv-1.9.2.win32/bin:../../libxml2-2.7.8.win32/bin:../../zlib-1.2.5/bin  
export LD_LIBRARY_PATH=../../lib:usr/local/lib/:../../systemc-2.3.0/lib-linux:/usr/lib/x86_64-linux-gnu/ 

#export PATH=$PATH:$LD_LIBRARY_PATH
./bin/configurationFilesGenerator $1 $2
