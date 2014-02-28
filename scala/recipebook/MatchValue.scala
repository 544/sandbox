
object MatchValue extends App {

  val lang:String = "Perl"

  lang match {
    case "Java" => {
      println("value is Java");
    }
    case "Scala" => {
      println("value is Scala");
    }
    case "Ruby" | "Perl" => {
      println("value is Ruby or Perl");
    }
    case _ => {
      println("value is unknown");
    }
      
  }

}
