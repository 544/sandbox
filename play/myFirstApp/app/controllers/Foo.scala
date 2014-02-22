package controllers

import play.api._;
import play.api.mvc._;

object Foo extends Controller {

  def index = Action {
    Ok(views.html.foo("変数"));
  }

  def add = Action {
    req => {
      val num1 = req.body.asFormUrlEncoded.get("num1")(0).toInt;
      val num2 = req.body.asFormUrlEncoded.get("num2")(0).toInt;
      Ok( views.html.add( num1 + num2 ) );
    }
  }
}
