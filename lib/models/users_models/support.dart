class Support {
  String url;
  String text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'] as String,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'text': text,
    };
  }
}
