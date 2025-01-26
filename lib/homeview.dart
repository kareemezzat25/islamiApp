import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "Home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/Background.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xFFE2BE7F),
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedItemColor: Colors.white,
              unselectedItemColor: Color(0xFF202020),
              currentIndex: selectedIndex,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              items: [
                ItemNavigationBottom("quran", "Quran", 0),
                ItemNavigationBottom("hadith", "Hadith", 1),
                ItemNavigationBottom("sebha", "Sebha", 2),
                ItemNavigationBottom("radio", "Radio", 3),
                ItemNavigationBottom("time", "Time", 4),
              ]),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  ItemNavigationBottom(String image, String label, int index) {
    return BottomNavigationBarItem(
        icon: selectedIndex == index
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                    color: Color(0xFF202020).withOpacity(0.6)),
                child: ImageIcon(AssetImage("assets/images/$image.png")))
            : ImageIcon(AssetImage("assets/images/$image.png")),
        label: label);
  }
}
