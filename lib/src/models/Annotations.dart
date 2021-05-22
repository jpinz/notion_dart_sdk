class Annotations {
  bool bold = false;
  bool italic = false;
  bool strikethrough = false;
  bool underline = false;
  bool code = false;
  String color = 'default';

  Annotations(
      {required this.bold,
      required this.italic,
      required this.strikethrough,
      required this.underline,
      required this.code,
      required this.color});

  Annotations.fromJson(Map<String, dynamic> json) {
    bold = json['bold'];
    italic = json['italic'];
    strikethrough = json['strikethrough'];
    underline = json['underline'];
    code = json['code'];
    color = json['color'];
  }

  Annotations.empty() {
    bold = false;
    italic = false;
    strikethrough = false;
    underline = false;
    code = false;
    color = 'default';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bold'] = bold;
    data['italic'] = italic;
    data['strikethrough'] = strikethrough;
    data['underline'] = underline;
    data['code'] = code;
    data['color'] = color;
    return data;
  }
}
