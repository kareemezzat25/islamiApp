import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/views/ahdaithview.dart';
import 'package:islami_app/views/quranview.dart';
import 'package:islami_app/views/radioview.dart';
import 'package:islami_app/views/sebhaview.dart';
import 'package:islami_app/views/timeview.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "Home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> views = [
    Quranview(),
    const Ahdaithview(),
    Sebhaview(),
    const Radioview(),
    Timeview()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/${getBackground(selectedIndex)}.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                items: [
                  ItemNavigationBottom("quran", "quran".tr(), 0),
                  ItemNavigationBottom("hadith", "hadith".tr(), 1),
                  ItemNavigationBottom("sebha", "sebha".tr(), 2),
                  ItemNavigationBottom("radio", "radio".tr(), 3),
                  ItemNavigationBottom("time", "time".tr(), 4),
                ]),
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Center(child: Image.asset("assets/images/islamilogo.png")),
                Expanded(child: views[selectedIndex])
              ],
            )),
      ],
    );
  }

  String getBackground(int index) {
    switch (index) {
      case 0:
        return "Background";
      case 1:
        return "ahdaith_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "time_bg";
      default:
        return "Background";
    }
  }

  // ignore: non_constant_identifier_names
  ItemNavigationBottom(String image, String label, int index) {
    return BottomNavigationBarItem(
        icon: selectedIndex == index
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66.r),
                    color: const Color(0xFF202020).withOpacity(0.6)),
                child: ImageIcon(AssetImage("assets/images/$image.png")))
            : ImageIcon(AssetImage("assets/images/$image.png")),
        label: label);
  }
}
