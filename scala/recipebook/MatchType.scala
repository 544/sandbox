object MatchType {

  def main(args: Array[String]):Unit = {
    def len =  getLength("hogehoge");
    println(len);
  }

  def getLength(value:AnyRef):Int = {
    value match {
      case x:String => x.length
      case x:Array[_] => x.length
      case x:Iterable[_] => x.size
      case _ => throw new IllegalArgumentException
    }
  }

}
