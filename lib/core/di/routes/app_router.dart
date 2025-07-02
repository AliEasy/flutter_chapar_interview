import 'package:auto_route/auto_route.dart';
import 'package:flutter_chapar_interview/core/di/routes/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PersonalInfoRoute.page, initial: true),
    AutoRoute(page: SkillsRoute.page),
  ];
}
