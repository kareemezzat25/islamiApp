import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/azkarmodel.dart';
import 'package:islami_app/models/mytheme.dart';
import 'dart:ui' as ui;

class Azkarview extends StatefulWidget {
  static const String routeName = "Azkarview";
  const Azkarview({super.key});

  @override
  State<Azkarview> createState() => _AzkarviewState();
}

class _AzkarviewState extends State<Azkarview> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    var azkarType = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(azkarType),
      ),
      body: FutureBuilder(
          future: Azkar.loadAzkar(azkarType),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              Center(
                child: CircularProgressIndicator(
                  color: MyThemeData.primarycolor,
                ),
              );
            } else if (snapshot.hasError) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Error",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.black),
                      ),
                      content: Text(
                        "SomeThing Went Wrong",
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
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                backgroundColor: Colors.black),
                            child: Text(
                              "Cancel",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.blue),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              Azkar.loadAzkar(azkarType);
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                            child: Text(
                              "Try Again",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    );
                  });
            }
            List<Azkar> azkar = snapshot?.data ?? [];
            return ListView.separated(
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding:
                          EdgeInsets.symmetric(vertical: 12.h, horizontal: 12),
                      decoration: BoxDecoration(
                          color: isSelected
                              ? MyThemeData.primarycolor
                              : MyThemeData.blackColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : MyThemeData.primarycolor)),
                      child: Column(
                        children: [
                          Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: Text(
                              azkar[index].content,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: isSelected
                                          ? MyThemeData.blackColor
                                          : MyThemeData.primarycolor),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: Text(
                              azkar[index].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: isSelected
                                          ? MyThemeData.blackColor
                                          : MyThemeData.primarycolor),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            azkar[index].count,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: isSelected
                                        ? MyThemeData.blackColor
                                        : MyThemeData.primarycolor),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 12.h,
                  );
                },
                itemCount: azkar.length);
          }),
    );
  }
}
