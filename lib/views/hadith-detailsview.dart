import 'package:flutter/material.dart';
import 'package:islami_app/models/hadethmodel.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";
  HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var hadethModel = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/details_bg.png",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Text(
                  hadethModel.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 42,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Text(hadethModel.content.first,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
