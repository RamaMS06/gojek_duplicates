import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/pages/landing_page.dart';
import 'package:gojek_duplicates/pages/login_page.dart';
import 'package:gojek_duplicates/pages/main_page.dart';
import 'package:gojek_duplicates/pages/splash_page.dart';
import 'package:gojek_duplicates/router/routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
        path: Routes.splashPage,
        builder: (context, state) => const SplashPage()),
    GoRoute(
        path: Routes.landingPage,
        builder: (context, state) => const LandingPage()),
    GoRoute(
        path: Routes.loginPage, builder: (context, state) => const LoginPage()),
    GoRoute(
        path: Routes.mainPage, builder: (context, state) => const MainPage()),
  ]);
}
