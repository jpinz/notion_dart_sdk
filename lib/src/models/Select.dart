class DatabaseSelect {
  List<Option> options = <Option>[];

  DatabaseSelect({required this.options});

  DatabaseSelect.fromJson(Map<String, dynamic> json) {
    json['options'].forEach((v) {
      options.add(Option.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['options'] = options.map((v) => v.toJson()).toList();

    return data;
  }
}

class PageSelect {
  late Option option;

  PageSelect({required this.option});

  PageSelect.fromJson(Map<String, dynamic> json) {
    option = Option.fromJson(json['option']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['option'] = option.toJson();

    return data;
  }
}

class Select {
  late Option option;

  Select({required this.option});

  Select.fromJson(Map<String, dynamic> json) {
    option = Option.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return option.toJson();
  }
}

class MultiSelect {
  List<Option> options = <Option>[];

  MultiSelect({required this.options});

  MultiSelect.fromJson(Map<String, dynamic> json) {
    json.forEach((k, v) {
      options.add(Option.fromJson(v));
    });
  }

  MultiSelect.fromList(List<dynamic> options) {
    options.forEach((v) {
      this.options.add(Option.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['options'] = options.map((v) => v.toJson()).toList();

    return data;
  }
}

class Option {
  late String id;
  late String name;
  late String color;

  Option({required this.id, required this.name, required this.color});

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}
