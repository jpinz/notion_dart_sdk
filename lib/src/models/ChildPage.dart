class ChildPage {
  late String title;

  ChildPage({required this.title});

  ChildPage.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}
