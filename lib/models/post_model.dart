import 'package:articlex/config/local_storage/local_storage.dart';

class PostModel {
  int id = 0;
  int userId = 0;
  String title = "";
  String body = "";
  bool isFavorite = false;

  PostModel(
      {this.id = 0,
      this.userId = 0,
      this.title = "",
      this.body = "",
      this.isFavorite = false});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['userId'] ?? 0;
    title = json['title'] ?? "";
    body = json['body'] ?? "";
    isFavorite = LocalStorage.favoritePosts.contains(id);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostModel && runtimeType == other.runtimeType && id == other.id;

  @override
  toString() => title;

  @override
  int get hashCode => id.hashCode;
}
