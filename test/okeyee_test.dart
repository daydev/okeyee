import 'dart:html';
import 'dart:async';
import 'package:unittest/unittest.dart';
import 'key_test.dart';
import 'keyboard_test.dart';
import 'key_set_test.dart';
import 'mock_key_event_test.dart';

void main() {
  
  testKey();
  testKeyboard();
  testKeySet();
  testMockKeyEvent();
  
  pollForDone(testCases);
}

pollForDone(List tests) {
  if (tests.every((t)=> t.isComplete)) {
    window.postMessage('done', window.location.href);
    return;
  }

  var wait = new Duration(milliseconds: 100);
  new Timer(wait, ()=> pollForDone(tests));
}