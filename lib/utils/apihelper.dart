import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/screen/home/model/homemodel.dart';

class Apihelper {

  Future<Homemodel?> movieApiCalling(String movie) async {
    String link =
        "https://imdb8.p.rapidapi.com/auto-complete?q=$movie";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "19c83df79cmsh6882f0907a2503ep10b207jsn1ba7b313aad2",
      "X-RapidAPI-Host": "imdb8.p.rapidapi.com"
    });
    var json = jsonDecode(response.body);
    Homemodel homemodel = Homemodel.fromJson(json);
    return homemodel;
  }
}
