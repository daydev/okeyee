import 'package:unittest/unittest.dart';
import 'package:okeyee/okeyee.dart';

testMockKeyEvent() {

  group("MockKeyEvent: ", () {
    
    test("Modifiers should be properly extracted from one-letter codes", () {
      var m = new MockKeyEvent(Key.A, "");
      expect(m.altKey, isFalse);
      expect(m.ctrlKey, isFalse);
      expect(m.shiftKey, isFalse);
      m = new MockKeyEvent(Key.B, "acs");
      expect(m.altKey, isTrue);
      expect(m.ctrlKey, isTrue);
      expect(m.shiftKey, isTrue);
    });
    
  });
  
}