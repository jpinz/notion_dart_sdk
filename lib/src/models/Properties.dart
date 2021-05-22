import 'package:enum_to_string/enum_to_string.dart';
import 'package:notion_sdk/src/models/NotionDate.dart';
import 'package:notion_sdk/src/models/Number.dart';
import 'package:notion_sdk/src/models/RichText.dart';
import 'package:notion_sdk/src/models/Select.dart';

class Properties {
  Map<String, Property> properties = <String, Property>{};

  Properties({required this.properties});

  Properties.fromJson(Map<String, dynamic> json,
      {bool isDatabase = false, bool isQuery = false}) {
    json.forEach((k, v) {
      properties[k] = Property.fromJson(v, isDatabase, isQuery);
    });
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    properties.forEach((k, v) {
      data['properties'].add(k, v);
    });

    return data;
  }

  Property? getProperty(String property) {
    return properties[property];
  }
}

enum PropertyType {
  title,
  text,
  rich_text,
  number,
  select,
  multi_select,
  date,
  people,
  file,
  checkbox,
  url,
  email,
  phone_number,
  formula,
  relation,
  rollup,
  created_time,
  created_by,
  last_edited_time,
  last_edited_by,
  unknown
}

class Property {
  late String id;
  PropertyType type = PropertyType.unknown;

  dynamic value;

  Property({required this.id, required this.type});

  Property.fromJson(Map<String, dynamic> json, bool isDatabase, bool isQuery) {
    id = json['id'];
    type = EnumToString.fromString(PropertyType.values, json['type']) ??
        PropertyType.unknown;

    switch (type) {
      case PropertyType.title:
        value = !(json['title'].isEmpty)
            ? RichTexts.fromTextList(json['title'])
            : RichTexts.empty();
        break;
      case PropertyType.date:
        value = NotionDate.fromJson(json['date']);
        break;
      case PropertyType.text:
        value = RichTexts.fromTextList(json['text']);
        break;
      case PropertyType.rich_text:
        value = RichTexts.empty();
        break;
      case PropertyType.select:
        if (isDatabase == true && isQuery == false) {
          value = DatabaseSelect.fromJson(json['select']);
        } else if (isQuery == false) {
          value = PageSelect.fromJson(json['select']);
        } else {
          value = Select.fromJson(json['select']);
        }
        break;
      case PropertyType.multi_select:
        if (isDatabase == true && isQuery == false) {
          value = DatabaseSelect.fromJson(json['multi_select']);
        } else {
          value = MultiSelect.fromList(json['multi_select']);
        }
        break;
      case PropertyType.number:
        value = Number.fromJson(json, isQuery);
        break;
      case PropertyType.checkbox:
        value = json['checkbox'];
        break;
      case PropertyType.email:
        value = json['email'];
        break;
      default:
        value = null;
        break;
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type);

    return data;
  }
}
