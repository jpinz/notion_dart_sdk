import 'package:notion_sdk/src/models/Block.dart';
import 'package:notion_sdk/src/models/Page.dart';

class Results {
  String object = 'list';
  List<Block>? blocks = <Block>[];
  List<Page>? page = <Page>[];
  String? nextCursor;
  bool hasMore = false;

  Results(
      {this.object = 'list',
      this.blocks,
      this.page,
      this.nextCursor,
      this.hasMore = false});

  Results.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        if (v['object'] == 'block') {
          blocks!.add(Block.fromJson(v));
        }
        if (v['object'] == 'page') {
          page!.add(Page.fromJson(v));
        }
      });
    }
    nextCursor = json['next_cursor'];
    hasMore = json['has_more'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['object'] = object;
    if (blocks != null) {
      data['block'] = blocks!.map((v) => v.toJson()).toList();
    }
    data['next_cursor'] = nextCursor;
    data['has_more'] = hasMore;
    return data;
  }
}
