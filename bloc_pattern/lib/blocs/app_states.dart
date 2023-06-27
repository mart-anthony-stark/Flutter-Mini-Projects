import 'package:bloc_pattern/models/user_model.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/cupertino.dart';

@immutable
abstract class UserState extends Equatable {}

// Data loading state
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

// Data loaded state
class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object?> get props => [users];
}

// Data error loading state
class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
