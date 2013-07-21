import 'dart:html';
import 'package:okeyee/okeyee.dart';

void bindStuff() {
  
  Keyboard k = new Keyboard();
  
  k.register("ctrl+shift+a", (event) => window.alert("Ctrl + Shift + A"));
  
  document.onKeyUp.listen(k.press);
}