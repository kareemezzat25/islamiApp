import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/suras.dart';

class SuraItemHorizontal extends StatelessWidget {
  int index;
  SuraItemHorizontal({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(0xFFE2BE7F)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Suras.englishQuranSurahs[index],
                  style: GoogleFonts.elMessiri(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF202020))),
              SizedBox(
                height: 4,
              ),
              Text(
                Suras.arabicAuranSuras[index],
                style: GoogleFonts.elMessiri(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "${Suras.AyaNumber[index]} Verses",
                style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202020)),
              )
            ],
          ),
          Image.asset("assets/images/itemhorizontal.png")
        ],
      ),
    );
  }
}
