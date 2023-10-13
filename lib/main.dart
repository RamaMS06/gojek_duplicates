import 'package:flutter/material.dart';
import 'package:gojek_duplicates/data/services/navigator_service.dart';
import 'package:gojek_duplicates/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRouter.router, key: NavigatorService.navigatorKey);
  }
}
