import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherBloc weatherDatabloc;
  @override
  void initState() {
    weatherDatabloc = BlocProvider.of<WeatherBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather Forecast"),
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            IconButton(
                icon: Icon(Icons.forward),
                onPressed: () {
                  // bloc.add(SecondScreenNavigationEvent());
                  Navigator.pushNamed(context, AppRoutes.catFactScreen);
                })
          ],
        ),
        body: BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {},
            child: BlocBuilder<WeatherBloc, WeatherState>(
                bloc: weatherDatabloc,
                builder: (context, state) {
                  if (state is WeatherloadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is WeatherFailureState) {
                    return Center(
                      child: Text("Try again"),
                    );
                  }
                  if (state is WeatherLoadedState) {
                    return SafeArea(
                      child: ListView.builder(
                          itemCount: state.weatherData.dataseries.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(state
                                      .weatherData.dataseries[index].timepoint
                                      .toString()),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Text("Temperature: "),
                                          Text(state.weatherData
                                              .dataseries[index].temp2m
                                              .toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Wind: "),
                                          Text(state.weatherData
                                              .dataseries[index].wind10m.speed
                                              .toString()),
                                          Text(state
                                              .weatherData
                                              .dataseries[index]
                                              .wind10m
                                              .direction),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Transparency: "),
                                          Text(state.weatherData
                                              .dataseries[index].transparency
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return Container();
                  }
                })));
  }
}
