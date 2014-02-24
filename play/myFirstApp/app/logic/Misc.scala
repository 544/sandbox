package logic

object Misc {
  def hello:String = {
   return "hello world"; 
  }


  val fibMemo = new Array[Int](1000);
  // $B%U%#%\%J%C%A?tNs$rJV$9(B
  // a(0) = 0,a(1) = 1 a(n) = a(n-1) + a(n-2)
  def fib(n:Int):Int = {
    if (n <= 1) return n;
    if (fibMemo(n) != 0) return fibMemo(n);
    fibMemo(n) = fib(n-1) + fib(n-2);
    return fibMemo(n);
  }

  // $BItJ,OBLdBj(B
  /** 
   * $BItJ,OBLdBj(B
   * n$B8D$NJQ?t(B a(1),a(2),...a(n)$B$,M?$($i$l$?;~!"$=$NCf$+$i4v$D$+A*$S!"(B
   * $B$=$NOB$r$A$g$&$I(Bk$B$K$9$k$3$H$,$G$-$k$+$I$&$+H=Dj$9$k!#(B
  */

}
