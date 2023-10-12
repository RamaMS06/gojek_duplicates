import 'package:go_router/go_router.dart';
import 'package:gojek_duplicates/pages/main_page.dart';
import 'package:gojek_duplicates/pages/splash_page.dart';
import 'package:gojek_duplicates/router/routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
        path: Routes.splashPage,
        builder: (context, state) => const SplashPage()),
    GoRoute(
        path: Routes.mainPage, builder: (context, state) => const MainPage()),
  ]);
}
