module analysis::ThreadSafeCollections
import IO;
import io::IOUtil;
import ParseTree; 
import \syntax::Java18;

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

public void analyse(CompilationUnit unit) {
  top-down visit(unit) {
  	case (Expression)`new ConcurrentHashMap()`: record("ConcurrentHashMap");
  	case (Expression)`new ArrayList()`: record("ConcurrentHashMap");
  	
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

