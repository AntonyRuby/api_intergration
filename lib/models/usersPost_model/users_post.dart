class UsersPost {
  String name;
  String job;
  String id;
  String createdAt;

  UsersPost({
    this.name,
    this.job,
    this.id,
    this.createdAt,
  });

  factory UsersPost.fromJson(Map<String, dynamic> json) {
    return UsersPost(
      name: json['name'] as String,
      job: json['job'] as String,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
    };
  }
}
