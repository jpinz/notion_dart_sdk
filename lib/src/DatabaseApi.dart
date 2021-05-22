import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

import 'package:notion_sdk/notion_sdk.dart';
import 'package:notion_sdk/src/globals.dart' as globals;

class DatabaseAPI {
  final http.Client httpClient;
  Map<String, String> headers;

  DatabaseAPI({required this.httpClient, required this.headers});

  Future<Database> getDatabase(String databaseId) async {
    final url = '${globals.baseUrl}/databases/$databaseId';
    final response = await httpClient.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('error getting the database');
    }

    return Database.fromJson(jsonDecode(response.body));
  }

  Future<Results> queryDatabase(String databaseId) async {
    final url = '${globals.baseUrl}/databases/$databaseId/query';
    final response = await httpClient.post(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('error querying the database');
    }

    return Results.fromJson(jsonDecode(response.body));
  }
}
