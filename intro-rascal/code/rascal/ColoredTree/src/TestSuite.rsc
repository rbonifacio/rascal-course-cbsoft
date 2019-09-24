module TestSuite

import CTree; 

public ColoredTree sample = Red(Black(Leaf(1), Red(Leaf(2), Leaf(3))), Black(Leaf(4), Leaf(5)));

test bool testElements() = 9 == elements(sample);

test bool testTotal() = 15 == sumTree(sample);

