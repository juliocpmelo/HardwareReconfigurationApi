#ifndef SignalComponent_h
#define SignalComponent_h

#include <iostream>

class SignalComponent{
    public:
        std::string name;
        std::string type;
   // bool isDirectBind;
    public:
        SignalComponent(std::string name,std::string type);
};

typedef struct SignalComponentCompare_t {
  bool operator() (const SignalComponent& a, const SignalComponent& b) const
  {return (a.name < b.name);}
}SignalComponentCompare;

#endif
