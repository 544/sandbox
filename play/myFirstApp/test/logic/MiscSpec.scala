import org.specs2._
import specification._
import logic._;

// call this for ...
// # test-only MiscSpec
// at play
class MiscSpec extends script.Specification with Grouped {
  def is = s2"""
  test for Misc.hello
   + Misc.hello は 11 文字列長を返す。
   + Misc.hello は 'hello world' 文字列を返す。
  """

  "test for Misc.hello" - new group {
    eg := Misc.hello must have size(11);
    eg := Misc.hello mustEqual "hello world";
  }

}
