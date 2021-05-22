import 'Annotations.dart';
import 'Mention.dart';

class RichText {
  late String type;
  Text? text;
  late Annotations annotations;
  late String plainText;
  String? href;
  Equation? equation;
  Mention? mention;

  RichText(
      {required this.type,
      this.text,
      required this.annotations,
      required this.plainText,
      this.href,
      this.equation,
      this.mention});

  RichText.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'] != null ? Text.fromJson(json['text']) : null;
    annotations = Annotations.fromJson(json['annotations']);
    plainText = json['plain_text'];
    href = json['href'];
    equation =
        json['equation'] != null ? Equation.fromJson(json['equation']) : null;
    mention =
        json['mention'] != null ? Mention.fromJson(json['mention']) : null;
  }

  RichText.empty() {
    type = 'empty';
    annotations = Annotations.empty();
    plainText = '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (text != null) {
      data['text'] = text!.toJson();
    }
    data['annotations'] = annotations.toJson();
    data['plain_text'] = plainText;
    data['href'] = href;
    if (equation != null) {
      data['equation'] = equation!.toJson();
    }
    if (mention != null) {
      data['mention'] = mention!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return plainText;
  }
}

class RichTexts {
  List<RichText> richTexts = <RichText>[];

  RichTexts({required this.richTexts});

  RichTexts.fromJson(Map<String, dynamic> json) {
    if (json['text'] != null) {
      json['text'].forEach((v) {
        richTexts.add(RichText.fromJson(v));
      });
    }
  }

  RichTexts.fromTextList(List<dynamic> text) {
    text.forEach((v) {
      richTexts.add(RichText.fromJson(v));
    });
  }

  RichTexts.empty() {
    richTexts = <RichText>[];
    richTexts.add(RichText.empty());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = <RichText>[];
    richTexts.forEach((v) {
      data['text'].add(v);
    });
    return data;
  }

  @override
  String toString() {
    var text = '';
    for (var richText in richTexts) {
      text += richText.toString();
    }
    return text;
  }
}

class Text {
  late String content;
  String link = '';

  Text({required this.content, this.link = ''});

  Text.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    if (json['link'] != null && json['link']['url'] != null) {
      link = json['link']['url'] ?? '';
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    data['link'] = link;

    return data;
  }
}

class Equation {
  late String expression;

  Equation({required this.expression});

  Equation.fromJson(Map<String, dynamic> json) {
    expression = json['expression'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['expression'] = expression;
    return data;
  }
}
