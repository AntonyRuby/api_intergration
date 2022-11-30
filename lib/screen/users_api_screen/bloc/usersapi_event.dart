part of 'usersapi_bloc.dart';

abstract class UsersapiEvent extends Equatable {
  const UsersapiEvent();

  @override
  List<Object> get props => [];
}

class UsersApiInitialEvent extends UsersapiEvent {}

class UsersApiSubmitEvent extends UsersapiEvent {}

class UsersApiAddEvent extends UsersapiEvent {}

class UsersApiEditEvent extends UsersapiEvent {}

class UsersApiDeleteEvent extends UsersapiEvent {}
