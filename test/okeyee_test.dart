import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';
import 'package:okeyee/okeyee.dart';
import 'MockKeyEvent.dart';
import 'dart:html';

void main() {
  useHtmlConfiguration(); 
  
  Keyboard keyboard;
  
  group("Keyboard actions", () {
    setUp(() {
      keyboard = new Keyboard();
    });
    
    test("Registered callback should be called when key is pressed", () {
      keyboard.register([Key.A], expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
      }));
      keyboard.press(new MockKeyEvent(Key.A));
    });
    
    test("Composite callback should be called when key combination is pressed", () {
      keyboard.register([Key.A, Key.Shift, Key.Control], expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Composite callback registered as string should be called", () {
      keyboard.registerString("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Multiple callbacks for one combination should all be called", () {
      keyboard.registerString("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.registerString("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Callback should not be called on wrong combination", () {
      keyboard.registerString("ctrl+shift+a", expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.press(new MockKeyEvent(Key.A, "as"));
    });
    
    test("String combinations should be case insensitive", () {
      keyboard.registerString("Ctrl+Shift+A", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Registering callback with invalid combination string should throw an exceptions", () {
      try {
        keyboard.registerString("shfit+ctrl+k", null);
      } on NoSuchKeyException catch (e) {
        expect(e.name, "shfit");
        return;
      }
      throw new Exception("Expected NoSuchKeyException");  
    });
    
    test("Unregistered callback should not be called", () {
      keyboard.register([Key.A], expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.unregister([Key.A]);
      keyboard.press(new MockKeyEvent(Key.A));
    });
    
    test("Callback unregistered with string should not be called", () {
      keyboard.register([Key.A, Key.Shift], expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.unregisterString("shift+a");
      keyboard.press(new MockKeyEvent(Key.A, "s"));
    });
    
    Keyboard k = new Keyboard();
    
    query("body").onKeyUp.listen(k.press);
    
    k.registerString("ctrl+a", (e) => print("Ctrl + A"));
    
  });
}

