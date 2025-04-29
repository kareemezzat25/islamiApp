import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/models/recitersmodel.dart';
import 'package:islami_app/views/reciterscontentview.dart';

class RecitersItem extends StatelessWidget {
  Reciters reciterModel;
  RecitersItem({super.key, required this.reciterModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ReciterContent.routeName,
            arguments: reciterModel);
      },
      child: Container(
        width: 390.w,
        height: 133.h,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
              "assets/images/radioOff.png",
            )),
            borderRadius: BorderRadius.circular(20.r),
            color: MyThemeData.primarycolor),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Text(
              reciterModel.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: MyThemeData.blackColor),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: "surahtotal".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: MyThemeData.blackColor)),
                TextSpan(
                    text: "${reciterModel.moshaf![0].surahTotal ?? 0}",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: MyThemeData.blackColor))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
