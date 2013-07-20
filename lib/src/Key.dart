part of okeyee;

class Key {
  final int code;  
  final String name;
  const Key._(int this.code, String this.name);
  
  static Key valueOf(int keyCode) => values.firstWhere((key) => key.code == keyCode, orElse: () => NoKey);
  
  static Key forName(String name) => values.firstWhere((key) => key.name == name, orElse: () => throw new NoSuchKeyException(name));
  
  static List<Key> parseCombination(String combination) => combination.split("+").map((name) => Key.forName(name.toLowerCase())).toList();
  
  String toString() => "<$name:$code>";
  
  //Modifiers
  static const Alt = const Key._(18, "alt");
  static const Control = const Key._(17, "ctrl");
  static const Shift = const Key._(16, "shift");  

  //Letters
  static const A = const Key._(65, "a");
  static const B = const Key._(66, "b");
  static const C = const Key._(67, "c");
  static const D = const Key._(68, "d");
  static const E = const Key._(69, "e");
  static const F = const Key._(70, "f");
  static const G = const Key._(71, "g");
  static const H = const Key._(72, "h");
  static const I = const Key._(73, "i");
  static const J = const Key._(74, "j");
  static const K = const Key._(75, "k");
  static const L = const Key._(76, "l");
  static const M = const Key._(77, "m");
  static const N = const Key._(78, "n");
  static const O = const Key._(79, "o");
  static const P = const Key._(80, "p");
  static const Q = const Key._(81, "q");
  static const R = const Key._(82, "r");
  static const S = const Key._(83, "s");
  static const T = const Key._(84, "t");
  static const U = const Key._(85, "u");
  static const V = const Key._(86, "v");
  static const W = const Key._(87, "w");
  static const X = const Key._(88, "x");
  static const Y = const Key._(89, "y");
  static const Z = const Key._(90, "z");
  
  //Numbers
  static const Zero = const Key._(48, "0");
  static const One = const Key._(49, "1");
  static const Two = const Key._(50, "2");
  static const Three = const Key._(51, "3");
  static const Four = const Key._(52, "4");
  static const Five = const Key._(53, "5");
  static const Six = const Key._(54, "6");
  static const Seven = const Key._(55, "7");
  static const Eight = const Key._(56, "8");
  static const Nine = const Key._(57, "9");
  
  //Navigation
  static const Left = const Key._(37, "left");
  static const Right = const Key._(39, "right");
  static const Up = const Key._(38, "up");
  static const Down = const Key._(40, "down");  
  static const PageUp = const Key._(33, "pageup");
  static const PageDown = const Key._(34, "pagedown");
  static const End = const Key._(35, "end");
  static const Home = const Key._(36, "home");
  
  //F
  static const F1 = const Key._(112, "f1");
  static const F2 = const Key._(113, "f2");
  static const F3 = const Key._(114, "f3");
  static const F4 = const Key._(115, "f4");
  static const F5 = const Key._(116, "f5");
  static const F6 = const Key._(117, "f6");
  static const F7 = const Key._(118, "f7");
  static const F8 = const Key._(119, "f8");
  static const F9 = const Key._(120, "f9");
  static const F10 = const Key._(121, "f10");
  static const F11 = const Key._(122, "f11");
  static const F12 = const Key._(123, "f12");
  
  //Numpad
  static const NumZero = const Key._(96, "num0");
  static const NumOne = const Key._(97, "num1");
  static const NumTwo = const Key._(98, "num2");
  static const NumThree = const Key._(99, "num3");
  static const NumFour = const Key._(100, "num4");
  static const NumFive = const Key._(101, "num5");
  static const NumSix = const Key._(102, "num6");
  static const NumSeven = const Key._(103, "num7");
  static const NumEight = const Key._(104, "num8");
  static const NumNine = const Key._(105, "num9");
  static const NumPlus = const Key._(107, "num_plus");
  static const NumMinus = const Key._(109, "num_minus");
  static const NumDiv = const Key._(111, "num_div");
  static const NumMult = const Key._(106, "num_mult");
  
  //Misc
  static const Space = const Key._(32, "space");
  static const Esc = const Key._(27, "esc");
  static const Enter = const Key._(13, "enter");
  static const Backspace = const Key._(8, "backspace");
  static const Insert = const Key._(45, "insert");
  static const Delete = const Key._(46, "delete");
  static const Tab = const Key._(9, "tab");
  static const CapsLock = const Key._(20, "capslock");
  static const ScrLock = const Key._(145, "scrlock");
  static const NumLock = const Key._(144, "numlock");
  
  static const NoKey = const Key._(-1, "");

  static final letters = [A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z];
  
  static final numbers = [Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine];
  
  static final navigation = [Left, Right, Up, Down, PageUp, PageDown, Home, End];
  
  static final fkeys = [F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12];
  
  static final numkeys = [NumZero, NumOne, NumTwo, NumThree, NumFour, NumFive, NumSix, NumSeven, NumEight, NumNine,
                          NumPlus, NumMinus, NumDiv, NumMult];
  
  static final misc = [Tab, Space, Esc, Enter, Backspace, Insert, Delete, CapsLock];
  
  static final modifiers = [Alt, Control, Shift];
  
  static final values = []
                         ..addAll(letters)
                         ..addAll(numbers)
                         ..addAll(navigation)
                         ..addAll(fkeys)
                         ..addAll(numkeys)
                         ..addAll(misc)
                         ..addAll(modifiers);
}

class NoSuchKeyException implements Exception {  
  final String name;
  
  const NoSuchKeyException(String this.name);
  
  String toString() => "No such key: [$name]";
  
}
