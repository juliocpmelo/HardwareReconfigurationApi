#ifndef HardwareComponent_h
#define HardwareComponent_h

#include <systemc.h>

#include <map>
#include <set>
#include <deque>

#define VECTOR_TYPE(indexBegin, indexOp, indexEnd) new HardwareComponent::VectorType(indexBegin, indexEnd, indexOp)

#define BIT_TYPE new HardwareComponent::DataType(HardwareComponent::DataTypeId_bit)

#define INTEGER_TYPE(rangeBegin, rangeOp, rangeEnd)	new HardwareComponent::IntegerType(rangeBegin, rangeEnd, rangeOp)

SC_MODULE(HardwareComponent) {

	class DataType;

	typedef enum DataTypeId_t{
		DataTypeId_vector,
		DataTypeId_bit,
		DataTypeId_integer,
		DataTypeId_string
	}DataTypeId;
	
	typedef enum PortType_t{
		PortType_in,
		PortType_out,
		PortType_inout
	}PortType;


	typedef struct PortInfo_t{
		std::string name;
		DataType* type;
		PortType portType;
		sc_port_base * scPort;
	}PortInfo;

	typedef struct Param_t{
		std::string name;
		DataType* type;
		std::string defaultValue;
		std::string value;
	}Param;
	
	typedef enum{
		SimpleOperation_plus,
		SimpleOperation_minus
	}SimpleOperation;


	/*
	 * \brief gets the int value of the given string wether it is an
	 * int or a variable name
	 * \param operand the string to be analyzed
	 * \paramTable table containing the parameters information 
	 * \return a int value with the analyzed result
	 */
	static int getValue(std::string operand, std::map<std::string, Param > *variableTable){
		/*if the operant is in the variable table then return its value*/
		if (variableTable->count(operand))
			return atoi((*variableTable)[operand].value.c_str());
		else /*otherwise it should be a number*/
			return atoi(operand.c_str());
	}

	/*
	 * \brief this function solves integer expression commonly used
	 * to describe the sizes of signals and components in terms
	 * of the param values
	 * \param expression a string with the expression
	 * \paramTable table containing the parameters information 
	 * \return the result of the expression
	 */
	static int solveSimpleExpression(std::string expressionString, std::map<std::string, Param > *variableTable){

		char * tokenPointer;
		std::deque<std::string> operandDeque;
		std::deque<SimpleOperation> operationDeque;

		tokenPointer = strtok ((char*)expressionString.c_str()," ");
		while (tokenPointer != NULL)
		{
			if(strcmp(tokenPointer, "+") == 0)
				operationDeque.push_back(SimpleOperation_plus);
			else if (strcmp(tokenPointer, "-") == 0 )
				operationDeque.push_back(SimpleOperation_minus);
			else
				operandDeque.push_back(std::string(tokenPointer));
			tokenPointer = strtok (NULL," ");
		}

		std::string operandA = operandDeque.front();
		operandDeque.pop_front();
		int result = getValue(operandA, variableTable);

		//std::cout << "solving expression "<< expressionString <<std::endl;
		while (!operationDeque.empty()){
			std::string operandB = operandDeque.front();
			operandDeque.pop_front();
			SimpleOperation op = operationDeque.front();
			operationDeque.pop_front();

			if(op == SimpleOperation_plus){
				result += getValue(operandB, variableTable);
			}
			else if(op == SimpleOperation_minus){
				result -= getValue(operandB, variableTable);
			}
		}
//		std::cout << "expression solved "<< std::endl << expressionString << " = "<< result <<std::endl;


		return result;
	}

	class DataType{
		public:
			DataTypeId id;
			/*
			 * \brief reference to table containing the parameters used in type sizing
			 * for this object
			 */
    	std::map<std::string, Param > *instanceParameters;

		public:
			DataType(DataTypeId id){
				this->id = id;
				instanceParameters = NULL;
			}
			virtual int size() {if (id == DataTypeId_bit) return 1; else return 0;}
			virtual DataType* clone() {return BIT_TYPE;}
	};

	class VectorType : public DataType{
		public:
			/*
			 * start and end indexes allow vectors
			 * start and end at any index regardness of size
			 * those parameters are required in either vhdl
			 * or verilog
			 */
			std::string startIndex;
			std::string endIndex;

			/*
			 * for vhdl it could be downto and to
			 * for verilog it is not relevant
			 */
			std::string indexOperator;
		public:
			VectorType( std::string startIndex, std::string endIndex, std::string indexOperator) : DataType(DataTypeId_vector){
				this->startIndex = startIndex;
				this->endIndex = endIndex;
				this->indexOperator = indexOperator;
			}
			/*maybe in future it could be used to evaluate expressions in startIndex and endIndex*/
			virtual int size() { 
				if (indexOperator == "to")
					return solveSimpleExpression(endIndex, instanceParameters) - 
						     solveSimpleExpression(startIndex, instanceParameters) + 1;
				else
					return solveSimpleExpression(startIndex, instanceParameters) - 
								 solveSimpleExpression(endIndex, instanceParameters) + 1;
			}
			virtual DataType* clone(){
				return VECTOR_TYPE(startIndex,indexOperator,endIndex);
			}
	};

	class IntegerType : public DataType{
		public:
			/*
			 * start and end ranges are required to languages
			 * in order to limiit the ammount of bytes used
			 * in the representation
			 */
			std::string rangeStart;
			std::string rangeEnd;

			/*
			 * it could be downto and to
			 */
			std::string rangeOperator;
		public:
			IntegerType(std::string rangeStart, std::string rangeEnd, std::string rangeOperator) : DataType(DataTypeId_integer){
				this->rangeStart = rangeStart;
				this->rangeEnd = rangeEnd;
				this->rangeOperator = rangeOperator;
			}

			/*maybe in future it could be used to evaluate expressions in startRange and endRange*/
			virtual int size() {
				return 32;
			}
			virtual DataType* clone(){
				return INTEGER_TYPE(rangeStart,rangeOperator,rangeEnd);
			}
	};



/*this information table should be generated by the ComponentDatabase or ComponentLocator*/
	typedef struct HardwareComponentInfo_t{
	/*maybe put here the files and dependencies*/
    std::string name;
    std::map<std::string, PortInfo > inputs;
    std::map<std::string, PortInfo > outputs;

		/*generic name, type, default value*/
    std::map<std::string, Param > componentParameters;

		/*list of files that need to be compiled in order to get this component corretly synthesised*/
		std::set<std::string> dependencyFiles;
	
		/* file including the declaration of the current component
		 * declaration is used in 
		 * - vhdl: component name begin ... end;
		 * - verilog: `include file
		 * TODO: autogenerate both declaration files from their source code or include
		 * this information in the xml description
		 */
		std::string componentDeclaration;

	}HardwareComponentInfo;


	private:
		void buildComponentPorts();

	public:
		/*specific instance ports*/
		std::map<std::string, PortInfo*> ports;
		std::set<std::string> softwareAccessiblePorts;

		/*specific instance param values*/
    std::map<std::string, Param > instanceParameters;

		bool isDynamic;
		HardwareComponentInfo *componentInfo;
		//table containing information about the component
	
	public:
		SC_HAS_PROCESS(HardwareComponent);
		HardwareComponent(sc_module_name name, HardwareComponentInfo *infoTable);
		void createSoftwareAccess(std::string portName);

		/*functions used in dynamic creation*/
		void addInput(std::string name, DataType *type);
		void addOutput(std::string name, DataType *type);
		void addInout(std::string name, DataType *type);
		sc_port_base* getPort(std::string name);
		void portMap(std::string selfPortName, sc_port_base* port);
		void portMap(std::string selfPortName, sc_signal_resolved* signal);
		void addChildObject(sc_object *child);

		std::string getParamValue(std::string paramName);
		void setParamValue(std::string paramName, std::string value);

	private:
		void addPortAttributes(std::string name, DataType *type);

};

#endif
