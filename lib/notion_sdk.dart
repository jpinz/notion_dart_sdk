library notion_sdk;

import 'package:http/http.dart' as http;
import 'package:notion_sdk/src/BlockApi.dart';
import 'package:notion_sdk/src/PageApi.dart';
import 'package:notion_sdk/src/UserApi.dart';
import 'package:notion_sdk/src/DatabaseApi.dart';

export 'src/models/Annotations.dart';
export 'src/models/Block.dart';
export 'src/models/ChildPage.dart';
export 'src/models/Heading.dart';
export 'src/models/Mention.dart';
export 'src/models/Page.dart';
export 'src/models/Results.dart';
export 'src/models/RichText.dart';
export 'src/models/Todo.dart';
export 'src/models/Select.dart';
export 'src/models/NotionDate.dart';
export 'src/models/Database.dart';
export 'src/models/Properties.dart';

class NotionClient {
  final http.Client httpClient;
  final String apiKey;
  String notionVersion;
  late BlockAPI blockApi;
  late PageAPI pageApi;
  late UserAPI userApi;
  late DatabaseAPI databaseApi;
  late Map<String, String> headers;

  NotionClient({
    required this.httpClient,
    required this.apiKey,
    this.notionVersion = '2021-05-13',
  }) {
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
      'NotionVersion': notionVersion,
    };
    blockApi = BlockAPI(httpClient: httpClient, headers: headers);
    pageApi = PageAPI(httpClient: httpClient, headers: headers);
    userApi = UserAPI(httpClient: httpClient, headers: headers);
    databaseApi = DatabaseAPI(httpClient: httpClient, headers: headers);
  }

  Map<String, dynamic> toMap() {
    return {
      'apiKey': apiKey,
      'notionVersion': notionVersion,
    };
  }

  @override
  String toString() =>
      'NotionClient(httpClient: $httpClient, apiKey: $apiKey, notionVersion: $notionVersion)';
}
