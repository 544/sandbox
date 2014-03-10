// リストマッチ
object MatchList extends App {

  val target = List(1,2,3);

  target match {
    case List(1,2,3) => {
      println("完全一致");
    }
    case List(_,_) => {
      println("長さが２");
    }
    case _ => {
      println("value is unknown");
    }
  }

}
