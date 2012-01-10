#ifndef ComponentInstance_h
#define ComponentInstance_h

#include <iostream>
#include <vector>


class ComponentInstance{
    public:
        std::string name;
        std::string type;
        std::vector< std::pair<std::string,std::string> > portMaps;
        std::vector< std::pair<std::string,std::string> > genericMaps;
    public:
        ComponentInstance(std::string name, std::string type);
        void portMap(std::string port, std::string signal);
        void genericMap(std::string port, std::string signal);
};



#endif
