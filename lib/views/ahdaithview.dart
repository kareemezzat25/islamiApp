import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadethmodel.dart';

class Ahdaithview extends StatefulWidget {
  Ahdaithview({super.key});

  @override
  State<Ahdaithview> createState() => _AhdaithviewState();
}

class _AhdaithviewState extends State<Ahdaithview> {
  List<HadethModel> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }

  loadAhadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((file) {
      List<String> ahadeth = file.split("#");
      for (String hadeth in ahadeth) {
        List<String> linesHadeth = hadeth.trim().split("\n");
        String title = linesHadeth[0];
        linesHadeth.removeAt(0);
        List<String> content = linesHadeth;
        ahadethList.add(HadethModel(content: content, title: title));
      }
      setState(() {});
    }).catchError((error) {
      print(error.toString());
    });
  }
}
