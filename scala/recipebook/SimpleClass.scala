class SimpleClass(id:String) {
  // インスタンス化のタイミングで実行される。
  println("create SimpleClass id:" + id)

  // 補助コンストラクタ
  def this() {
    // 先頭で基本コンストラクタを呼び出す必要がある。
    this("dummy");
    println("create by sub contracter")
  }

}
