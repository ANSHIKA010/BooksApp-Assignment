import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchData{

  static FetchData instance = FetchData();
  Future<dynamic> getData() async {
    var response = await http.post(
      Uri.parse( "https://api.thenotary.app/lead/getLeads"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "notaryId": "643074200605c500112e0902",
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response,
      // then parse the JSON.
      return response.body;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to post data');
    }
  }

}
