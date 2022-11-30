class Status {
  bool verified;
  int sentCount;

  Status({this.verified, this.sentCount});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      verified: json['verified'] as bool,
      sentCount: json['sentCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'sentCount': sentCount,
    };
  }
}
