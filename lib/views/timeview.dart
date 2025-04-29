import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/bloc/cubit.dart';
import 'package:islami_app/bloc/states.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/models/praytimemodel.dart';
import 'package:islami_app/repository/repo_impl.dart';
import 'package:islami_app/widgets/azkaritem.dart';
import 'package:islami_app/widgets/praytimeitem.dart';

class Timeview extends StatelessWidget {
  /* List<PrayTime> prayTimes = [
    PrayTime(sallahname: "Fagr", sallahTime: "04:38", isSallahPm: false),
    PrayTime(sallahname: "Sunrise", sallahTime: "07:38", isSallahPm: false),
    PrayTime(sallahname: "Dhuhr", sallahTime: "01:01", isSallahPm: true),
    PrayTime(sallahname: "ASR", sallahTime: "04:38", isSallahPm: true),
    PrayTime(sallahname: "Maghrib", sallahTime: "07:57", isSallahPm: true),
    PrayTime(sallahname: "Isha", sallahTime: "08:38", isSallahPm: true),
  ];*/
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
              child: BlocProvider(
                create: (context) =>
                    HomeCubit(repo: RepoImplemtation())..getPrayTime(),
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is GetPrayTimeLoading) {
                      const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                      );
                    } else if (state is GetPrayTimeError) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Error",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(color: MyThemeData.blackColor),
                              ),
                              content: Text(
                                state.messageError,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey[850]),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.r))),
                                    child: Text(
                                      "Ok",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ))
                              ],
                            );
                          });
                    }
                  },
                  builder: (context, state) {
                    if (state is GetPrayTimeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    var bloc = BlocProvider.of<HomeCubit>(context);
                    String readableDate =
                        bloc.prayTimeResponse?.data?.date?.readable ?? "";
                    Map<String, dynamic> timings =
                        bloc.prayTimeResponse!.data!.timings!.toJson();
                    final List<PrayTime> prayTimes =
                        convertMapToPrayTimeList(timings);

                    List<String> dateParts = readableDate.split(" ");
                    String year = dateParts.length == 3 ? dateParts[2] : "";
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  dateParts.length >= 2
                                      ? "${dateParts[0]} ${dateParts[1]},"
                                      : "",
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
                                  year,
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
                                  "pray_time".tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: const Color(0xFF856B3F),
                                          fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  bloc.prayTimeResponse?.data?.date?.hijri
                                          ?.weekday?.ar ??
                                      "Error",
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
                                  "${bloc.prayTimeResponse?.data?.date?.hijri?.day ?? ""} ${bloc.prayTimeResponse?.data?.date?.hijri?.month?.ar ?? ""},",
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
                                  bloc.prayTimeResponse?.data?.date?.hijri
                                          ?.year ??
                                      "",
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
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "azkar".tr(),
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
                    azkarText: "evening_azkar".tr()),
                AzkarItem(
                    azkarImage: "assets/images/morningAzkar.png",
                    azkarText: "morning_azkar".tr())
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<PrayTime> convertMapToPrayTimeList(Map<String, dynamic> timings) {
  return timings.entries.map((entry) {
    final time = entry.value as String;
    DateTime dateTime = DateFormat("HH:mm").parse(time);

    String formattedTime = DateFormat("hh:mm").format(dateTime);

    bool isPm = DateFormat("a").format(dateTime).toLowerCase() == "pm";

    return PrayTime(
      sallahname: entry.key,
      sallahTime: formattedTime,
      isSallahPm: isPm,
    );
  }).toList();
}
