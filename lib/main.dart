import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localize.dart';

import 'firebase_options.dart';
import 'localization/localize.dart';
import 'support/style/app_themes.dart';
import 'support/utils/cache_manager.dart';
import 'support/utils/images_manager.dart';
import 'support/utils/mobile_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([
    CacheManager.instance.initialize(),
    ImagesManager.instance.initialize(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MobileRouter.routes,
      theme: AppThemes.theme,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
      navigatorKey: MobileRouter.navigatorKey,
      initialRoute: MobileRouter.initialRoute,
    );
  }
}
