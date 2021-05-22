import 'package:enum_to_string/enum_to_string.dart';

enum NumberFormat {
  number,
  number_with_commas,
  percent,
  dollar,
  euro,
  pound,
  yen,
  ruble,
  rupee,
  won,
  yuan,
  unknown
}

class Number {
  NumberFormat format = NumberFormat.number;
  double number = 0;

  Number({required this.format});

  Number.fromJson(Map<String, dynamic> json, bool isQuery) {
    if (isQuery == false && json['number']['format'] != null) {
      format = EnumToString.fromString(
          NumberFormat.values, json['number']['format'])!;
    }
    if (isQuery) {
      number = json['number'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['format'] = format;
    data['number'] = number;
    return data;
  }
}
