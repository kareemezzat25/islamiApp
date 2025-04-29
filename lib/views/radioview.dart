import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:islami_app/models/mytheme.dart';

import 'package:islami_app/widgets/radiocontentTab.dart';

import 'package:islami_app/widgets/reciterscontentTab.dart';

class Radioview extends StatelessWidget {
  const Radioview({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: MyThemeData.blackColor.withOpacity(0.70)),
                child: TabBar(
                    dividerColor: Colors.transparent,
                    labelColor: MyThemeData.blackColor,
                    unselectedLabelColor: Color(0xFFFFFFFF),
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w400),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: MyThemeData.primarycolor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w700),
                    tabs: [
                      Tab(
                        text: "radio".tr(),
                      ),
                      Tab(
                        text: "reciters".tr(),
                      )
                    ]),
              ),
              const Expanded(
                child: TabBarView(children: [RadioTab(), RecitersTab()]),
              )
            ],
          ),
        ));
  }
}
