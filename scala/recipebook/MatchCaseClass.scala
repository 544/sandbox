// caseクラスなるものがよくわからない・・・。
// case class
case class Employee(empId:Int, name:String);

def MatchCaseClass(emp:Employee) = 
  emp match {
    case Employee(_,"Naoki") => {
      println("is Naoki");
    }
    case Employee(1,_) => {
      println("id is 1");
    }
    case Employee(empId, name) => {
      println("empId:" + empId + " name:" + name);
    }
  }
