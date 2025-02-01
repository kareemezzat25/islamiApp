import 'package:flutter/material.dart';
import 'package:islami_app/models/cache.dart';
import 'package:islami_app/views/homeview.dart';
import 'package:islami_app/views/onboardingview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: Cache.getEligibilty() == true
            ? HomeView.routeName
            : Onboardingview.routeName,
        routes: {
          Onboardingview.routeName: (context) => const Onboardingview(),
          HomeView.routeName: (context) => HomeView()
        },
        debugShowCheckedModeBanner: false,
        home: const Onboardingview());
  }
}
