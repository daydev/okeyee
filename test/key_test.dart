import 'package:unittest/unittest.dart';
import 'package:okeyee/okeyee.dart';

void testKey() {
  
  group("Key:", (){
    
    test("Key should be created from key code", () {
      expect(Key.valueOf(74), same(Key.J));
      expect(Key.valueOf(16), same(Key.Shift));
      expect(Key.valueOf(53), same(Key.Five));
      expect(Key.valueOf(122), same(Key.F11));
      expect(Key.valueOf(9), same(Key.Tab));
    });
    
    test("Key should be created from name", () {
      expect(Key.forName("j"), same(Key.J));
      expect(Key.forName("shift"), same(Key.Shift));
      expect(Key.forName("5"), same(Key.Five));
      expect(Key.forName("f11"), same(Key.F11));
      expect(Key.forName("tab"), same(Key.Tab));
    });
    
    test("Key names should be case insensitive", () {
      expect(Key.forName("J"), same(Key.forName("j")));
      expect(Key.forName("shift"), same(Key.forName("ShiFt")));
      expect(Key.forName("f11"), same(Key.forName("F11")));
      expect(Key.forName("tab"), same(Key.forName("Tab")));
    });
    
    test("Key should parse key combination and return key list", () {
      expect(Key.parseCombination("ctrl+shift+k"), orderedEquals([Key.Ctrl, Key.Shift, Key.K]));
    });
    
    test("Key should return NoKey if unknown keyCode is passed", () {
      expect(Key.valueOf(666), Key.NoKey);
    });
    
    test("Key should throw NoSuchKeyException if unknown key name is passed", () {
      try {
        Key.forName("shfit");
      } on NoSuchKeyException catch (e) {
        expect(e.name, "shfit");
        return;
      }
      throw new Exception("Expected NoSuchKeyException");  
    });
    
  });
  
}