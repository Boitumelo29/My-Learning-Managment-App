import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mylearning/data/data_model/quote_of_the_day_data_model.dart';

class QOTDataService {
  static Future<QOTDataModel> fetchData() async {
    var uri = "https://favqs.com/api/qotd";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return QOTDataModel.fromJson(json.decode(response.body));
    }

    throw "An Error Occurred";
  }
}

