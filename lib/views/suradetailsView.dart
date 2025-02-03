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
          centerTitle: true,
          titleTextStyle: GoogleFonts.aBeeZee(
              color: const Color(0xFFE2BE7F),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          title: Text(suraModel.nameEn),
          iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
          backgroundColor: const Color(0xFF202020),
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
                  style: GoogleFonts.aBeeZee(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFE2BE7F)),
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
                                      ? const Color(0xFFE2BE7F)
                                      : const Color(0xFF202020),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      width: 1,
                                      color: isSelected
                                          ? Colors.transparent
                                          : const Color(0xFFE2BE7F))),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(children: [
                                      TextSpan(
                                        text: verses[index],
                                        style: GoogleFonts.aBeeZee(
                                            color: isSelected
                                                ? Colors.black
                                                : const Color(0xFFE2BE7F),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "(${index + 1})",
                                        style: GoogleFonts.aBeeZee(
                                            color: isSelected
                                                ? Colors.black
                                                : const Color(0xFFE2BE7F),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ])),
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
