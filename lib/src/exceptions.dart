part of okeyee;

class IllegalArgumentException implements Exception {
  final String message;
  
  const IllegalArgumentException(this.message);
  
  String toString() => message;
  
}

class NoSuchKeyException implements Exception {  
  final String name;
  
  const NoSuchKeyException(this.name);
  
  String toString() => "No such key: [$name]";
  
}