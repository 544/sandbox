/** field sample */
class SimpleClass3 {
  // アクセサを独自実装するため、privateとする。
  private var _id:Int = _; // _ は型のデフォルト値
  
  // getter
  def id:Int = {
    println("call getter!");
    _id;
  }
  // setter
  def id_= (id:Int) = {
    println("call setter!");
    _id = id;
  }
}
