import 'status.dart';

class CatFact {
  Status status;
  String type;
  bool deleted;
  String id;
  String user;
  String text;
  int v;
  String source;
  String updatedAt;
  String createdAt;
  bool used;

  CatFact({
    this.status,
    this.type,
    this.deleted,
    this.id,
    this.user,
    this.text,
    this.v,
    this.source,
    this.updatedAt,
    this.createdAt,
    this.used,
  });

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      type: json['type'] as String,
      deleted: json['deleted'] as bool,
      id: json['_id'] as String,
      user: json['user'] as String,
      text: json['text'] as String,
      v: json['__v'] as int,
      source: json['source'] as String,
      updatedAt: json['updatedAt'] as String,
      createdAt: json['createdAt'] as String,
      used: json['used'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status?.toJson(),
      'type': type,
      'deleted': deleted,
      '_id': id,
      'user': user,
      'text': text,
      '__v': v,
      'source': source,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'used': used,
    };
  }
}
