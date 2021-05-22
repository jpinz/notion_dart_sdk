import 'Block.dart';

class Results {
  String object = 'list';
  List<Block>? block = <Block>[];
  String? nextCursor;
  bool hasMore = false;

  Results(
      {this.object = 'list',
      this.block,
      this.nextCursor,
      this.hasMore = false});

  Results.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        block!.add(Block.fromJson(v));
      });
    }
    nextCursor = json['next_cursor'];
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    if (block != null) {
      data['block'] = block!.map((v) => v.toJson()).toList();
    }
    data['next_cursor'] = nextCursor;
    data['has_more'] = hasMore;
    return data;
  }
}
