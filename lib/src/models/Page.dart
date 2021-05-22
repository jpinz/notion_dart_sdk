import 'package:notion_sdk/notion_sdk.dart';

class Page {
  String object = 'page';
  late String id;
  late String createdTime;
  late String lastEditedTime;
  Parent? parent;
  bool archived = false;
  late Properties properties;

  Page(
      {this.object = 'page',
      required this.id,
      required this.createdTime,
      required this.lastEditedTime,
      this.parent,
      this.archived = false,
      required this.properties});

  Page.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    createdTime = json['created_time'];
    lastEditedTime = json['last_edited_time'];
    parent = Parent.fromJson(json['parent']);
    archived = json['archived'];
    properties = Properties.fromJson(json['properties'], isQuery: true);
  }

  String getTitle() {
    return properties.getProperty('title')!.value.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    data['archived'] = archived;
    data['properties'] = properties.toJson();

    return data;
  }
}

class Parent {
  late String type;
  bool? workspace;
  String? pageId;
  String? databaseId;

  Parent(
      {required this.type,
      this.workspace = false,
      this.pageId = '',
      this.databaseId = ''});

  Parent.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    workspace = json['workspace'] ?? false;
    pageId = json['page_id'] ?? '';
    databaseId = json['database_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['workspace'] = workspace;
    data['page_id'] = pageId;
    data['database_id'] = databaseId;
    return data;
  }
}
