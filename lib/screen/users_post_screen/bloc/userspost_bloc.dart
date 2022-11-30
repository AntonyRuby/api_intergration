import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter/http/repository/home_repository.dart';
import 'package:bloc_counter/models/usersPost_model/users_post.dart';
import 'package:equatable/equatable.dart';

part 'userspost_event.dart';
part 'userspost_state.dart';

class UsersPostBloc extends Bloc<UsersPostEvent, UsersPostState> {
  UsersPostBloc() : super(UsersPostInitialState());

  UsersPost userspost;
  String message;

  @override
  Stream<UsersPostState> mapEventToState(
    UsersPostEvent event,
  ) async* {
    if (event is UsersPostSubmitEvent) {
      yield UsersPostLoadingState();
      Map<String, dynamic> usersData =
          await usersPostData(event.name, event.job);
      if (usersData["success"] == true) {
        Map<String, dynamic> jsonData = usersData["data"];
        userspost = UsersPost.fromJson(jsonData);
        yield UsersPostSuccessState();
      } else {
        message = usersData["data"];
      }
    }
  }
}
