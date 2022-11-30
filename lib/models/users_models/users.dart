import 'data.dart';
import 'support.dart';

class Users {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  Users({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data?.map((e) => e?.toJson())?.toList(),
      'support': support?.toJson(),
    };
  }
}
