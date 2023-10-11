import 'package:flutter/material.dart';
// import 'package:gojek_duplicates/pages/chatting_page.dart';
// import 'package:gojek_duplicates/pages/home_page.dart';
import 'package:gojek_duplicates/pages/main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}
