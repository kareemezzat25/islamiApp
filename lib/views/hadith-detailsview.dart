import 'package:flutter/material.dart';
import 'package:islami_app/models/hadethmodel.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";
  const HadethDetails({super.key});

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
                const SizedBox(
                  height: 18,
                ),
                Text(
                  hadethModel.title,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 42,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 94),
                    child: ListView.builder(
                        itemCount: hadethModel.content.length,
                        itemBuilder: (context, index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(hadethModel.content[index],
                                style: Theme.of(context).textTheme.bodyMedium),
                          );
                        }),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
