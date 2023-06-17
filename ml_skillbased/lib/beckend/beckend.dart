import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../models/project_model.dart';

class Server {
  static const url = 'http://127.0.0.1:5000';

  // static Future<void> fetchState() async {
  //   const currentURL = '$url/get_State_names';

  //   try {
  //     final response = await http.get(
  //       Uri.parse(currentURL),
  //     );
  //     if (response.statusCode == 200) {
  //       final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
  //       kStates = jsonMapData['State'];
  //     } else {
  //       print("error in backend");
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  static Future<void> estimateResult() async {
    const _url = '$url/predict_Class';

    try {
      var data = json.encode({
        'pregnant': DataModel.pregnant,
        'insulin': DataModel.insulin,
        'bmi': DataModel.bmi,
        'age': DataModel.age,
        'glucose': DataModel.glucose,
        'bp': DataModel.bp,
        'pedigree': DataModel.pedigree,
      });
      print(data);
      final response = await http.post(Uri.parse(_url), body: data);

      if (response.statusCode == 200) {
        final jsonMapData = jsonDecode(response.body) as Map<String, dynamic>;
        print(response.body);
        print(jsonMapData['estimated_Quality']);

        DataModel.estimated_result = jsonMapData['estimated_result'];
        DataModel.estimated_Proba = jsonMapData['estimated_Proba'];
        print(DataModel.estimated_Proba);
        print(DataModel.estimated_result);
      } else {
        print("error");
      }
    } catch (err) {
      print(err);
    }
  }
}
