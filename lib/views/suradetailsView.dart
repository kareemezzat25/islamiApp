import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    var suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index);
    }
    return Scaffold(
        backgroundColor: const Color(0xFF202020),
        appBar: AppBar(
          title: Text(suraModel.nameEn),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/details_bg.png",
                width: double.infinity, fit: BoxFit.fill),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  suraModel.nameAr,
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xFF202020),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 1,
                                      color: isSelected
                                          ? Colors.transparent
                                          : const Color(0xFFE2BE7F))),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text.rich(
                                      textAlign: TextAlign.center,
                                      TextSpan(children: [
                                        TextSpan(
                                            text: verses[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: isSelected
                                                        ? Colors.black
                                                        : Theme.of(context)
                                                            .primaryColor)),
                                        TextSpan(
                                            text: "(${index + 1})",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    color: isSelected
                                                        ? Colors.black
                                                        : Theme.of(context)
                                                            .primaryColor)),
                                      ])),
                                ),
                              )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 8,
                        );
                      },
                      itemCount: verses.length),
                ),
              )
            ])
          ],
        ));
  }

  loadSuraFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
