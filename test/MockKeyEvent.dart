import 'package:okeyee/okeyee.dart';
import 'dart:html';

class MockKeyEvent implements KeyEvent {
  int keyCode;
  bool _alt;
  bool _ctrl;
  bool _shift;
  
  MockKeyEvent(Key key, [String modifiers = ""]) {
    this.keyCode = key.code;
    this._alt = modifiers.contains('a');
    this._ctrl = modifiers.contains('c');
    this._shift = modifiers.contains('s');
  }
  
  bool get altKey => _alt;
  
  bool get shiftKey => _shift;
  
  bool get ctrlKey => _ctrl;
  
  void preventDefault() { }
  
}