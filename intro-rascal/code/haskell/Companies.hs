module Companies where 

type Name = String
type Salary = Double
type Manager = Employee 

data Company = C Name [Department]
data Department = D Name Manager [Department] [Employee]
data Employee = E Name Salary

cut :: Double -> Company -> Company
cut k (C n depts) = C n (map (cutD k) depts)

cutD :: Double -> Department -> Department
cutD k (D n mgr subdepts emps) = D n (cutE k mgr) (map (cutD k) subdepts) (map (cutE k) emps)

cutE :: Double -> Employee -> Employee
cutE k (E n s) = E n (s - (k * s)) 


total :: Company -> Salary
total (C _ depts) = sum (map totalD depts)


totalD :: Department -> Salary
totalD (D _ mgr subdepts emps) = salary mgr
                               + sum (map totalD subdepts)
			       + sum (map salary emps)

salary :: Employee -> Salary
salary (E _ s) = s

