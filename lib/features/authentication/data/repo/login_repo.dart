import '../../../../core/network/endpoints.dart';
import '../../../../core/network/network_helper.dart';
import '../models/user.dart';

abstract class LoginRepo {
  static Future<UserModel> login(
      {required String? username, required String? password}) async {
    var result = await NetworkHelper.instance.post(
      endPoint: EndPoints.LOGIN,
      params: {"email": username, "password": password},
      withToken: false,
    );
    return UserModel.fromJson(result.data);
  }
}
