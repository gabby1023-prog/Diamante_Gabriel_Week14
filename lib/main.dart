import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'first_screen.dart';
import 'second_screen.dart';

void main() {
  runApp(const Week14App());
}

class Week14App extends StatelessWidget {
  const Week14App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diamante Gabriel Week 14',
      theme: AppTheme.lightTheme,
      // Step 8 Preview: Change '/screen1' to '/screen2' and hot-restart (R)
      // to preview the second screen without adding navigation logic.
      initialRoute: '/screen1',
      routes: {
        '/screen1': (context) => const FirstScreen(),
        '/screen2': (context) => const SecondScreen(),
      },
    );
  }
}