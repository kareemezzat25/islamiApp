import 'package:flutter/material.dart';
import 'package:islami_app/views/homeview.dart';
import 'package:islami_app/views/onboardingview.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Onboardingview.routeName,
        routes: {
          Onboardingview.routeName: (context) => Onboardingview(),
          HomeView.routeName: (context) => HomeView()
        },
        debugShowCheckedModeBanner: false,
        home: Onboardingview());
  }
}
