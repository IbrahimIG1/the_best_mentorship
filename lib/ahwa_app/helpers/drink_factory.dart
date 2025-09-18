// OOP: Single Responsibility — central place to create drink instances by name.
import 'package:omar_ahmed_mentor_ship/ahwa_app/models/shai.dart';
import '../models/drink.dart';
import '../models/turkish_coffee.dart';
import '../models/hibiscus_tea.dart';

class DrinkFactory {
  static final Map<String, Drink Function()> _map = {
    'Shai': () => Shai(),
    'Turkish Coffee': () => TurkishCoffee(),
    'Hibiscus Tea': () => HibiscusTea(),
  };

  static List<String> availableNames() => _map.keys.toList();

  static Drink create(String name) {
    final ctor = _map[name];
    if (ctor == null) throw ArgumentError('Unknown drink: $name');
    return ctor();
  }
}
