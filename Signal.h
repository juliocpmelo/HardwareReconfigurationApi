#ifndef Signal_h
#define Signal_h

#include <iostream>

class Signal{
    public:
        std::string name;
        std::string type;
   // bool isDirectBind;
    public:
        Signal(std::string name,std::string type);
};

typedef struct SignalCompare_t {
  bool operator() (const Signal& a, const Signal& b) const
  {return (a.name < b.name);}
}SignalCompare;

#endif
