part of okeyee;

/**
 * Entry point from which action binding, unbinding and execution should be performed 
 */
class Keyboard {
  
  final KeyboardActionRegistry _registry = new KeyboardActionRegistry();
  
  /**
   * Binds given [EventListener] action to given combination.
   * 
   * Combination can be [List] of [Key]s or string like "ctrl+shift+d".
   * 
   *     Keyboard k = new Keyboard();
   *     k.register([Key.A], (event) => print("A pressed!"));
   *     k.register("ctrl+b", (event) => print("Ctrl+B pressed!"));
   */
  void register(var combination, EventListener command) {
    if (combination is List<Key>) {
      _registry.addListener(new KeySet(combination), command);
    } else if (combination is String) {
      _registry.addListener(new KeySet.parse(combination), command);
    } else {
      throw new IllegalArgumentException("Don't know how to process combination of type ${combination.runtimeType}");
    }
  }  
  
  /**
   * Unbinds any actions bound to given combination 
   * 
   * Combination can be [List] of [Key]s or string like "ctrl+shift+d". See [register].
   */
  void unregister(var combination) {
    if (combination is List<Key>) {
      _registry.removeListenerChain(new KeySet(combination));
    } else if (combination is String) {
      _registry.removeListenerChain(new KeySet.parse(combination));
    } else {
      throw new IllegalArgumentException("Don't know how to process combination of type ${combination.runtimeType}");
    }
  }  
  
  /**
   * Clears all bindings and resets [Keyboard] to clear state.
   */
  void reset() {
    _registry.clear();
  }
  
  /**
   * Executes action(s) (if any) bound to key combination that given [event] represents
   * 
   * This method can be passed to key event stream as listener or invoked manually with [MockKeyEvent]
   * 
   *     ... //Init Keyboard and register some actions
   *     document.onKeyUp.listen(k.press); //Pass to stream to listen for events
   *     k.press(new MockKeyEvent(...); //Invoke manully with desired combination
   */
  void press(KeyboardEvent event) {
    List<Key> combination = [Key.valueOf(event.keyCode)];
    if (event.altKey) {
      combination.add(Key.Alt);
    }
    if (event.ctrlKey) {
      combination.add(Key.Ctrl);
    }
    if (event.shiftKey) {
      combination.add(Key.Shift);
    }
    _registry.execute(new KeySet(combination), event);
  }
  
 }