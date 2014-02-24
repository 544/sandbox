import org.specs2._
import specification._
import logic._;

class MiscFibSpec extends script.Specification with Grouped {
  def is = s2"""
  test for Misc.fib
   + a(0)  は 0      ${Misc.fib(0) === 0}
   + a(1)  は 1      ${Misc.fib(1) === 1}
   + a(2)  は 1      ${Misc.fib(2) === 1}
   + a(3)  は 2      ${Misc.fib(3) === 2}
   + a(4)  は 3      ${Misc.fib(4) === 3}
   + a(10) は 55     ${Misc.fib(10) === 55}
   + a(30) は 832040 ${Misc.fib(30) === 832040}
  """

}
