import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';

class SuraItemHorizontal extends StatelessWidget {
  SuraModel sura;
  SuraItemHorizontal({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFFE2BE7F)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(sura.nameEn,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: const Color(0xFF202020))),
              Text(
                sura.nameAr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: const Color(0xFF202020)),
              ),
              Text(
                "${sura.numberVerses} Verses",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: const Color(0xFF202020)),
              )
            ],
          ),
          Image.asset("assets/images/itemhorizontal.png")
        ],
      ),
    );
  }
}
