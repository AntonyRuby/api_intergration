import 'package:bloc_counter/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication/bloc/authentication_bloc.dart';
import 'bloc.dart';
import 'screen/home_screen/home_screen.dart';

void main(List<String> args) {
  Bloc.observer = EchoBlocDelegate();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) {
      return AuthenticationBloc()..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AuthenticationBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: getRoute,
      home: addAuthBloc(
        context,
        HomeScreen(bloc),
      ),
    );
  }
}
