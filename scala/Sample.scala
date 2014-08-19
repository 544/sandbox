import scala.io.Source
import scala.runtime.ScalaRunTime._

object Sample extends App {
  val lines = Source.fromFile("dat.csv").getLines.toList

  // 各行をカンマで区切った後、タプルにする。要素数が合わないと無視。
  // No, 名前, AP, Goldでデータが入ってる。
  val records = lines.collect( _.split(",") match {
      case Array(s1, s2, s3, s4) => (s1, s2, s3, s4)
    });

  // ヘッダを除去する。
  val quests = if (records.length > 0) records.drop(1) else records;
  
  // APでグルーピングしてみる。
  val grouped = quests.groupBy(n => n._3).values;

  // Gold最大のリストにする。
  // (なんかデータがおかしいのでAP0は弾く) 
  val maxed = grouped.map{ e => e.maxBy(_._4)}.toList.filter(_._3.toInt != 0);

  // Sortする
  val hoge = maxed.sortBy( _._3.toInt);


  // 表示してみる。
  //hoge foreach { t => println(t._3) } ;
  hoge foreach { println }

}

Sample.main(args);
