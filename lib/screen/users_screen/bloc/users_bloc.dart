import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_counter/http/repository/home_repository.dart';
import 'package:bloc_counter/models/users_models/data.dart';
import 'package:bloc_counter/models/users_models/users.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitialState());
  List<Data> usersDataList = [];
  String supportText = "";
  String message;

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is UsersInitialEvent) {
      yield UsersLoadingState();
      Map<String, dynamic> usersdata = await getUsersData();

      if (usersdata["success"] == true) {
        Map<String, dynamic> jsonData = usersdata["data"];
        Users usersData = Users.fromJson(jsonData);
        usersDataList = usersData.data;
        supportText = usersData.support.text;

        yield UsersLoadedState();
      } else {
        message = usersdata["data"];
        yield UsersFailureState();
      }
    }
  }
}
