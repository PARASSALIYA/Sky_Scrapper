import 'package:sky_scrapper/header.dart';
import 'package:http/http.dart' as http;

import '../model/weatherday_model.dart';

class WetherHelper {
  static WetherHelper wetherHelper = WetherHelper._();
  WetherHelper._();
  Future<WetherModel?> getWether(String selectedCity) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?lat=q&lon=q&appid=15bfc31f33403c7f27ce148ecb92abaf&units=metric&q=$selectedCity";

    http.Response response = await http.get(
      Uri.parse(link),
    );

    if (response.statusCode == 200) {
      var allData = jsonDecode(response.body);
      WetherModel data = WetherModel.mapToModel(allData);
      return data;
    }
    return null;
  }

  Future<void> saveSearchHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList("searchHistory", history);
  }

  Future<List<String>> getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("searchHistory") ?? [];
  }
}
