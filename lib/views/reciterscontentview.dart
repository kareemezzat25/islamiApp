import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/recitersmodel.dart';
import 'package:islami_app/models/suramodel.dart';
import 'package:islami_app/widgets/radioitem.dart';

class ReciterContent extends StatelessWidget {
  static const String routeName = "RecitersView";
  const ReciterContent({super.key});

  @override
  Widget build(BuildContext context) {
    Reciters reciter = ModalRoute.of(context)?.settings.arguments as Reciters;
    late List<int> surahList;
    if (reciter.moshaf![0].surahList!.isNotEmpty) {
      surahList = reciter.moshaf![0].surahList!
          .split(',')
          .map((e) => int.parse(e))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          reciter.name ?? "",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return RadioItem(
                name: SuraModel.arabicAuranSuras[surahList[index] - 1],
                url:
                    "${reciter.moshaf![0].server}${surahList[index].toString().padLeft(3, '0')}.mp3");
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 16.h,
            );
          },
          itemCount: reciter.moshaf![0].surahTotal ?? 0,
        ),
      ),
    );
  }
}
