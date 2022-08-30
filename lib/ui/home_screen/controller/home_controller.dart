import 'package:flutter/material.dart';
import 'package:new_app/app/models/response/home_response.dart';

import '../../../app/services/services.dart';

class HomeController extends ChangeNotifier {

  //Observable //Dinliyoruz
  List<Article>? homeResponseList = [];


  Services services = Services();

  getData() async {

    homeResponseList = await services.getHomeData();
    notifyListeners();
  }
  
}