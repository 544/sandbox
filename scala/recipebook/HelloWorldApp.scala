object HelloWorldApp extends App {
  val name:String = if (args.length > 0) args(0) else "World";
  println ("Hello %s".format(name))
}

HelloWorldApp.main(args)
