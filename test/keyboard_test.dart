import 'package:unittest/unittest.dart';
import 'package:okeyee/okeyee.dart';

void testKeyboard() {
  
  Keyboard keyboard;
  
  group("Keyboard:", () {
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
      keyboard.register([Key.A, Key.Shift, Key.Ctrl], expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Composite callback registered as string should be called", () {
      keyboard.register("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Multiple callbacks for one combination should all be called", () {
      keyboard.register("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.register("ctrl+shift+a", expectAsync1((event) {
        expect(event.keyCode, Key.A.code);
        expect(event.shiftKey, true);
        expect(event.ctrlKey, true);
      }));
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
    });
    
    test("Callback should not be called on wrong combination", () {
      keyboard.register("ctrl+shift+a", expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.press(new MockKeyEvent(Key.A, "as"));
    });
    
    test("Unregistered callback should not be called", () {
      keyboard.register([Key.A], expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.unregister("a");
      keyboard.press(new MockKeyEvent(Key.A));
    });
    
    test("Callback unregistered as string should not be called", () {
      keyboard.register([Key.A, Key.Shift], expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.unregister("shift+a");
      keyboard.press(new MockKeyEvent(Key.A, "s"));
    });
    
    test("Keyboard should throw IllegalArgumentException when invalid object type is passed as combination", () {
      try {
        keyboard.register(5, (event) {}); 
      } on IllegalArgumentException catch (e) {
        return;
      }
      throw new Exception("Expected Illegal Argument Exception!");
    });
    
    test("Keyboard reset should clear all callbacks", () {
      keyboard.register("ctrl+shift+a", expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.register("ctrl+b", expectAsync1((event) {
        expect(false, "Should not be called!");
      }, count: 0));
      keyboard.reset();
      keyboard.press(new MockKeyEvent(Key.A, "sc"));
      keyboard.press(new MockKeyEvent(Key.B, "c"));
    });
    
  });
  
}