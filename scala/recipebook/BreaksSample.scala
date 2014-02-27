import scala.util.control.Breaks

object BreaksSample extends App {
  // break$BMQ$N%*%V%8%'%/%H$r:n@.!#(B
  val mybreaks = new Breaks();
  // $B=$>~L>H4$-$G;H$($k$h$&$K(Bimport
  import mybreaks.{break, breakable}

  // $BNc30$rJdB-$9$k%9%3!<%W(B
  breakable {
    for (i <- 1 to 5) {
      println (i);
      if (i == 3) {
        break; // $BFbItE*$K$O$3$3$GNc30$rEj$2$F$k$@$1(B
      }
    }
  }
}
