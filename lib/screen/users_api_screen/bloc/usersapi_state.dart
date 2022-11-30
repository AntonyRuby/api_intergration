part of 'usersapi_bloc.dart';

abstract class UsersapiState extends Equatable {
  const UsersapiState();

  @override
  List<Object> get props => [];
}

class UsersapiInitialState extends UsersapiState {}

class UsersapiLoadingState extends UsersapiState {}

class UsersapiLoadedState extends UsersapiState {}

class UsersapiSuccessfulState extends UsersapiState {}

class UsersapiFailureState extends UsersapiState {}
