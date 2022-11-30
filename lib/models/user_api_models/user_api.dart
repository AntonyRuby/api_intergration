class UserApi {
  int id;
  String name;

  UserApi({this.id, this.name});

  factory UserApi.fromJson(Map<String, dynamic> json) {
    return UserApi(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
