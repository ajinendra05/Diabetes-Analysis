import 'package:flutter/scheduler.dart';

class DataModel {
  // pregnant,insulin,bmi,age,glucose,bp,pedigree
  static int? id;
  static double? pregnant;
  static double? insulin;
  static double? bmi;
  static double? age;
  static double? glucose;
  static double? bp;
  static double? pedigree;
  static String? estimated_result;
  static double? estimated_Proba;

  // DataModel.fromJson(Map<String, dynamic> json) {
  //   state = json['state'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['DO'] = DO;
  //   data['BOD'] = BOD;
  //   data['totalCaliform'] = totalCaliform;
  //   data['fecalCaliform'] = fecalCaliform;

  //   return data;
  // }
}
