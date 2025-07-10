import 'package:dartz/dartz.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/api_error.dart';
import 'package:state_management_practice_ostad/features/users/domain/entities/user.dart';
abstract class UserRepository {
  Future<Either<ApiError, List<User>>> fetchUsers();
}