import 'package:flutter/cupertino.dart';

import '../../features/home/home/home_view_controller.dart';
import '../../features/home/home_factory.dart';

class MobileRouter {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String initialRoute = HomeViewController.route;

  static final Map<String, WidgetBuilder> routes = {
    HomeViewController.route: (_) => HomeFactory.home(),
  };
}
