part of okeyee;

class Keyboard {
  
  final KeyboardActionRegistry _registry = new KeyboardActionRegistry();
  
  void register(List<Key> combination, EventListener command) {
    _registry.addListener(combination.toSet(), command);
  }
  
  void registerString(String combination, EventListener command) {
    _registry.addListener(Key.parseCombination(combination).toSet(), command);
  }
  
  void unregister(List<Key> combination) {
    _registry.removeListenerChain(combination.toSet());
  }
  
  void unregisterString(String combination) {
    _registry.removeListenerChain(Key.parseCombination(combination).toSet());
  }
  
  void press(KeyboardEvent event) {
    List<Key> combination = [Key.valueOf(event.keyCode)];
    if (event.altKey) {
      combination.add(Key.Alt);
    }
    if (event.ctrlKey) {
      combination.add(Key.Control);
    }
    if (event.shiftKey) {
      combination.add(Key.Shift);
    }
    _execute(combination.toSet(), event);
  }
  
  void _execute(Set<Key> combination, KeyboardEvent event) {
    if (_registry.containsListenerChain(combination)) {
      event.preventDefault();
      _registry.getListenerChain(combination).forEach((c) => c(event));
    }
  }
  
 }