#ifndef HardwareProjectXmlParser_H
#define HardwareProjectXmlParser_H

#include <libxml/parser.h>
#include <libxml/tree.h>
#include <iostream>
#include <map>
#include <utility>
#include <vector>
#include <set>

typedef struct Component_t{
    std::string name;
    std::vector< std::pair <std::string, std::string> > inputs;
    std::vector< std::pair <std::string, std::string> > outputs;
    std::map<std::string, std::pair<std::string, std::string> > genericTable;
}Component;

typedef struct ComponentCompare_t {
  bool operator() (const Component& a, const Component& b) const
  { //std::cout<<"comparing "<<a.name<<" with "<<b.name<<" value "<<(a.name == b.name)<<std::endl;
    return (a.name < b.name);}
}ComponentCompare;

typedef struct Signal_t{
    std::string name;
    std::string type;
    bool isDirectBind;
}Signal;

typedef struct SignalCompare_t {
  bool operator() (const Signal& a, const Signal& b) const
  {return (a.name < b.name);}
}SignalCompare;

/*typedef struct ComponentBind_t{
    std::string port;
    Signal signal;
}ComponentBind;*/

typedef struct ComponentInstance_t{
    std::string name;
   // std::vector<ComponentBind> binds;
    //! port => value
    std::vector< std::pair<std::string,std::string> > portMaps;
    //! port => value
    std::vector< std::pair<std::string,std::string> > genericMaps;
}ComponentInstance;


class HardwareProjectXmlParser{
    public:
        std::map<Component, std::vector<ComponentInstance>, ComponentCompare > componentTable;
        std::map<std::string, std::vector< std::pair<std::string,std::string> > > genericInitializationTable;
        std::map<std::string, std::set< std::string > > componentPorts;
        std::set<Signal, SignalCompare> signalList;
        std::map<std::string, std::string > inputTable; //input name, input type
        std::map<std::string, std::string > outputTable; //output name, output type
        std::map<std::string, std::pair<std::string, std::string> > genericTable; //generic name, generic type, generic default value

        std::map<std::string, std::string > assignments; //
        std::map<std::string, std::string > signals; //singal name, signal type

        std::vector< std::pair<std::string,std::string> > signalMaps;

        std::string entityNameStr;
        std::string deviceFamily;
        std::string deviceTarget;

        std::set<std::string> dependencyFiles;
    private:
        std::string xmlProjectFile;
        int signalCount;
    public:
        HardwareProjectXmlParser(std::string xmlProjectFile);
        void parseMainEntityXmlFile();
        void buildMainEntityFile(std::string projectPath);

        /*real time hardware editing commands*/
        void addInstance(ComponentInstance instance, std::string componentType);

        std::string getValidComponentInstanceName(std::string componentType);
        
    private:
        void parseComponentBase(xmlNode * componentNode);
        void parseSignalMap(xmlNode *);
        void parseOutput(xmlNode * componentNode);
        void parseInput(xmlNode * componentNode);
        void parseInstance(xmlNode * componentNode);
        void parseAssignment(xmlNode * componentNode);
        void parseRoot(xmlNode * rootNode);
        
        
        void parseGeneric(xmlNode * componentNode);
        void parseSignals(xmlNode * componentNode);

        
      
};

#endif //HardwareProjectXmlParser_H
