import 'package:notion_sdk/src/BlockApi.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  final apiKey = 'apiKey';
  group('Blocks API Tests', () {
    late BlockAPI blockApi;

    setUp(() {
      var client = http.Client();
      blockApi = BlockAPI(httpClient: client, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      });
    });

    test('checkBlocks', () async {
      expect(
          await blockApi
              .getBlocks('pageId')
              .then((value) => value.blocks![0].id),
          'expectedFirstBlockId');
    });
  });
}
