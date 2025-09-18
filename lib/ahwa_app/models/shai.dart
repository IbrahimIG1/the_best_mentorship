// OOP: Inheritance — concrete drink specializing the Drink abstraction.
import 'drink.dart';

class Shai extends Drink {
  @override
  String get name => 'Shai';

  @override
  double get price => 5.0;
}
