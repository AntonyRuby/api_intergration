part of 'userspost_bloc.dart';

abstract class UsersPostEvent extends Equatable {
  const UsersPostEvent();

  @override
  List<Object> get props => [];
}

class UsersPostInitialEvent extends UsersPostEvent {}

class UsersPostSubmitEvent extends UsersPostEvent {
  final String name;
  final String job;

  UsersPostSubmitEvent(this.name, this.job);
}
