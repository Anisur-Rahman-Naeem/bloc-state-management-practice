import 'package:state_management_practice_ostad/features/common/domain/entities/api_error.dart';
import 'package:state_management_practice_ostad/features/users/domain/entities/user.dart';

sealed class FetchUsersState {}

class FetchUsersInitialState extends FetchUsersState{}

class FetchUsersLoadingState extends FetchUsersState{}

class FetchUsersFetchedState extends FetchUsersState{
  final List<User> users;

  FetchUsersFetchedState({required this.users});
}

class FetchUsersFailedState extends FetchUsersState{
  final ApiError apiError;

  FetchUsersFailedState({required this.apiError});
}

