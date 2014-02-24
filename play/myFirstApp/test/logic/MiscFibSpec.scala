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
   + a(40) は 832040 ${Misc.fib(40) === 102334155}
  """

}
