// OOP: Inheritance — concrete drink specializing the Drink abstraction.
import 'drink.dart';

class HibiscusTea extends Drink {
  @override
  String get name => 'Hibiscus Tea';

  @override
  double get price => 6.0;
}
