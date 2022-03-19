import 'package:freshdi_test/core/constants/api_path.dart';
import 'package:freshdi_test/data/client/api_client.dart';
import 'package:freshdi_test/data/models/request_method.dart';
import 'package:freshdi_test/data/models/request_response.dart';
import 'package:freshdi_test/modules/auth/components/models/login_model.dart';

class LoginRepo {
  final ApiClient _client;

  LoginRepo() : _client = ApiClient();

  Future<bool> login(LoginModel model) async {
    try {
      RequestResponse res = await _client.fetch(
        ApiPath.login,
        RequestMethod.post,
        data: model.toMap(),
      );


      if (res.message == 'Logged In') {
        return true;
      } else {
        throw res.error!.messages;
      }
    } catch (e) {
      rethrow;
    }
  }
}
