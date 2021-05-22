<!-- markdownlint-disable -->
<div align="center">
    <h1>Notion SDK for Dart</h1>
    <p>
        <b>A dart implemention for the <a href="https://developers.notion.com">Notion SDK</a></b>
    </p>
</div>
<!-- markdownlint-enable -->

This library is a **WIP** dart implementation of the [JavaScript SDK](https://github.com/makenotion/notion-sdk-js)

> This library is in beta, please report on
> [GitHub Issues](https://github.com/jpinz/notion_dart_api/issues) any issues
> you come across

<!-- markdownlint-disable -->
## Usage

Import and initialize a client using an [**integration token**](https://www.notion.com/my-integrations) or an
OAuth [**access token**](https://developers.notion.com/docs/authorization).

```dart
  import 'package:http/http.dart' as http;

  final apiKey = '';

  var hClient = http.Client();
  var client = NotionClient(httpClient: hClient, apiKey: apiKey);
```
