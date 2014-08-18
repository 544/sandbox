import scala.io.Source
import scala.runtime.ScalaRunTime._

object Sample extends App {
  val lines = Source.fromFile("dat.csv").getLines.toList

  // 各行をカンマで区切った後、タプルにする。要素数が合わないと無視。
  val coords = lines.collect(_.split(",") match {
      case Array(s1, s2, s3, s4) => (s1, s2, s3, s4)
    });

  //println (stringOf(coords) )

  coords foreach { t => println(t._2) } ;

  //val splited = lines.flatMap{ line => line.split(",|\n") };
  //splited foreach println
}

Sample.main(args);
