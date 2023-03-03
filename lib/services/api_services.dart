import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import '../constants/api_consts.dart';
import '../models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("https://api.openai.com/v1/models"),
        headers: {'Authorization': 'Bearer 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'},
      );

      print(response.body);
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      // print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        // log("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log("error $error");
      rethrow;
    }
  }

}