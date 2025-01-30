import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sebhaview extends StatefulWidget {
  Sebhaview({super.key});

  @override
  State<Sebhaview> createState() => _SebhaviewState();
}

class _SebhaviewState extends State<Sebhaview> {
  List<String> tasbih = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لا اله الا الله"
  ];
  int index = 0;
  int counter = 0;
  double turn = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: GoogleFonts.elMessiri(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Image.asset("assets/images/sebhaHeader.png"),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedRotation(
              turns: turn,
              duration: Duration(milliseconds: 500),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      turn += 1 / 30;
                      counter++;
                      if (counter == 30) {
                        index++;
                        counter = 0;
                        if (index == tasbih.length) {
                          index = 0;
                        }
                      }
                    });
                  },
                  child: Image.asset("assets/images/SebhaBody.png")),
            ),
            Column(
              children: [
                Text(
                  tasbih[index],
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold),
                ),
                Text("$counter",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ],
            )
          ],
        )
      ],
    );
  }
}
