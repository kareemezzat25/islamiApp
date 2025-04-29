import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami_app/models/mytheme.dart';
import 'package:islami_app/providers/radioprovider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatelessWidget {
  String name;
  String url;

  RadioItem({super.key, required this.name, required this.url});

  bool isVolumeUp = true;

  @override
  Widget build(BuildContext context) {
    var radioProvider = Provider.of<Radioprovider>(context);

    return Stack(
      children: [
        radioProvider.isPlaying && radioProvider.currentPlayingUrl == url
            ? Image.asset(
                "assets/images/radioPlay.png",
                width: 390.w,
                height: 178.h,
                fit: BoxFit.fill,
              )
            : Image.asset(
                "assets/images/radioOff.png",
                width: 390.w,
                height: 133.h,
                fit: BoxFit.fill,
              ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: AutoSizeText(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: MyThemeData.blackColor),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          radioProvider.play(url);
                        },
                        icon: Icon(
                          (radioProvider.isPlaying &&
                                  radioProvider.currentPlayingUrl == url)
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: MyThemeData.blackColor,
                          size: 44,
                        )),
                    IconButton(
                        onPressed: () {
                          isVolumeUp = !isVolumeUp;
                          radioProvider.setVolume(isVolumeUp ? 1 : 0);
                        },
                        icon: isVolumeUp
                            ? Icon(
                                Icons.volume_up,
                                color: MyThemeData.blackColor,
                                size: 30,
                              )
                            : Icon(
                                Icons.volume_off,
                                color: MyThemeData.blackColor,
                                size: 30,
                              ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
