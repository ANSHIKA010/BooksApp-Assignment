import 'dart:convert';

import 'package:booksapp_asign/services/snackbar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



class FetchData {



  static FetchData instance = FetchData();

  Future<Map<String, dynamic>> getData() async {
    var response = await http.post(
      Uri.parse("https://api.thenotary.app/lead/getLeads"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "notaryId": "643074200605c500112e0902",
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if(data!=null && data["leads"]!= null){
        SnackBarService.instance.showSnackBarSuccess("Confirmed");
      }
      else{
        SnackBarService.instance.showSnackBarError("Failed to load data");
      }
      return data;

    } else {

      SnackBarService.instance.showSnackBarError("An Error occurred!");
      throw Exception('Failed to fetch data from the API');
    }
  }
}
