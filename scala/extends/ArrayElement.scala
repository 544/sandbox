class ArrayElement(conts:Array[String]) extends Element {
	def contents: Array[String] = conts

	override def demo() {
		println ("ArrayElements invoked")
	}
}
