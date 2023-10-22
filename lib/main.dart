import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/screens/splash_screen/splash_screen.dart';
import 'package:news/shared/styles/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeLayout.routeName: (context) => const HomeLayout(),
        SplashScreen.routeName: (context) => const SplashScreen()
      },
    );
  }
}
