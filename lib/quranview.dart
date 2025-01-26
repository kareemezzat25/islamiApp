import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/suras.dart';
import 'package:islami_app/widgets/suraitemhorizontal.dart';
import 'package:islami_app/widgets/suraitemvertical.dart';

class Quranview extends StatelessWidget {
  Quranview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Sura Name",
              labelStyle: GoogleFonts.elMessiri(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFEFFE8)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F), width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFFE2BE7F), width: 1)),
              prefixIcon: ImageIcon(AssetImage("assets/images/quran.png"),
                  color: Color(0xFFE2BE7F)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Most Recently ",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFEFFE8))),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SuraItemHorizontal(index: index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: Suras.arabicAuranSuras.length),
          ),
          SizedBox(
            height: 12,
          ),
          Text("Suras List",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFEFFE8))),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SuraItemvertical(index: index);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 42,
                    endIndent: 42,
                    color: Colors.white,
                  );
                },
                itemCount: Suras.arabicAuranSuras.length),
          )
        ],
      ),
    );
  }
}
