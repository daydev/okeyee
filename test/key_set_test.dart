import 'package:unittest/unittest.dart';
import 'package:okeyee/okeyee.dart';

void testKeySet() {
  
  group("KeySet:", () {
    
    test("Identical keysets should be equal both ways", () {
      var setA = new KeySet([Key.A, Key.Shift, Key.Ctrl]);
      var setB = new KeySet([Key.Ctrl, Key.Shift, Key.A]);
      expect(setA == setB, isTrue);    
      expect(setB == setA, isTrue);
    });
    
    test("Keyset should not be equal to its subset and vice versa", () {
      KeySet set = new KeySet([Key.A, Key.Shift, Key.Ctrl]);
      KeySet subset = new KeySet([Key.A, Key.Shift]);
      expect(set == subset, isFalse);
      expect(subset == set, isFalse);
      expect(set != subset, isTrue);
      expect(subset != set, isTrue);
    });
    
    test("Identical keysets created from key list and string combination should be equal", () {
      KeySet setA = new KeySet([Key.Shift, Key.Alt, Key.A]);
      KeySet setB = new KeySet.parse("alt+shift+a");
      expect(setA == setB, isTrue);
      expect(setB == setA, isTrue);
    });
    
    test("Hash codes of identical keysets should be equal", () {
      KeySet setA = new KeySet([Key.Shift, Key.Alt, Key.A]);
      KeySet setB = new KeySet.parse("alt+shift+a");
      expect(setA.hashCode == setB.hashCode, isTrue);

    });
    
    test("Hash codes of different keysets should not be equal", () {
      KeySet setA = new KeySet([Key.Shift, Key.Alt, Key.A]);
      KeySet setB = new KeySet.parse("alt+shift+k");
      expect(setA.hashCode != setB.hashCode, isTrue);
    });
    
  });
}