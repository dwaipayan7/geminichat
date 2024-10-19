import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:geminichat/HomePage.dart';
import 'package:geminichat/splashScreen.dart';
import 'package:geminichat/themes.dart';

import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemini Chat',
      theme: lightMode,
      darkTheme: darkMode,
      home: Splashscreen(),
    );
  }
}

