package controllers

import play.api._;
import play.api.mvc._;

object Foo extends Controller {

  def index = Action {
    Ok(views.html.foo("変数"));
  }
}
