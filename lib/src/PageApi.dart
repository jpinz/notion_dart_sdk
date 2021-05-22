import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

import 'package:notion_sdk/notion_sdk.dart';
import 'package:notion_sdk/src/globals.dart' as globals;

class PageAPI {
  final http.Client httpClient;
  Map<String, String> headers;

  PageAPI({required this.httpClient, required this.headers});

  Future<Results> getPage(String pageId) async {
    final url = '${globals.baseUrl}/pages/$pageId';
    final response = await httpClient.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('error getting the page');
    }

    return Results.fromJson(jsonDecode(response.body));
  }
}
