package main

object Stringdemo {
  def main(args: Array[String]) {
    doit
  }
  
  def doit: Unit = {
    // 普通の文字列
    println("hogeほげ")
    // 生文字リテラル
    println("""
c:¥hoge
d:¥piyo
""")

	//シンボル
    println('symbol)
    
    var list = Array(1,2,3,4,5)
    print(list.max)
    
  }
  
}
