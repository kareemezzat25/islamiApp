import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app/models/praytimeResponse.dart';
import 'package:islami_app/repository/repo.dart';

class RepoImplemtation extends Repo {
  @override
  Future<PrayTimeResponse> getPrayTime() async {
    var date = DateFormat("dd-MM-yyyy").format(DateTime.now());
    Uri url = Uri.parse(
        "https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt");
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    PrayTimeResponse prayTimeResponse = PrayTimeResponse.fromJson(json);
    return prayTimeResponse;
  }
}
