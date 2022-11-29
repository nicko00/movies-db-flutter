import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/localization.dart';

import 'localization/localize.dart';
import 'support/style/app_themes.dart';
import 'support/utils/mobile_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
