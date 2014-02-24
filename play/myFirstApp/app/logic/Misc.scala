package logic

object Misc {
  def hello:String = {
   return "hello world"; 
  }

  // フィボナッチ数列を返す
  // a(0) = 0,a(1) = 1 a(n) = a(n-1) + a(n-2)
  def fib(n:Int):Int = {
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fib(n-1) + fib(n-2);
  }
}
