object ForSample extends App {

  // 基本
  println("==========");
  for (i <- 1 to 5) {
    println(i); 
  }

  // step指定
  println("==========");
  for (i <- 1 to (10,2)) {
    println(i);
  }

  // コレクションで回す
  println("==========");
  val range = Range(1,5);
  for (i <- range) {
    println(i);
  }

  // 条件指定
  println("==========");
  val names = List("Taro", "Taneka", "Hoge", "PIYO");
  for (name <- names if name.startsWith("T")) {
    println(name);
  }

  // 値を返すfor
  println("==========");
  val result = for (name <- names if name.startsWith("T")) yield name;
  println(result);
  
  // ネスト
  println("==========");
  for ( x <- 1 to 2; y <- 1 to 3) {
    println("x:%d, y:%d".format(x,y));
  }

}
