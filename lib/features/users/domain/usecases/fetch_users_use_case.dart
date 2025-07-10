import 'package:dartz/dartz.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/api_error.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/no_params.dart';
import 'package:state_management_practice_ostad/features/common/domain/use_cases/use_cases.dart';
import 'package:state_management_practice_ostad/features/users/domain/entities/user.dart';
import 'package:state_management_practice_ostad/features/users/domain/repositories/user_repositories.dart';

class FetchUsersUseCase implements UseCase<Either<ApiError, List<User>>, NoParams>{
  final UserRepository userRepository;

  FetchUsersUseCase(this.userRepository);

  @override
  Future<Either<ApiError, List<User>>> call(NoParams params) async {
    return await userRepository.fetchUsers();
  }
}