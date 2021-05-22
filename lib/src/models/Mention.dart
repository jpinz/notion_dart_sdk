import 'User.dart';

class Mention {
  late String type;
  Date? date;
  User? user;

  Mention({required this.type, this.date, this.user});

  Mention.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Date {
  late String start;
  String? end;

  Date({required this.start, this.end});

  Date.fromJson(Map<String, dynamic> json) {
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}
