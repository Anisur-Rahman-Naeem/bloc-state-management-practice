import 'package:youtube_bloc_clean_coding/config/app_url.dart';
import 'package:youtube_bloc_clean_coding/data/network/network_services_api.dart';
import 'package:youtube_bloc_clean_coding/models/user/user_model.dart';

class LoginRepository {

  final _api = NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }
}