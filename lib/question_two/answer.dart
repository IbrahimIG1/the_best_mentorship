class UserModel {
  String _name;
  int _age;
  String _email;

  UserModel(this._name, this._age, this._email);

  // Encapsulation with validation
  String get name => _name;
  int get age => _age;
  String get email => _email;

  void updateUser(String name, int age, String email) {
    if (age < 0) throw ArgumentError("Age cannot be negative");
    _name = name;
    _age = age;
    _email = email;
  }
}

// Single Responsibility Principle
class FirestoreService {
  void saveUser(UserModel user) {
    print('Saving ${user.name}, ${user.age}, ${user.email} to Firestore');
  }
}
