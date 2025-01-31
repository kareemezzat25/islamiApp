import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';
import 'package:islami_app/widgets/suraitemhorizontal.dart';
import 'package:islami_app/widgets/suraitemvertical.dart';

class Quranview extends StatefulWidget {
  Quranview({super.key});

  @override
  State<Quranview> createState() => _QuranviewState();
}

class _QuranviewState extends State<Quranview> {
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearch);
  }

  void onSearch() {
    SuraModel.searchResults.clear();
    SuraModel.searchResultIndex.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.englishQuranSurahs) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResults.add(data);
          SuraModel.searchResultIndex
              .add(SuraModel.englishQuranSurahs.indexOf(data));
        }
      }
      for (String data in SuraModel.arabicAuranSuras) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResults.add(data);
          SuraModel.searchResultIndex
              .add(SuraModel.arabicAuranSuras.indexOf(data));
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchSura(),
          const SizedBox(
            height: 20,
          ),
          if (SuraModel.searchResults.isEmpty &&
              searchController.text.isEmpty) ...[
            Text("Most Recently ",
                style: GoogleFonts.aBeeZee(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFEFFE8))),
            const SizedBox(
              height: 10,
            ),
            suraHorizontalList(),
            const SizedBox(
              height: 12,
            ),
          ],
          Text("Suras List",
              style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFEFFE8))),
          const SizedBox(
            height: 16,
          ),
          suraVerticalList()
        ],
      ),
    );
  }

  Widget searchSura() {
    return TextField(
      style: const TextStyle(fontSize: 18, color: Color(0xFFE2BE7F)),
      controller: searchController,
      cursorColor: const Color(0xFFE2BE7F),
      cursorRadius: const Radius.circular(12),
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: GoogleFonts.elMessiri(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFFEFFE8)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 1)),
        prefixIcon: const ImageIcon(AssetImage("assets/images/quran.png"),
            color: Color(0xFFE2BE7F)),
      ),
    );
  }

  Widget suraHorizontalList() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SuraItemHorizontal(sura: SuraModel.getSuraModel(index));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: SuraModel.arabicAuranSuras.length),
    );
  }

  Widget suraVerticalList() {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return SuraModel.searchResults.isNotEmpty
                ? SuraItemvertical(
                    sura: SuraModel.getSearchSuraModel(
                        SuraModel.searchResultIndex[index]))
                : SuraItemvertical(sura: SuraModel.getSuraModel(index));
          },
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 42,
              endIndent: 42,
              color: Colors.white,
            );
          },
          itemCount: SuraModel.searchResults.isNotEmpty
              ? SuraModel.searchResults.length
              : SuraModel.arabicAuranSuras.length),
    );
  }
}
