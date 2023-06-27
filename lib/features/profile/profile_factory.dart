import 'package:flutter/material.dart';

import '../../support/utils/cache_manager.dart';
import '../../support/utils/session_manager.dart';
import 'profile_view_controller.dart';
import 'profile_view_model.dart';

class ProfileFactory {
  static const String route = '/profile';

  static StatefulWidget profile() {
    final sessionManager = SessionManager.instance;
    final sharedPreferences = CacheManager.instance;
    final viewModel = ProfileViewModel(sessionManager: sessionManager, sharedPreferences: sharedPreferences,);

    return ProfileViewController(viewModel: viewModel);
  }
}
