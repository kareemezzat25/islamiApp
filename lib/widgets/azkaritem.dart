import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AzkarItem extends StatelessWidget {
  String azkarImage;
  String azkarText;
  AzkarItem({super.key, required this.azkarImage, required this.azkarText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 259.h,
      width: 185.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Column(
        children: [
          Image.asset(azkarImage),
          Text(
            azkarText,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
