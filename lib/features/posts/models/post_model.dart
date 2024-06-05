// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostData {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostData.fromMap(Map<String, dynamic> map) {
    return PostData(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostData.fromJson(String source) =>
      PostData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostData(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant PostData other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
