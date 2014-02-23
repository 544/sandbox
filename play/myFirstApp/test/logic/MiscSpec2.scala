import org.specs2._
import specification._
import logic._;

class MiscSpec2 extends script.Specification with Grouped {
  def is = s2"""
  test for Misc.hello
   + Misc.hello は 'hello' 文字列を返す。
  test for Misc.fib
   + a(0)  は 0
   + a(1)  は 1
   + a(2)  は 1
   + a(3)  は 2
   + a(4)  は 3
   + a(10) は 55
   + a(30) は 832040
  """

  "test for Misc.hello" - new group {
    eg := Misc.hello mustEqual "hello";
  }

  "test for Misc.fib" - new g1 {
    e2 := 1 mustEqual 2;
  }

//    "test for Misc.hello" ^
//    "Misc.hello は 'hello' 文字列を返す。" !hello^
//    p^
//    "test for Misc.fib ( フィボナッチ数：a(n) = a(n-1) + a(n-2) )" ^
//    "a(0) は 0" !fib(0)^
//    "a(1) は 1" ^
//    "a(2) は 1" ^
//    "a(3) は 2" ^
//    "a(4) は 3" ^
//    "a(10) は 55" ^
//    "a(30) は 832040" ^

  def hello = {
    Misc.hello mustEqual "hello";
  }

  //def fib(value:Int) = {
  //  Misc.fib(0) mustEqual 0;
  //}

}
