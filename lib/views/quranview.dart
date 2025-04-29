import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/models/mytheme.dart';
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
          Row(
            children: [
              Expanded(child: searchSura()),
              SizedBox(
                width: 8.w,
              ),
              InkWell(
                onTap: () {
                  context.setLocale(
                      Locale(context.locale.toString() == "en" ? "ar" : "en"));
                },
                child: Container(
                  height: 65.h,
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: MyThemeData.primarycolor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      context.locale.toString() == "en" ? "ع" : "En",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: MyThemeData.blackColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          if (SuraModel.searchResults.isEmpty &&
              searchController.text.isEmpty) ...[
            Text("most_recently".tr(),
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
          Text("sura_list".tr(),
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
        labelText: "sura_name".tr(),
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
