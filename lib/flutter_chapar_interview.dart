import 'package:flutter/material.dart';
import 'package:flutter_chapar_interview/features/personal_info/presentation/page/personal_info_page.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const PersonalInfoPage(),
      routerConfig: getIt<AppRouter>().config(),
    );
  }
}
