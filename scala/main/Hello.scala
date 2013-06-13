package main


object Hello {
  def main(args: Array[String]) {
    print("hello")

    val list = Array("hoge", "piyo", "fuga")
    val list2 = list.map(x => "[" + x + "]")
    print(list2.mkString)
  }

}