module br::unb::cic::syb::DataModel

alias Name    = str;
alias Salary  = real; 
alias Manager = Employee; 

data Company = company(Name n, list[Department] deps); 
data Department = department(Name name, Manager mgr, list[Department] subdeps, list[Employee] emps); 
data Employee = employee(Name name, Salary salary); 

