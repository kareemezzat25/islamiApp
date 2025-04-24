import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/praytimemodel.dart';

class PrayTimeItem extends StatelessWidget {
  PrayTime prayTime;
  PrayTimeItem({super.key, required this.prayTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      width: 104.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/PrayTime.png",
              ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            prayTime.sallahname,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          Text(
            prayTime.sallahTime,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          Text(
            prayTime.isSallahPm ? "PM" : "AM",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
