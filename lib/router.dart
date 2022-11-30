import 'package:bloc_counter/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_counter/screen/cat_fact_screen/bloc/catfact_bloc.dart';
import 'package:bloc_counter/screen/cat_fact_screen/cat_fact_screen.dart';
import 'package:bloc_counter/screen/second_screen/bloc/secondscreen_bloc.dart';
import 'package:bloc_counter/screen/users_api_screen/users_api_screen.dart';
import 'package:bloc_counter/screen/users_post_screen/users_post_screen.dart';
import 'package:bloc_counter/screen/users_screen/bloc/users_bloc.dart';
import 'package:bloc_counter/screen/users_screen/users_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/second_screen/second_screen.dart';
import 'screen/users_api_screen/bloc/usersapi_bloc.dart';
import 'screen/users_post_screen/bloc/userspost_bloc.dart';
import 'screen/weather_screen/bloc/weather_bloc.dart';
import 'screen/weather_screen/weather_screen.dart';

class AppRoutes {
  static const secondScreen = 'second_screen';

  static const weatherScreen = 'weather_screen';

  static const catFactScreen = 'catFact_screen';
  static const usersScreen = 'users_screen';
  static const usersPostScreen = 'usersPost_screen';
  static const usersapiScreen = 'usersapi_screen';
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.secondScreen:
      return _buildSecondScreen();
    case AppRoutes.weatherScreen:
      return _buildWeatherScreen();

    case AppRoutes.catFactScreen:
      return _buildCatFactScreen();

    case AppRoutes.usersScreen:
      return _buildUsersScreen();

    case AppRoutes.usersPostScreen:
      return _buildUsersPostScreen();

    case AppRoutes.usersapiScreen:
      return _buildUsersapiScreen();
  }
}

Route<dynamic> _buildSecondScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(context, PageBuilder.buildSecondScreen()),
  );
}

Route<dynamic> _buildWeatherScreen() {
  return MaterialPageRoute(
    builder: (context) =>
        addAuthBloc(context, PageBuilder.buildWeatherScreen()),
  );
}

Route<dynamic> _buildCatFactScreen() {
  return MaterialPageRoute(
    builder: (context) =>
        addAuthBloc(context, PageBuilder.buildCatFactScreen()),
  );
}

Route<dynamic> _buildUsersScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(context, PageBuilder.buildUsersScreen()),
  );
}

Route<dynamic> _buildUsersPostScreen() {
  return MaterialPageRoute(
    builder: (context) =>
        addAuthBloc(context, PageBuilder.buildUsersPostScreen()),
  );
}

Route<dynamic> _buildUsersapiScreen() {
  return MaterialPageRoute(
    builder: (context) =>
        addAuthBloc(context, PageBuilder.buildUsersapiScreen()),
  );
}

class PageBuilder {
  static Widget buildSecondScreen() {
    return BlocProvider(
      create: (context) {
        return SecondscreenBloc()..add(SecondscreenInitialEvent());
      },
      child: SecondScreen(),
    );
  }

  static Widget buildWeatherScreen() {
    return BlocProvider(
      create: (context) {
        return WeatherBloc()..add(WeatherScreenInitialEvent());
      },
      child: WeatherScreen(),
    );
  }

  static Widget buildCatFactScreen() {
    return BlocProvider(
      create: (context) {
        return CatFactBloc()..add(CatFactInitialEvent());
      },
      child: CatFactScreen(),
    );
  }

  static Widget buildUsersScreen() {
    return BlocProvider(
      create: (context) {
        return UsersBloc()..add(UsersInitialEvent());
      },
      child: UsersScreen(),
    );
  }

  static Widget buildUsersPostScreen() {
    return BlocProvider(
      create: (context) {
        return UsersPostBloc()..add(UsersPostInitialEvent());
      },
      child: UsersPostScreen(),
    );
  }

  static Widget buildUsersapiScreen() {
    return BlocProvider(
      create: (context) {
        return UsersapiBloc()..add(UsersApiInitialEvent());
      },
      child: UsersAPIScreen(),
    );
  }
}

Widget addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      if (state is AuthenticationAuthenticated) {
        Navigator.pushReplacementNamed(context, AppRoutes.secondScreen);
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
}
