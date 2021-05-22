import 'package:notion_sdk/notion_sdk.dart';
import 'package:http/http.dart' as http;

void main() async {
  final apiKey = '';

  var pageId = '';
  var userId = '';
  var databaseId = '';

  var hClient = http.Client();
  var client = NotionClient(httpClient: hClient, apiKey: apiKey);

  var block = await client.blockApi.getBlocks(pageId);
  var page = await client.pageApi.getPage(pageId);
  var user = await client.userApi.getUser(userId);

  var database = await client.databaseApi.getDatabase(databaseId);
  var databaseQuery = await client.databaseApi.queryDatabase(databaseId);

  // Get the first block ID in a page
  print(block.blocks![0].id);

  // Get the page title
  print(page.getTitle());

  // Get user name
  print(user.name);

  // Get database info and query
  print(database.id);
  print(databaseQuery.page![0].id);
}
