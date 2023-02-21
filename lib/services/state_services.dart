import 'dart:convert';

import 'package:covid_19_tracker/model/world_state_model.dart';
import 'package:covid_19_tracker/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStateModel> fetchWorldStatesRecords()async{
    final respnse = await http.get(Uri.parse(AppUrl.worldStateApi));
    if(respnse.statusCode == 200){
      var data = jsonDecode(respnse.body.toString());
      return WorldStateModel.fromJson(data);
    }
    else{
      throw Exception("Error");
    }
  }


  Future<List<dynamic>> countriesListApi()async{
    var data;
    final respnse = await http.get(Uri.parse(AppUrl.countriesList));
    if(respnse.statusCode == 200){
      data = jsonDecode(respnse.body.toString());
      return data;
    }
    else{
      throw Exception("Error");
    }
  }


}
