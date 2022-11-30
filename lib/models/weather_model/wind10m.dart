class Wind10m {
  String direction;
  int speed;

  Wind10m({this.direction, this.speed});

  factory Wind10m.fromJson(Map<String, dynamic> json) {
    return Wind10m(
      direction: json['direction'] as String,
      speed: json['speed'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'direction': direction,
      'speed': speed,
    };
  }
}
