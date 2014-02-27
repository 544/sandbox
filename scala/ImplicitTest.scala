package other
import java.util.{Date,Calendar}
// ↓をimportしないと警告になった。
import scala.language.implicitConversions

// 変換用メソッドを定義するシングルトン
object Implicitonverters {
  implicit def date2calendar(date:Date):Calendar = {
    val cal = Calendar.getInstance()
    cal.setTime(date)
    cal
  }
}

import other.Implicitonverters._

object Hoge extends App {
    val cal:Calendar = new Date();
}

