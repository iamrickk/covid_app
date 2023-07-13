import 'dart:convert';

import 'package:covid_app/Utils/api_url.dart';
import 'package:http/http.dart' as http;

import '../Model/World_stats.dart';

class StatesServices {
  Future<WorldStats> fetchWorldstateRecords() async {
    final response = await http.get(Uri.parse(ApiUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStats.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }



    Future<List<dynamic>> countriesListApi() async {
    var data ;
    final response = await http.get(Uri.parse(ApiUrl.countriesList));
    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
       data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
