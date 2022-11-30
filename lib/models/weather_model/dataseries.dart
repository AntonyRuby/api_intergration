import 'wind10m.dart';

class Dataseries {
  int timepoint;
  int cloudcover;
  int seeing;
  int transparency;
  int liftedIndex;
  int rh2m;
  Wind10m wind10m;
  int temp2m;
  String precType;

  Dataseries({
    this.timepoint,
    this.cloudcover,
    this.seeing,
    this.transparency,
    this.liftedIndex,
    this.rh2m,
    this.wind10m,
    this.temp2m,
    this.precType,
  });

  factory Dataseries.fromJson(Map<String, dynamic> json) {
    return Dataseries(
      timepoint: json['timepoint'] as int,
      cloudcover: json['cloudcover'] as int,
      seeing: json['seeing'] as int,
      transparency: json['transparency'] as int,
      liftedIndex: json['lifted_index'] as int,
      rh2m: json['rh2m'] as int,
      wind10m: json['wind10m'] == null
          ? null
          : Wind10m.fromJson(json['wind10m'] as Map<String, dynamic>),
      temp2m: json['temp2m'] as int,
      precType: json['prec_type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timepoint': timepoint,
      'cloudcover': cloudcover,
      'seeing': seeing,
      'transparency': transparency,
      'lifted_index': liftedIndex,
      'rh2m': rh2m,
      'wind10m': wind10m?.toJson(),
      'temp2m': temp2m,
      'prec_type': precType,
    };
  }
}
