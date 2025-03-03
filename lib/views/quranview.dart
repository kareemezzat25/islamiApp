import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/suramodel.dart';
import 'package:islami_app/views/suradetailsView.dart';
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
          SizedBox(
            height: 20.h,
          ),
          if (SuraModel.searchResults.isEmpty &&
              searchController.text.isEmpty) ...[
            Text("Most Recently ",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: const Color(0xFFFEFFE8))),
            SizedBox(
              height: 10.h,
            ),
            suraHorizontalList(),
            SizedBox(
              height: 12.h,
            ),
          ],
          Text("Suras List",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: const Color(0xFFFEFFE8))),
          SizedBox(
            height: 16.h,
          ),
          suraVerticalList()
        ],
      ),
    );
  }

  Widget searchSura() {
    return TextField(
      style: TextStyle(fontSize: 18.sp, color: Color(0xFFE2BE7F)),
      controller: searchController,
      cursorColor: const Color(0xFFE2BE7F),
      cursorRadius: Radius.circular(12.r),
      decoration: InputDecoration(
        labelText: "Sura Name",
        labelStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: const Color(0xFFFEFFE8)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFFE2BE7F), width: 1)),
        prefixIcon: ImageIcon(const AssetImage("assets/images/quran.png"),
            color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget suraHorizontalList() {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                      arguments: SuraModel.getSuraModel(index));
                },
                child: SuraItemHorizontal(sura: SuraModel.getSuraModel(index)));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
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
                ? InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(context, SuraDetails.routeName,
                          arguments: SuraModel.getSearchSuraModel(
                              SuraModel.searchResultIndex[index]));
                    },
                    child: SuraItemvertical(
                        sura: SuraModel.getSearchSuraModel(
                            SuraModel.searchResultIndex[index])),
                  )
                : InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.pushNamed(context, SuraDetails.routeName,
                          arguments: SuraModel.getSuraModel(index));
                    },
                    child:
                        SuraItemvertical(sura: SuraModel.getSuraModel(index)));
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
