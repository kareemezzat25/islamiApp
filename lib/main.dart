import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/cache.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/views/azkarview.dart';
import 'package:islami_app/views/hadith-detailsview.dart';
import 'package:islami_app/views/homeview.dart';
import 'package:islami_app/views/onboardingview.dart';
import 'package:islami_app/views/suradetailsView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
              theme: MyThemeData.lightTheme,
              themeMode: ThemeMode.light,
              initialRoute: Cache.getEligibilty() == true
                  ? HomeView.routeName
                  : Onboardingview.routeName,
              routes: {
                Onboardingview.routeName: (context) => const Onboardingview(),
                HomeView.routeName: (context) => HomeView(),
                SuraDetails.routeName: (context) => const SuraDetails(),
                HadethDetails.routeName: (context) => const HadethDetails(),
                Azkarview.routeName: (context) => Azkarview()
              },
              debugShowCheckedModeBanner: false,
              home: const Onboardingview());
        });
  }
}
