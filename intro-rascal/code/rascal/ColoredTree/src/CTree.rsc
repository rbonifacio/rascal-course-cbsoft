module CTree

import List;

data ColoredTree = Leaf(int val)
                 | Black(ColoredTree left, ColoredTree right) 
                 | Red(ColoredTree left, ColoredTree right)
                 ;
 
int elements(ColoredTree tree) {
  switch(tree) {
  	case Leaf(n) : return 1; 
  	case Black(l, r): return 1 + elements(l) + elements(r);
  	case Red(l, r) : return 1 + elements(l) + elements(r);
  }
}             
    
int sumTree(ColoredTree tree) {
  int total = 0; 
  top-down visit(tree) {
  	case Leaf(n) : total += n;  
  }
  return total;
}

data ColoredTree = Green(ColoredTree left, ColoredTree right);
