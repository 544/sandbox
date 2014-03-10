// 再帰で遊んでみる。
object MatchList2 {

  def main(args: Array[String]):Unit = {
    printElements(List(3,1,4));
  }

  def printElements(list:List[Int]):Unit = {
    list match {
      case x::xs => {
        println(x); // リストの先頭を出力
        printElements(xs); // 先頭以降を再帰呼び出し
      }
      case Nil => {
        // リストが空なら何もしない。
      }
    }
  }
}
