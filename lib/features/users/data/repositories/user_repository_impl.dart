import 'package:dartz/dartz.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/api_error.dart';
import 'package:state_management_practice_ostad/features/users/data/data_source/user_data_source.dart';
import 'package:state_management_practice_ostad/features/users/domain/entities/user.dart';
import 'package:state_management_practice_ostad/features/users/domain/repositories/user_repositories.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  @override
  Future<Either<ApiError, List<User>>> fetchUsers() async {
    final response = await userDataSource.getUsers();
    return response.fold((l) => Left(l), (userModel) {
      final List<User> userList = userModel.map((e) => e.toEntity()).toList();
      return Right(userList);
    });
  }
}
