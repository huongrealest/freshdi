import 'package:freshdi_test/modules/auth/components/repos/login_repo.dart';
import 'package:freshdi_test/modules/auth/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepo());
    Get.lazyPut(() => LoginController(Get.find<LoginRepo>()));
  }
}
