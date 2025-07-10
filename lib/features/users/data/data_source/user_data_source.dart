import 'package:dartz/dartz.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/api_error.dart';
import 'package:state_management_practice_ostad/features/users/data/models/user_model.dart';

abstract class UserDataSource {
  Future<Either<ApiError, List<UserModel>>> getUsers();
}