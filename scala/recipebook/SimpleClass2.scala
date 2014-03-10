class SimpleClass2 {

  def sayHello(name:String):Unit = {
    println("hello, " + name + "!!");
  }

  // 引数が異なればオーバーロード可能
  def sayHello(times:Int):Unit = {
    println("hello," * times);
  }
  def sayHello(name:String, times:Int):Unit = {
    println(( "hello," * times ) + " " + name + "!!");
  }

  // 戻り値が異なるメソッドは定義できない。
  /* 以下はコンパイルエラーになる。
  def sayHello(times:Int):String = {
    "hello" * times;
  }
  */
  
  // 引数にデフォルト値を定義
  def sayBye(name:String, times:Int = 3):Unit =  {
    println( ("Bye,"*times) + " " + name + "!!" );
  }

  // 暗黙の引数を定義
  def greet(implicit name:String):Unit = {
    println( "Hi! " + name );
  }
}
