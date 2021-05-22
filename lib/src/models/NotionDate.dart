class NotionDate {
  DateTime? start;
  DateTime? end;

  NotionDate({required this.start, this.end});

  NotionDate.fromJson(Map<String, dynamic> json) {
    start = json['start'] != null ? DateTime.parse(json['start']) : null;
    end = json['end'] != null ? DateTime.parse(json['end']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (start != null) {
      data['start'] = start.toString();
    }
    if (end != null) {
      data['end'] = end.toString();
    }
    return data;
  }
}
