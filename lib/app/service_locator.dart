import 'package:get_it/get_it.dart';
import 'package:state_management_practice_ostad/app/set_up_dio.dart';
import 'package:state_management_practice_ostad/core/network_executor/error_mapper/default_error_mapper.dart';
import 'package:state_management_practice_ostad/core/network_executor/network_executor.dart';
import 'package:state_management_practice_ostad/features/users/data/data_source/user_data_source.dart';
import 'package:state_management_practice_ostad/features/users/data/data_source/user_remote_data_source.dart';
import 'package:state_management_practice_ostad/features/users/data/repositories/user_repository_impl.dart';
import 'package:state_management_practice_ostad/features/users/domain/repositories/user_repositories.dart';
import 'package:state_management_practice_ostad/features/users/domain/usecases/fetch_users_use_case.dart';

//Registry
final GetIt serviceLocator = GetIt.instance;

void setUpServiceLocator() {
  //Singleton
  //LazySingleton
  //Factory

  serviceLocator.registerSingleton(
    NetworkExecutor(
      errorMapper: DefaultErrorMapper(onAuthorize: () {}),
      dio: getDioInstance(),
    ),
  );
  serviceLocator.registerSingleton<UserDataSource>(
    UserRemoteDataSource(serviceLocator()),
  );

  serviceLocator.registerSingleton<UserRepository>(
    UserRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerSingleton<FetchUsersUseCase>(
    FetchUsersUseCase(serviceLocator()),
  );

}
