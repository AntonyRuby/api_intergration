import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_counter/http/repository/home_repository.dart';
import 'package:bloc_counter/models/weather_model/weather_data.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherScreenInitialEvent) {
      yield WeatherloadingState();
      // call api and get weather
      Map<String, dynamic> weatherData = await getWeatherData();
      //  Send weather data to view through WeatherLoadedState if successful
      if (weatherData["success"] == true) {
        Map<String, dynamic> jsonData = json.decode(weatherData["data"]);
        WeatherData weatherObject = WeatherData.fromJson(jsonData);

        yield WeatherLoadedState(weatherData: weatherObject);
      }
      //  Send failure message to view through WeatherFailureState if failed
      else {
        yield WeatherFailureState(weatherData["data"]);
      }
    }
  }
}
