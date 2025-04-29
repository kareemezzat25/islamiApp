import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islami_app/models/praytimeResponse.dart';
import 'package:islami_app/models/radioresponse.dart';
import 'package:islami_app/models/recitersmodel.dart';
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

  @override
  Future<RadioResponseModel> getRadio() async {
    Uri url = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);

    RadioResponseModel radioResponseModel = RadioResponseModel.fromJson(json);
    return radioResponseModel;
  }

  @override
  Future<RecitersModel> getReciters() async {
    Uri url = Uri.parse("https://www.mp3quran.net/api/v3/reciters?language=ar");
    http.Response response = await http.get(url);

    var json = jsonDecode(response.body);
    RecitersModel recitersModel = RecitersModel.fromJson(json);
    return recitersModel;
  }
}
