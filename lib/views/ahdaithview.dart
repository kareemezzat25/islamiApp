import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/hadethmodel.dart';
import 'package:islami_app/views/hadith-detailsview.dart';

class Ahdaithview extends StatefulWidget {
  const Ahdaithview({super.key});

  @override
  State<Ahdaithview> createState() => _AhdaithviewState();
}

class _AhdaithviewState extends State<Ahdaithview> {
  List<HadethModel> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    loadAhadethFile();
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(
                height: double.infinity,
                scrollPhysics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.8),
            items: ahadethList.map((ahadith) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,
                          arguments: ahadith);
                    },
                    // splashColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset("assets/images/Hadith Card.png",
                            width: double.infinity, fit: BoxFit.fill),
                        Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                children: [
                                  Text(
                                    ahadith.title,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: const Color(0xFF202020)),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    ahadith.content.first,
                                    maxLines: 12,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: const Color(0xFF202020)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 12.h,
        )
      ],
    );
  }

  loadAhadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((file) {
      List<String> ahadeth = file.split("#");
      for (String hadeth in ahadeth) {
        List<String> linesHadeth = hadeth.trim().split("\n");
        String title = linesHadeth[0];
        linesHadeth.removeAt(0);
        List<String> content = linesHadeth;
        ahadethList.add(HadethModel(content: content, title: title));
      }
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
