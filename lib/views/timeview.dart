import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/praytime.dart';
import 'package:islami_app/widgets/azkaritem.dart';
import 'package:islami_app/widgets/praytimeitem.dart';

class Timeview extends StatelessWidget {
  List<PrayTime> prayTimes = [
    PrayTime(sallahname: "Fagr", sallahTime: "04:38", isSallahPm: false),
    PrayTime(sallahname: "Sunrise", sallahTime: "07:38", isSallahPm: false),
    PrayTime(sallahname: "Dhuhr", sallahTime: "01:01", isSallahPm: true),
    PrayTime(sallahname: "ASR", sallahTime: "04:38", isSallahPm: true),
    PrayTime(sallahname: "Maghrib", sallahTime: "07:57", isSallahPm: true),
    PrayTime(sallahname: "Isha", sallahTime: "08:38", isSallahPm: true),
  ];
  Timeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 301.h,
              width: 390.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: const Color(0xFF856B3F),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/timeSallah.png",
                    )),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "16 jul,",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "2024",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Pray Time",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: const Color(0xFF856B3F),
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Tuesday",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: const Color(0xFF202020),
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "09 Muh,",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "1446",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  SizedBox(
                    height: 128.h,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return PrayTimeItem(prayTime: prayTimes[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 8.w,
                          );
                        },
                        itemCount: prayTimes.length),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Next Pray - 02:32",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 62.w,
                        ),
                        const Icon(Icons.volume_off_sharp)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Azkar",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AzkarItem(
                    azkarImage: "assets/images/eveningAzkar.png",
                    azkarText: "Evening Azkar"),
                AzkarItem(
                    azkarImage: "assets/images/morningAzkar.png",
                    azkarText: "Morning Azkar")
              ],
            )
          ],
        ),
      ),
    );
  }
}
