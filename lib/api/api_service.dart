import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();
  static const String baseUrl = 'http://localhost:3000';
  static Future<dynamic> getUser() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http('localhost:3000', '/auth/get');
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print("Response");
    } else {
      print('Error');
    }
  }

  static Future<String> userLogin(
      String email, String password, Function(String) onLoginResult) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.parse('$baseUrl/auth/login');
    var data = {
      'email': email,
      'password': password,
    };
    var response =
        await client.post(url, body: jsonEncode(data), headers: requestHeaders);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print(responseData);
      onLoginResult(responseData!.message);
      return 'success';
    } else {
      print('Error');
      onLoginResult('Login failed');
      return 'error';
    }
  }
}
