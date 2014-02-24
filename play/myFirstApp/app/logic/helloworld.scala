package logic

// Base的なものを継承したい。
class HelloWorld {
  val message = "Hello!! ";

  def helloworld(value:String):String = {
    return message + value;
  }
}
