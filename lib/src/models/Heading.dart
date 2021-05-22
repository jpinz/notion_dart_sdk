import 'RichText.dart';

class Heading {
  int size = 1;
  List<RichText>? text = <RichText>[];

  Heading({required this.size, required this.text});

  Heading.fromJson(Map<String, dynamic> json, int size) {
    if (json['text'] != null) {
      text = <RichText>[];
      json['text'].forEach((v) {
        text!.add(RichText.fromJson(v));
      });
    }
    this.size = size;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (text != null) {
      data['text'] = text!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
