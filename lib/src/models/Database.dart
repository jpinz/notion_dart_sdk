import 'package:notion_sdk/src/models/Properties.dart';
import 'package:notion_sdk/src/models/RichText.dart';

class Database {
  String object = 'database';
  late String id;
  late DateTime createdTime;
  late DateTime lastEditedTime;
  late RichTexts title;
  late Properties properties;

  Database(
      {required this.object,
      required this.id,
      required this.createdTime,
      required this.lastEditedTime,
      required this.title,
      required this.properties});

  Database.fromJson(Map<String, dynamic> json, {bool isQuery = false}) {
    object = json['object'];
    id = json['id'];
    createdTime = DateTime.parse(json['created_time']);
    lastEditedTime = DateTime.parse(json['last_edited_time']);
    title = RichTexts.fromTextList(json['title']);
    properties = Properties.fromJson(json['properties'],
        isDatabase: true, isQuery: isQuery);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    data['title'] = title.toJson();
    data['properties'] = properties.toJson();

    return data;
  }
}
