module TestSuite

import CTree; 

public ColoredTree sample = Red(Black(Leaf(1), Red(Leaf(2), Leaf(3))), Black(Leaf(4), Leaf(5)));

test bool testElements() = 9 == elements(sample);

test bool testTotal() = 15 == sumTree(sample);


test bool testRedNodes() = 2 == redNodes(sample);

test bool testAllRedToGreen() = 0 == redNodes(allRedToGreen(sample)) 
                             && 2 == greenNodes(allRedToGreen(sample));