import 'package:flutter/cupertino.dart';

import '../../features/home/home_factory.dart';

class MobileRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String initialRoute = HomeFactory.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeFactory.route: (_) => HomeFactory.home(),
  };
}
