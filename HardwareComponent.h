#ifndef HardwareComponent_h
#define HardwareComponent_h

#include <systemc.h>

#include <map>

SC_MODULE(HardwareComponent) {
	typedef enum DataType_t{
		DataType_vector,
		DataType_bit,
		DataType_integer
	}DataType;

	public:
		std::map<std::string, sc_port_base*> ports;
	
	public:
		SC_CTOR(HardwareComponent){
		}
		void addInput(std::string name, DataType type, int size = 1);
		void addOutput(std::string name, DataType type, int size = 1);
		void addInout(std::string name, DataType type, int size = 1);
		sc_port_base* getPort(std::string name);
		void portMap(std::string selfPortName, sc_port_base* port);
		void portMap(std::string selfPortName, sc_signal_resolved* signal);
		void addChildComponent(sc_module *child);

	private:
		void addPortAttributes(std::string name, DataType type, int size);

};

#endif
