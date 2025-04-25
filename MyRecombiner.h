#ifndef __MyRecombiner__
#define __MyRecombiner__

#include <fastjet/JetDefinition.hh>

class MyRecombiner : public fastjet::JetDefinition::Recombiner {
public:
  MyRecombiner() {;}
  ~MyRecombiner() {;}

  std::string description() const override {return "My cool recombiner";}

  void recombine(const fastjet::PseudoJet& pa,
		 const fastjet::PseudoJet& pb,
		 fastjet::PseudoJet& pab) const;

  static fastjet::JetDefinition::Recombiner* instance() { return new MyRecombiner(); }
};

#endif
  
