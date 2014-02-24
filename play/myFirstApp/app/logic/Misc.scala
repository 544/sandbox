package logic

object Misc {
  def hello:String = {
   return "hello world"; 
  }


  val fibMemo = new Array[Int](1000);
  // フィボナッチ数列を返す
  // a(0) = 0,a(1) = 1 a(n) = a(n-1) + a(n-2)
  def fib(n:Int):Int = {
    if (n <= 1) return n;
    if (fibMemo(n) != 0) return fibMemo(n);
    fibMemo(n) = fib(n-1) + fib(n-2);
    return fibMemo(n);
  }
}
