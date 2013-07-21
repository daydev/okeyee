part of okeyee;

/**
 * Simple stub of [KeyEvent] to allow manual triggering of [Keyboard] actions.
 * Mocks only parts required by the [Keyboard] and nothing more.
 * 
 * Main key is provided as [Key] object as first argument of the constructor.
 * Modifier keys are provided as optional second argument of the constructor
 * as a string of one-letter codes. Alt = "a"; Ctrl = "c"; Shift = "s";
 * Ctrl + Shift = "cs" (or "sc", order does not matter) and so on. 
 * 
 *     Keyboard k = new Keyboard();
 *     k.register("esc", (e) {});
 *     k.register("ctrl+alt+delete", (e) {});
 *     k.press(new MockKeyEvent(Key.Esc); //invokes first action
 *     k.press(new MockKeyEvent(Key.Delete, "ac"); //invokes second action
 */
class MockKeyEvent implements KeyEvent {
  final int keyCode;
  final bool altKey;
  final bool ctrlKey;
  final bool shiftKey;
  
  MockKeyEvent(Key key, [String modifiers = ""])
      : keyCode = key.code,
        altKey = modifiers.contains('a'),
        ctrlKey = modifiers.contains('c'),
        shiftKey = modifiers.contains('s');
  
  void preventDefault() { }
  
}