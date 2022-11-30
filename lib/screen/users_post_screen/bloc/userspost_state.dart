part of 'userspost_bloc.dart';

abstract class UsersPostState extends Equatable {
  const UsersPostState();

  @override
  List<Object> get props => [];
}

class UsersPostInitialState extends UsersPostState {}

class UsersPostLoadingState extends UsersPostState {}

class UsersPostSuccessState extends UsersPostState {}

class UsersPostFailureState extends UsersPostState {}
