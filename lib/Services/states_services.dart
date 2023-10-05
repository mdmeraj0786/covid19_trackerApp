import 'dart:convert';

import 'package:covid_19_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatesModel.dart';


class StatesServices{

  Future<WorldStatesModel> fetchWorkedStatesRecode() async {

    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("Error");
    }
  }
}