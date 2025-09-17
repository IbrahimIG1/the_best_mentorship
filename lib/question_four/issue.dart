abstract class WidgetController {
  void initState();
  void dispose();
  void handleAnimation();
  void handleNetwork();
}

class SimpleButtonController implements WidgetController {
  @override
  void initState() => print('Init button');

  @override
  void dispose() => print('Dispose button');
  // any function override and not used this is break Interface Segregation Principle
  //* Not Used
  @override
  void handleAnimation() =>
      throw UnimplementedError('No animation in simple button');

  //* Not Used
  @override
  void handleNetwork() =>
      throw UnimplementedError('No network in button');
}
