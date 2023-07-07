import 'package:flutter/material.dart';

import 'menu_view_controller.dart';
import 'menu_view_model.dart';

class MenuFactory {
  static const String route = '/menu';
  static StatefulWidget menu() {
    final viewModel = MenuViewModel();

    return MenuViewController(viewModel: viewModel);
  }
}
