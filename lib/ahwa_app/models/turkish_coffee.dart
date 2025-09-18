// OOP: Inheritance — concrete drink specializing the Drink abstraction.
import 'drink.dart';

class TurkishCoffee extends Drink {
  @override
  String get name => 'Turkish Coffee';

  @override
  double get price => 10.0;
}
