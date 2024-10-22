import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geminichat/pages/HomePage.dart';
import 'package:geminichat/pages/splashScreen.dart';
import 'package:geminichat/themes/themeNotifier.dart';
import 'package:geminichat/themes/themes.dart';

import 'pages/onboarding.dart';

void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gemini Chat',
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: themeMode,
      home: Splashscreen(),
    );
  }
}

