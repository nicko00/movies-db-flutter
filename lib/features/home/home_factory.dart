import 'package:flutter/material.dart';

import 'home_view_controller.dart';
import 'home_view_model.dart';

class HomeFactory {
  static const String route = '/home';
  
  static StatefulWidget home() {
    final viewModel = HomeViewModel();

    return HomeViewController(viewModel: viewModel);
  }
}
