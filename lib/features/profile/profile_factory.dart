import 'package:flutter/material.dart';

import '../../support/utils/cache_manager.dart';
import '../../support/utils/images_manager.dart';
import '../../support/utils/session_manager.dart';
import 'profile_view_controller.dart';
import 'profile_view_model.dart';

class ProfileFactory {
  static const String route = '/profile';

  static StatefulWidget profile() {
    final sessionManager = SessionManager.instance;
    final sharedPreferences = CacheManager.instance;
    final imagesManager = ImagesManager.instance;
    final viewModel = ProfileViewModel(
      sessionManager: sessionManager,
      imagesManager: imagesManager,
      sharedPreferences: sharedPreferences,
    );

    return ProfileViewController(viewModel: viewModel);
  }
}
