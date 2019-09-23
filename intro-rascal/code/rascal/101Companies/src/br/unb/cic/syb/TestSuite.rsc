module br::unb::cic::syb::TestSuite

import br::unb::cic::syb::DataModel;

//
// an instance of the data model
// from the original SYB paper (R. Lammel and S. Peyton Jones)
// 
Employee ralf = employee("ralf", 8000.0); 
Employee joost = employee("joost", 1000.0);
Employee marlow = employee("marlow", 2000.0);
Employee blair = employee("blair", 100000.0);

Department research = department("research", ralf, [], [joost, marlow]); 
Department strategy = department("strategy", blair, [], []); 

public Company genCom = company("genCom", [research, strategy]);

// a few test cases 

test bool testTotal() = 111000.0 == total(genCom);

test bool testIncrease() = 122100.0 == increase(0.1, genCom);

