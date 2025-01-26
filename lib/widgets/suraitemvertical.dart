import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/suras.dart';

class SuraItemvertical extends StatelessWidget {
  int index;
  SuraItemvertical({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage("assets/images/Group.png")),
            Text(
              "${index + 1}",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${Suras.englishQuranSurahs[index]}",
              style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
            ),
            Text(
              "${Suras.AyaNumber[index]} Verses",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF)),
            ),
          ],
        ),
        Spacer(),
        Text(
          textAlign: TextAlign.right,
          "${Suras.arabicAuranSuras[index]}",
          style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}
