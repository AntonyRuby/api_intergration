import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter/http/repository/home_repository.dart';
import 'package:bloc_counter/models/user_api_models/user_api.dart';
import 'package:equatable/equatable.dart';

part 'usersapi_event.dart';
part 'usersapi_state.dart';

class UsersapiBloc extends Bloc<UsersapiEvent, UsersapiState> {
  UsersapiBloc() : super(UsersapiInitialState());

  List<UserApi> userslist = [];
  String message;

  @override
  Stream<UsersapiState> mapEventToState(
    UsersapiEvent event,
  ) async* {
    if (event is UsersApiInitialEvent) {
      yield UsersapiLoadingState();

      Map<String, dynamic> users = await getAllUser();

      if (users["success"] == true) {
        List<dynamic> jsondata = (users["data"]);
        jsondata.forEach((element) {
          userslist.add(UserApi.fromJson(element));
        });
        yield UsersapiLoadedState();
      } else {
        message = users["data"];
        yield UsersapiFailureState();
      }
    }
  }
}
