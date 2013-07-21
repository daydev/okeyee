part of okeyee;

/**
 * Storage of mappings of key combinations ([KeySet]s) to actions ([EventListener]s).
 */
class KeyboardActionRegistry {
  
  final Map<KeySet, List<EventListener>> _listeners = new Map<KeySet, List<EventListener>>();
  
  /**
   * Attaches [EventListener] to [KeySet] combination.
   * If listener(s) for this combinations already exist, new listener is attached at the end of existing listener list
   */
  void addListener(KeySet combination, EventListener command) {
    if (_listeners.containsKey(combination)) {
      _listeners[combination].add(command);
    } else {
      _listeners[combination] = [command];
    }
  }
  
  /**
   * Clears listener list for given [KeySet] combination.
   */
  void removeListenerChain(KeySet combination) {
    if (_listeners.containsKey(combination)) {
      _listeners[combination].clear();
    }
  }
  
  /**
   * Executes listeners for given [KeySet] combination if such listeners are registered.
   * Passes given [Event] to each listener. 
   */
  void execute(KeySet combination, Event event) {
    if (_listeners.containsKey(combination)) {
      _listeners[combination].forEach((command) => command(event));
    }
  }
  
  /**
   * Empties registry completely.
   */
  void clear() {
    _listeners.clear();
  }
  
}