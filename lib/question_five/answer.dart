abstract class BasicController {
  void initState();
  void dispose();
}

abstract class AnimationController {
  void handleAnimation();
}

abstract class NetworkController {
  void handleNetwork();
}

// Simple button only depends on what it needs and not need animation or netwrok features
class SimpleButtonController implements BasicController {
  @override
  void initState() => print('Init button');

  @override
  void dispose() => print('Dispose button');
}

// Another widget that needs animation take the two class feature beacuse it used all of it
class AnimatedWidgetController implements BasicController, AnimationController {
  @override
  void initState() => print('Init animated widget');

  @override
  void dispose() => print('Dispose animated widget');

  @override
  void handleAnimation() => print('Handle animation logic');
}
