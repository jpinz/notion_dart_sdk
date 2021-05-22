import 'ChildPage.dart';
import 'Heading.dart';
import 'RichText.dart';
import 'ToDo.dart';

class Block {
  String object = 'block';
  late String id;
  late String createdTime;
  late String lastEditedTime;
  bool hasChildren = false;
  late String type;
  Heading? heading;
  RichTexts? paragraph;
  RichTexts? bulletedListItem;
  RichTexts? numberedListItem;
  ToDo? toDo;
  ChildPage? childPage;

  Block(
      {required this.object,
      required this.id,
      required this.createdTime,
      required this.lastEditedTime,
      required this.hasChildren,
      required this.type,
      this.heading,
      this.paragraph,
      this.bulletedListItem,
      this.numberedListItem,
      this.toDo,
      this.childPage});

  Block.fromJson(Map<String, dynamic> json) {
    log.info("Building Block with ID: $json['id']");
    object = json['object'];
    id = json['id'];
    createdTime = json['created_time'];
    lastEditedTime = json['last_edited_time'];
    hasChildren = json['has_children'];
    type = json['type'];
    if (json['heading_1'] != null) {
      heading = Heading.fromJson(json['heading_1'], 1);
    }
    if (json['heading_2'] != null) {
      heading = Heading.fromJson(json['heading_2'], 2);
    }
    if (json['heading_3'] != null) {
      heading = Heading.fromJson(json['heading_3'], 33);
    }
    if (json['paragraph'] != null) {
      if (json['paragraph']['text'].length > 0) {
        paragraph = RichTexts.fromTextList(json['paragraph']['text']);
      } else {
        paragraph = RichTexts.empty();
      }
    }
    bulletedListItem = json['bulleted_list_item'] != null
        ? RichTexts.fromJson(json['bulleted_list_item'])
        : null;
    numberedListItem = json['numbered_list_item'] != null
        ? RichTexts.fromJson(json['numbered_list_item'])
        : null;
    toDo = json['to_do'] != null ? ToDo.fromJson(json['to_do']) : null;
    childPage = json['child_page'] != null
        ? ChildPage.fromJson(json['child_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['created_time'] = createdTime;
    data['last_edited_time'] = lastEditedTime;
    data['has_children'] = hasChildren;
    data['type'] = type;
    if (heading != null) {
      switch (heading!.size) {
        case 1:
          data['heading_1'] = heading!.toJson();
          break;
        case 2:
          data['heading_2'] = heading!.toJson();
          break;
        case 3:
          data['heading_3'] = heading!.toJson();
          break;
        default:
          data['heading_1'] = heading!.toJson();
          break;
      }
    }
    if (paragraph != null) {
      data['paragraph'] = paragraph!.toJson();
    }
    if (bulletedListItem != null) {
      data['bulleted_list_item'] = bulletedListItem!.toJson();
    }
    if (numberedListItem != null) {
      data['numbered_list_item'] = numberedListItem!.toJson();
    }
    if (toDo != null) {
      data['to_do'] = toDo!.toJson();
    }
    if (childPage != null) {
      data['child_page'] = childPage!.toJson();
    }
    return data;
  }
}
