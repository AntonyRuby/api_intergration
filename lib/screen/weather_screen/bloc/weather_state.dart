part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherloadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherData weatherData;
  WeatherLoadedState({this.weatherData});
}

class WeatherFailureState extends WeatherState {
  final String error;
  WeatherFailureState(this.error);
}
