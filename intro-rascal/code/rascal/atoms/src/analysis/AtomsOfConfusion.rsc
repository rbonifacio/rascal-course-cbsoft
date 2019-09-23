module analysis::AtomsOfConfusion

import IO;
import ParseTree;
import \syntax::Java18;

import io::IOUtil;
map[str, int] atoms = ();

public void execute(loc srcdir) {
  files = findAllFiles(srcdir, "java");
  real errors = 0.0; 
  for(f <- files) {
	try { 
	  CompilationUnit unit = parse(#CompilationUnit, f); 
	  analyse(unit);
	}
	catch e: {
	  errors += 1;
	}
  }
	
  for(k <- atoms) {
	println("<k> : <atoms[k]>"); 
  }
	
  totalFiles = size(files);
  println("Could not parse <errors> files (<errors * 100.0 / totalFiles> %)"); 
}

void analyse(CompilationUnit unit) {
  top-down visit(unit) {
    case (Expression)`<OctaNumeral n>`   : recordAtom("LiteralEncoding"); 
    case (Expression)`<Identifier id>++` : recordAtom("PostIncrement");
    case (Expression)`++<Identifier id>` : recordAtom("PreIncrement"); 
    case (Expression)`<ConditionalOrExpression e> ? <Expression e1> : <ConditionalExpression e>`: recordAtom("ConditionalOperator");
  }
}

void recordAtom(str atom) {
  if(atom in atoms) {
	int count = atoms[atom];
	atoms[atom] = count + 1; 
  }
  else {
	atoms[atom] = 1; 
  }
}

