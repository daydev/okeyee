part of okeyee;

class KeyboardActionRegistry {
  
  final Map<Set<Key>, List<EventListener>> _listeners = new Map<Set<Key>, List<EventListener>>();
  
  void addListener(Set<Key> combination, EventListener command) {
    if (containsListenerChain(combination)) {
      getListenerChain(combination).add(command);
    } else {
      _listeners[combination] = [command];
    }
  }
  
  void removeListenerChain(Set<Key> combination) {
    if (containsListenerChain(combination)) {
      getListenerChain(combination).clear();
    }
  }
  
  void clear() {
    _listeners.clear();
  }
  
  bool containsListenerChain(Set<Key> combination) {
    return _listeners.keys.any((c) => c.containsAll(combination) && combination.containsAll(c));
  }
  
  List<EventListener> getListenerChain(Set<Key> combination) {
    List<EventListener> chain = [];
    _listeners.forEach((key, value) {
      if (key.containsAll(combination) && combination.containsAll(key)) {
        chain = value;
      }
    });
    return chain;
  }
  
}