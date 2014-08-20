import scala.io.Source
import scala.runtime.ScalaRunTime._

object Sample extends App {
  val lines = Source.fromFile("dat.csv").getLines.toList

  // 各行をカンマで区切った後、タプルにする。要素数が合わないと無視。
  // No, 名前, AP, Goldでデータが入ってる。
  // 一行目はヘッダなので除去する。
  val records = lines.drop(1).collect( _.split(",") match {
      case Array(s1, s2, s3, s4) => (s1.toInt, s2, s3.toInt, s4.toInt)
    });

  // APでグルーピングしてみる。
  val grouped = records.groupBy(n => n._3).values;

  // Gold最大のリストにする。
  // (なんかデータがおかしいのでAP0は弾く) 
  val maxed = grouped.map{ e => e.maxBy(_._4)}.toList.filter(_._3.toInt != 0);

  // Sortする
  val qlist = maxed.sortBy( _._3.toInt);

  //  チェックする基準値は標準入力から受け取る
  val target = if (args.length > 0) args(0).toInt else 9;


  // ボトムアップ型のナップサック問題解法。Gold取得のｓ最適値をだす。
  val solved = new Array[Int](target+1);
  for (ap <- 1 to target) {
    solved(ap) = qlist.map {
      g => if (ap < g._3) 0 else solved(ap - g._3) + g._4
    }.reduceLeft((a:Int,b:Int) => Math.max(a,b))
  };

  // 表示してみる。
  println { solved(target) }

}

Sample.main(args);
