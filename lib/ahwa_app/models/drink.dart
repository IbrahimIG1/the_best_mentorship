// OOP: Abstraction & OCP — defines a stable drink contract.
abstract class Drink {
  String get name;
  double get price;

  @override
  String toString() => name;
}
