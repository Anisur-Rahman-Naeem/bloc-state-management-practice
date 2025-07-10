import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_practice_ostad/app/service_locator.dart';
import 'package:state_management_practice_ostad/features/common/domain/entities/no_params.dart';
import 'package:state_management_practice_ostad/features/users/domain/usecases/fetch_users_use_case.dart';
import 'package:state_management_practice_ostad/features/users/presentation/blocs/fetch_users/fetch_users_states.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  FetchUsersCubit() : super(FetchUsersInitialState());

  Future<void> getUsers() async {
    emit(FetchUsersLoadingState());
    final fetchedUsersUseCase = serviceLocator<FetchUsersUseCase>();
    final response = await fetchedUsersUseCase.call(NoParams());

    response.fold(
      (l) => emit(FetchUsersFailedState(apiError: l)),
      (r) => emit(FetchUsersFetchedState(users: r)),
    );
  }
}
