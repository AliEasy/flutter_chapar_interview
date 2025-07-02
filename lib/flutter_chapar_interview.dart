import 'package:flutter/material.dart';
import 'package:flutter_chapar_interview/core/di/base/di_setup.dart';
import 'package:flutter_chapar_interview/core/di/routes/app_router.dart';
import 'package:flutter_chapar_interview/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FlutterChaparInterview extends StatelessWidget {
  const FlutterChaparInterview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chapar Interview',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(centerTitle: true),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeData.light().colorScheme.primary,
            foregroundColor: ThemeData.light().colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
