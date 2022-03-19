import 'package:freshdi_test/modules/auth/components/repos/login_repo.dart';
import 'package:freshdi_test/routes/routes.dart';
import 'package:freshdi_test/utils/ui/app_dialog.dart';
import 'package:get/get.dart';

import 'components/models/login_model.dart';

class LoginController extends GetxController {
  final LoginRepo _repo;

  LoginController(this._repo);

  final LoginModel model = LoginModel.empty();

  Future<void> login() async {
    AppDialogs.showLoadingCircle();
    try {
      if (await _repo.login(model)) {
        Get.back();
        Get.toNamed(Routes.upsertBatch);
      }
    } catch (e) {
      print(e);
      Get.back();
      model.password.value = '';
    }
    update();
  }
}
