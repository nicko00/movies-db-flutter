import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/utils/session_manager.dart';
import 'splash_view_controller.dart';
import 'splash_view_model.dart';

class SplashFactory {
  static const String route = '/splash';

  static StatefulWidget splash() {
    final l10n = Localize.instance.l10n;
    final sessionManager = SessionManager.instance;
    final viewModel = SplashViewModel(
      l10n: l10n,
      sessionManager: sessionManager,
    );

    return SplashViewController(viewModel: viewModel);
  }
}
