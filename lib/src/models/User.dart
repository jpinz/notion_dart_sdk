class User {
  late String object;
  late String id;
  String? name = 'Name';
  String? avatarUrl;
  String? type;
  dynamic person;
  dynamic bot;

  User(
      {required this.object,
      required this.id,
      this.name,
      this.avatarUrl,
      this.type,
      this.person});

  User.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    id = json['id'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    type = json['type'];
    person = json['person'];
    bot = json['bot'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    data['id'] = id;
    data['name'] = name;
    data['avatar_url'] = avatarUrl;
    data['type'] = type;
    data['person'] = person;

    return data;
  }
}
