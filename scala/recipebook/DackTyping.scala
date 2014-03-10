
trait Base1 {
  def greet:String = "greet by base1";
  def hello:String;
}

trait Base2 {
  def greet:String = "greet by base2";
  def goodby:String;
}

object Class1 extends Base1 {
  override def hello = "hello";
}

object Class2 extends Base2 {
  override def goodby = "goodby";
}

class DackTyping {
  type Callable = {
    def greet:String;
  }
  def hi(callable:Callable) = {
    println(callable.greet);
  }
}
