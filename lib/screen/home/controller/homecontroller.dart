import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:movie_api/utils/apihelper.dart';

import '../model/homemodel.dart';

class Homecontroller extends GetxController
{
  RxString movie="race".obs;
  Future<Homemodel?> getApiData(String movie)
  async {
    Apihelper apihelper = Apihelper();
    Homemodel? h1 = await apihelper.movieApiCalling(movie);
    return h1;
  }
  TextEditingController txtname = TextEditingController();
}