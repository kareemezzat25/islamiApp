import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/models/cache.dart';
import 'package:islami_app/views/homeview.dart';

class Onboardingview extends StatelessWidget {
  static const String routeName = "OnBoarding";
  const Onboardingview({super.key});

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', height: 300, width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = Theme.of(context).textTheme.bodyMedium!;
    var pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.titleLarge!,
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      pageColor: const Color(0xFF202020),
      imageFlex: 3,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: const Color(0xFF202020),
        globalHeader: Image.asset(
          "assets/images/islamilogo.png",
          height: 150,
        ),
        dotsDecorator: DotsDecorator(
            color: const Color(0xFF707070),
            activeColor: const Color(0xFFE2BE7F),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            activeSize: const Size(10, 10)),
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        next: Text(
          "Next",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        done: Text(
          "Finish",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        onDone: () {
          Cache.saveEligibilty();
          Navigator.pushNamed(context, HomeView.routeName);
        },
        pages: [
          PageViewModel(
            title: "Welcome To Islmi App",
            body: "",
            image: _buildImage('onboarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Welcome To Islami",
            body: "We Are Very Excited To Have You In Our Community",
            image: _buildImage('onboarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
            image: _buildImage('onboarding3.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: _buildImage('onboarding4.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran Radio through the application for free and easily",
            image: _buildImage('onboarding5.png'),
            decoration: pageDecoration,
          ),
        ],
      ),
    );
  }
}
