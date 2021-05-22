import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

import 'package:notion_sdk/notion_sdk.dart';
import 'package:notion_sdk/src/globals.dart' as globals;

class BlockAPI {
  final http.Client httpClient;
  Map<String, String> headers;

  BlockAPI({required this.httpClient, required this.headers});

  Future<Results> getBlocks(String blockId) async {
    final url = '${globals.baseUrl}/blocks/$blockId/children';
    final response = await httpClient.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('error getting getBlocks on $blockId');
    }

    return Results.fromJson(jsonDecode(response.body));
  }

  Future<Block> appendBlock(String blockId, Block block) async {
    final url = '${globals.baseUrl}/blocks/$blockId/children';
    final response =
        await httpClient.patch(Uri.parse(url), headers: headers, body: {
      'children': [block]
    });

    if (response.statusCode != 200) {
      throw Exception('error appending a block to $blockId');
    }

    return Block.fromJson(jsonDecode(response.body));
  }

  Future<List<Block>> appendBlocks(String blockId, List<Block> blocks) async {
    final url = '${globals.baseUrl}/blocks/$blockId/children';
    final response = await httpClient
        .patch(Uri.parse(url), headers: headers, body: {'children': blocks});

    if (response.statusCode != 200) {
      throw Exception('error appending blocks to $blockId');
    }
    var responseBlocks = <Block>[];
    for (var item in jsonDecode(response.body)) {
      responseBlocks.add(item);
    }
    return responseBlocks;
  }
}
