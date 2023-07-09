import 'package:flutter/material.dart';

import '../../support/utils/cache_manager.dart';
import 'settings_view_controller.dart';
import 'settings_view_model.dart';

class SettingsFactory {
  static const String route = '/settings';

  static StatefulWidget settings() {
    final sharedPreferences = CacheManager.instance;
    final viewModel = SettingsViewModel(sharedPreferences: sharedPreferences);

    return SettingsViewController(viewModel: viewModel);
  }
}
