import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';

class QOTDataService {
  static Future<QOTDataModel> fetchData(BuildContext context) async {
    var uri = "https://favqs.com/api/qotd";
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        return QOTDataModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      var snackBar = SnackBar(content: Text("$e"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    throw "An Error Occurred";
  }
}
