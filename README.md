[![Build Status](https://drone.io/github.com/daydev/okeyee/status.png)](https://drone.io/github.com/daydev/okeyee/latest)

## Description

This library will allow you to register listeners for (almost) arbitrary key presses and key combinations without need for ugly ifs with magic constants like 
```dart
if (event.keyCode == 13) { //Enter
  //do stuff
}
```

## Usage

Import library (after adding dependency and running `pub install` of course)

```dart
import "package:okeyee/okeyee.dart";
```

Create `Keyboard` object that will store information about registered actions

```dart
var keyboard = new Keyboard();
```
You can create multiple `Keyboard`s and they will be independent.


Register actions. You can pass list of `Key`'s or string combinations (Sublime Text like).
Strings are case insensitive (`"Ctrl+A"` is the same as `"ctrl+a"`)

```dart
keyboard.register([Key.Ctrl, Key.Shift, Key.S], (_) => print("Ctrl + Shift + S"));

keyboard.register("ctrl+alt+d", (_) => print("Alt + Ctrl + D"));
```

Whitespaces in string combinations are not allowed.
You can have multiple modifier keys (Ctrl, Shift, Alt) in your combinations (e.g. `"ctrl+shift+a"`), but only one normal key.
I.e. `"ctrl+k+q"` won't work.

Pass `Keyboard#press` as listener to keyboard event stream

```dart
query("body").onKeyUp.listen(keyboard.press);
```

You can also pass `keyboard` to `onKeyDown` stream, but then you will destroy default browser actions for your keys and combinations.
E.g. F5 will no longer refresh page, Ctrl+A will no longer select all and so on. It may be what you want, but not necessarily. 

You can register multiple actions to the same combination

```dart
keyboard.register("shift+d", (_) => print("Listener one"));
keyboard.register("shift+d", (_) => print("Listener two"));
```

You can unregister actions in a way analogous to registering them

```dart
keyboard.unregister([Key.Ctrl, Key.A]);
//or
keyboard.unregister("ctrl+a");
```
Press keys and watch your actions execute!
