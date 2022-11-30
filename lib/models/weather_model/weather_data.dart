import 'dataseries.dart';

class WeatherData {
  String product;
  String init;
  List<Dataseries> dataseries;

  WeatherData({
    this.product,
    this.init,
    this.dataseries,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      product: json['product'] as String,
      init: json['init'] as String,
      dataseries: (json['dataseries'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Dataseries.fromJson(e as Map<String, dynamic>))
          ?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'init': init,
      'dataseries': dataseries?.map((e) => e?.toJson())?.toList(),
    };
  }
}
