part of okeyee;

/**
 * Represents key combination, basically wrapper around [Set] of [Key]s
 * 
 * This class is only required because Dart does not support deep equality of collections, even [Set]s.
 * So if
 *     var a = [1, 2, 3].toSet();
 *     var b = [1, 2, 3].toSet();     
 * a == b is false. Hashcodes have similar story.
 * So [Set]s are not fit for be [Map] keys. 
 * That's why this wrapper is needed.   
 */
class KeySet {
  
  final Set<Key> _keys;
  
  KeySet(Iterable<Key> keys): this._keys = keys.toSet();

  KeySet.parse(String combination): _keys = Key.parseCombination(combination).toSet();
  
  bool operator ==(KeySet that) {
    return that is KeySet && this._keys.containsAll(that._keys) && that._keys.containsAll(this._keys); 
  }
  
  int get hashCode => _keys.fold(0, (p, c) => p + c.hashCode);
  
  String toString() => _keys.toString();
  
}