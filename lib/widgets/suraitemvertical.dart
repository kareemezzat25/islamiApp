import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';

class SuraItemvertical extends StatelessWidget {
  SuraModel sura;
  SuraItemvertical({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Image(image: AssetImage("assets/images/Group.png")),
            Text(
              "${sura.index + 1}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: const Color(0xFFFFFFFF)),
            )
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sura.nameEn,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: const Color(0xFFFFFFFF)),
            ),
            Text(
              "${sura.numberVerses} Verses",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: const Color(0xFFFFFFFF)),
            ),
          ],
        ),
        const Spacer(),
        Text(
          textAlign: TextAlign.right,
          sura.nameAr,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: const Color(0xFFFFFFFF)),
        )
      ],
    );
  }
}
