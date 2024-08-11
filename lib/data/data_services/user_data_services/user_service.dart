import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mylearning/data/data_model/user_model/user_model.dart';

class UserDataService {
  static Future<Map<String, dynamic>> createUser(UserModel user, context) async {
    var baseUrl = Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000";
    var uri = "$baseUrl/user";
    try {
      final jsonBody = json.encode(user.toJson());

      final response = await http.post(Uri.parse(uri),
          headers: {'Content-Type': 'application/json'}, body: jsonBody);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var currentUser = UserModel.fromJson(jsonResponse);

        return {
          "status": "success",
          "user": currentUser
        };
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup Failed'),
            backgroundColor: Colors.red,
          ),
        );
        return {
          "status": "failed",
          "user": null
        };
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Oops an error has occurred: $e'),
        backgroundColor: Colors.red,
      ));
      print(e);
    }
    return {
      "status": "idle",
      "user": null
    };
  }

  // static Future<String> fetchUser(){
  //
  // }

}
