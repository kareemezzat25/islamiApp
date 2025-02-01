import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "SuraDetails";
  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return Scaffold(
        backgroundColor: const Color(0xFF202020),
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: GoogleFonts.aBeeZee(
              color: const Color(0xFFE2BE7F),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          title: Text(suraModel.nameEn),
          iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/details_bg.png",
                width: double.infinity, fit: BoxFit.fill),
            Column(children: [
              Text(
                suraModel.nameAr,
                style: GoogleFonts.aBeeZee(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE2BE7F)),
              ),
              const SizedBox(
                height: 42,
              )
            ])
          ],
        ));
  }
}
