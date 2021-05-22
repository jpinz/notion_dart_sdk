import 'RichText.dart';

class ToDo {
  List<RichText>? text = <RichText>[];
  bool? checked;

  ToDo({this.text, this.checked = false});

  ToDo.fromJson(Map<String, dynamic> json) {
    if (json['text'] != null) {
      text = <RichText>[];
      json['text'].forEach((v) {
        text!.add(RichText.fromJson(v));
      });
    }
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text!.map((v) => v.toJson()).toList();
    }
    data['checked'] = checked;
    return data;
  }
}
