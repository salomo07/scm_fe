import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scm_fe/app/constanta/text_style.dart';

import 'app/constanta/env.dart';
import 'app/constanta/variable.dart';
import 'app/middleware/authentication_manager.dart';
import 'app/routes/pages.dart';
import 'package:intl/intl.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  Intl.defaultLocale = 'id_ID';
  if (!kIsWeb) {
    await Hive.initFlutter();
    WidgetsFlutterBinding.ensureInitialized();
  }
  await Hive.openBox(storageSCM);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id', 'ID'),
      ],
      title: appName,
      initialBinding: BindingsBuilder.put(
        () => AuthenticationManager(),
      ),
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: defaultColor,
        disabledColor: greyColor,
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: poppinsTextFont.copyWith(fontSize: 12),
          bodyMedium: poppinsTextFont.copyWith(fontSize: 12),
          bodySmall: poppinsTextFont.copyWith(fontSize: 12),
          displayLarge: poppinsTextFont.copyWith(fontSize: 12),
          displayMedium: poppinsTextFont.copyWith(fontSize: 12),
          displaySmall: poppinsTextFont.copyWith(fontSize: 12),
          headlineLarge: poppinsTextFont.copyWith(fontSize: 12),
          headlineMedium: poppinsTextFont.copyWith(fontSize: 12),
          headlineSmall: poppinsTextFont.copyWith(fontSize: 12),
          labelLarge: poppinsTextFont.copyWith(fontSize: 12),
          labelMedium: poppinsTextFont.copyWith(fontSize: 12),
          labelSmall: poppinsTextFont.copyWith(fontSize: 12),
          titleMedium: poppinsTextFont.copyWith(fontSize: 12),
          titleSmall: poppinsTextFont.copyWith(fontSize: 12),
        ),
      ),
      // initialRoute: AppPages.initial,
    );
  }
}