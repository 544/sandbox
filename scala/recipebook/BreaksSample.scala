import scala.util.control.Breaks

object BreaksSample extends App {
  // break用のオブジェクトを作成。
  val mybreaks = new Breaks();
  // 修飾名抜きで使えるようにimport
  import mybreaks.{break, breakable}

  // 例外を補足するスコープ
  breakable {
    for (i <- 1 to 5) {
      println (i);
      if (i == 3) {
        break; // 内部的にはここで例外を投げてるだけ
      }
    }
  }
}
