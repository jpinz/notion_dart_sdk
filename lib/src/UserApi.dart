import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

import 'package:notion_sdk/src/globals.dart' as globals;

import 'models/User.dart';

class UserAPI {
  final http.Client httpClient;
  Map<String, String> headers;

  UserAPI({required this.httpClient, required this.headers});

  Future<User> getUser(String userId) async {
    final url = '${globals.baseUrl}/users/$userId';
    final response = await httpClient.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('error getting the page');
    }

    return User.fromJson(jsonDecode(response.body));
  }
}
