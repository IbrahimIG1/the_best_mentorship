class UserModel {
  String name = '';
  int age = 0;
  String email = '';

  void updateUser(String name, int age, String email) {
    this.name = name;
    this.age = age;
    this.email = email;
  }

  void saveToFirestore() {
    print('Saving $name, $age, $email to Firestore');
  }
}
